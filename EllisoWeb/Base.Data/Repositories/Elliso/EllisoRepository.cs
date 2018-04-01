using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Elliso.Domain;
using Base.Data.Infrastructure;
using System.Data;

namespace Elliso.Data
{

    public class EllisoRepository : RepositoryBase<EllisoEntity>, IEllisoRepository
    {
        public EllisoRepository(IDatabaseFactory databaseFactory)
            : base(databaseFactory)
        {
        }
    }

    public interface IEllisoRepository : IRepository<EllisoEntity>
    {
    }
}
