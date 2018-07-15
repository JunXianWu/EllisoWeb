using DevExpress.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using T600205.Models;

namespace T600205.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        //[ValidateInput(false)]
        //public ActionResult CardViewPartial(int? colCount)
        //{
        //    ViewBag.ColCount = colCount;
        //    var model = ModelRepository.GetData();
        //    return PartialView("_CardViewPartial", model);
        //}
        [ValidateInput(false)]
        public ActionResult CardViewPartial(int? screenWidth)
        {
            if (screenWidth != null)
            {
                var cardWidth = 200; // From View
                ViewBag.ColCount = screenWidth.GetValueOrDefault() / cardWidth;
            }
            var model = ModelRepository.GetData();
            return PartialView("_CardViewPartial", model);
        }

        public ActionResult CallbackPanelPartial(int? screenWidth)
        {
            if (screenWidth != null)
            {
                var cardWidth = 200; // From View
                ViewBag.ColCount = screenWidth.GetValueOrDefault() / cardWidth;
            }
            return PartialView("_CallbackPanelPartial");
        }
    }
}