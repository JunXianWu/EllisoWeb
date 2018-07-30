using CPBinMap.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace CPBinMap.Services
{
    public interface MapService
    {
        string CallRFuncByModel(BinMapModel bmm);
        string CallRFuncByFile(BinMapModel bmm);
    }
}