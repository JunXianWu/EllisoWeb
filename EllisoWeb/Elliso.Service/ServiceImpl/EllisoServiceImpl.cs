using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Elliso.Domain;
using Elliso.Data;
using Elliso.Service;
using Base.Data.Infrastructure;
using System.Collections;

namespace Elliso.ServiceImpl
{
    public class EllisoService : IEllisoService
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly IEllisoRepository ellisoRepository;

        public EllisoService()
        {
        }

        public EllisoService(IEllisoRepository ellisoRepository, IUnitOfWork unitOfWork)
        {
            this.ellisoRepository = ellisoRepository;
            this.unitOfWork = unitOfWork;
        }

        public void ScheduleElliso()
        {

        }

        public void CreateElliso(EllisoModel em)
        {

        }

        public void Save()
        {
            unitOfWork.Commit();
        }
      
    }
}
