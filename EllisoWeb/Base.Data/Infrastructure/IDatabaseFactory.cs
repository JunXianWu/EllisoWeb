using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Base.Data;

namespace Base.Data.Infrastructure
{
    public interface IDatabaseFactory : IDisposable
    {
        BaseContext Get();
    }
}
