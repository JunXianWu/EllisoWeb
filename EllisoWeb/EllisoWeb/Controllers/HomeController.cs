using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Base.Data;
using System.Collections;
using System.Web.Security;
using Elliso.Service;
using Elliso.Domain;

namespace Elliso.Controllers
{
    public class HomeController : Controller
    {
        private readonly IEllisoService ellisoService;

        public HomeController(IEllisoService ellisoService)
        {
            this.ellisoService = ellisoService;
        }

        public ActionResult Index(int page = 0)
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index()
        {
            EllisoModel em = new EllisoModel();
            ellisoService.CreateElliso(em);
            return View();
        }
    }
}
