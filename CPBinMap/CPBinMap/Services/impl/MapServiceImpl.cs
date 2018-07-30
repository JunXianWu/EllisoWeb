using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using CPBinMap.Models;

namespace CPBinMap.Services.impl
{
    public class MapServiceImpl : MapService
    {
        public string CallRFuncByFile(BinMapModel bmm)
        {
            string imagePath = "~/Content/Images/wafer1.png";
            return imagePath;
        }

        public string CallRFuncByModel(BinMapModel bmm)
        {
            string imagePath = "~/Content/Images/wafer1.png";
            return imagePath;
        }
    }
}