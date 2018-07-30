using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPBinMap.Models
{
    public class BinMapModel
    {
        public string Param1 { get; set; }
        public string Param2 { get; set; }
        public string Param3 { get; set; }
        public string Param4 { get; set; }
        public string Param5 { get; set; }

        public string ImagePath { get; set; }
        public HttpPostedFileBase httpPostedFile { get; set; }
    }
}