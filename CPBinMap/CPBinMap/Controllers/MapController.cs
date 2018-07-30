using CPBinMap.Models;
using CPBinMap.Services;
using System.Web;
using System.Web.Mvc;

namespace CPBinMap.Controllers
{
    public class MapController : Controller
    {
        private readonly MapService mapService;

        public MapController(MapService mapService)
        {
            this.mapService = mapService;
        }

        public ActionResult Simulation()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Simulation(BinMapModel bmm)
        {
            bmm.ImagePath = mapService.CallRFuncByModel(bmm);
            return View(bmm);
        }

        public ActionResult Upload()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Upload(BinMapModel bmm, HttpPostedFileBase file)
        {
            var a = Request;
            if (file!=null && file.ContentLength > 0)
            {
                bmm.httpPostedFile = file;
                bmm.ImagePath = mapService.CallRFuncByFile(bmm);
            }
            return View(bmm);
        }
    }
}