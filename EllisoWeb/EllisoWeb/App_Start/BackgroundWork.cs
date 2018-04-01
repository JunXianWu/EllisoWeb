using System;
using System.Collections.Generic;
using System.Web;
using System.Threading;
using System.IO;
using Base.Data;
using Base.Data.Infrastructure;
using System.Collections;
using System.Linq;
using Elliso.ServiceImpl;

namespace Elliso.App_Start
{
    public class BackgroundWork
    {
        public static object oLock = new object();
        private static Timer timer;
        private static DateTime initDate = DateTime.Now;
        private readonly EllisoService ellisoService = new EllisoService();

        // 開始背景作業
        public void StartWork()
        {
            TimeSpan delayTime = new TimeSpan(0, 0, 0); // 應用程式起動後多久開始執行
            TimeSpan intervalTime = new TimeSpan(0, 1, 0); // 應用程式起動後間隔多久重複執行
            TimerCallback timerDelegate = new TimerCallback(BatchMethod);  // 委派呼叫方法
            timer = new Timer(timerDelegate, null, delayTime, intervalTime);  // 產生 timer
        }

        // 背景批次方法
        private void BatchMethod(object pStatus)
        {
            lock (oLock)
            {
                DateTime nowDate = DateTime.Now;
                TimeSpan ts = new TimeSpan(nowDate.Ticks - initDate.Ticks);
                int minute = ts.Minutes;

                //程式啟動後每10分鐘執行一次
                if (minute % 10 == 0)
                {
                    ellisoService.ScheduleElliso();
                }
            }
        }
    }
}
