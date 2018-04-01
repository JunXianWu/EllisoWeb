using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using Elliso.Domain;

namespace Base.Data
{
    public class BaseContext : DbContext
    {
        public DbSet<EllisoEntity> vc_quotn_Employee { get; set; }

        public BaseContext()
            : base("name=" + System.Environment.MachineName)
        {
            Database.SetInitializer(new CreateDatabaseIfNotExists<BaseContext>());
        }

        public virtual void Commit()
        {
            base.SaveChanges();
        }
    }

    public class BaseContextInitializer : DropCreateDatabaseIfModelChanges<BaseContext>
    {
    }
}