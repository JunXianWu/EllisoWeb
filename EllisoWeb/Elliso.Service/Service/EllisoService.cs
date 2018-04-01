using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Elliso.Domain;
using Elliso.Data;
using Base.Data.Infrastructure;
using System.Collections;

namespace Elliso.Service
{
    /// <summary>
    /// UserService Interface
    /// </summary>
    public interface IEllisoService
    {
        /// <summary>
        /// Elliso for Schedule
        /// </summary>
        void ScheduleElliso();

        /// <summary>
        /// Create Elliso from User Input
        /// </summary>
        /// <param name="em"></param>
        void CreateElliso(EllisoModel em);

        /// <summary>
        /// Commit
        /// </summary>
        void Save();
    }
}
