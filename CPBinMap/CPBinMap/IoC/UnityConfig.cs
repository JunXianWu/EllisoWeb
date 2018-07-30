using CPBinMap.Services;
using CPBinMap.Services.impl;
using System.Web.Mvc;
using Unity;
using Unity.AspNet.Mvc;

namespace CPBinMap.IoC
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
            var container = new UnityContainer();
            container.RegisterType<MapService, MapServiceImpl>();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}