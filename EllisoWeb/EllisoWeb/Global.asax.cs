using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Elliso.Web.IoC;
using Elliso.Data;
using Base.Data.Infrastructure;
using Elliso.Domain;
using Elliso.Service;
using Elliso.ServiceImpl;
using Elliso.Web.Helpers;
using System.Data.Entity;
using Microsoft.Practices.Unity;
using Elliso.App_Start;

namespace Elliso
{
    // 注意: 如需啟用 IIS6 或 IIS7 傳統模式的說明，
    // 請造訪 http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterAuth();
            IUnityContainer container = GetUnityContainer();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
            BackgroundWork bw = new BackgroundWork();
            bw.StartWork();
        }

        private IUnityContainer GetUnityContainer()
        {
            //Create UnityContainer          
            IUnityContainer container = new UnityContainer()
            .RegisterType<IDatabaseFactory, DatabaseFactory>(new HttpContextLifetimeManager<IDatabaseFactory>())
            .RegisterType<IUnitOfWork, UnitOfWork>(new HttpContextLifetimeManager<IUnitOfWork>())
            .RegisterType<IEllisoRepository, EllisoRepository>(new HttpContextLifetimeManager<IEllisoRepository>())
            .RegisterType<IEllisoService, EllisoService>(new HttpContextLifetimeManager<IEllisoService>());
             return container;
        }

        protected void Application_BeginRequest(Object sender, EventArgs e)
        {
            HttpCookie MyLang = Request.Cookies["lang"];
            if (MyLang != null)
            {
                System.Threading.Thread.CurrentThread.CurrentCulture =
                    new System.Globalization.CultureInfo(MyLang.Value);
                System.Threading.Thread.CurrentThread.CurrentUICulture =
                    new System.Globalization.CultureInfo(MyLang.Value);
            }
        }
    }
}