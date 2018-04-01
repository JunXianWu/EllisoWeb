using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Base.Data;

namespace Base.Data.Infrastructure
{
public class DatabaseFactory : Disposable, IDatabaseFactory
{
    private BaseContext dataContext;
    public BaseContext Get()
    {
        return dataContext ?? (dataContext = new BaseContext());
    }
    protected override void DisposeCore()
    {
        if (dataContext != null)
            dataContext.Dispose();
    }
}
}
