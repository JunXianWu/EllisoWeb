using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace T600205.Models
{
    public static class ModelRepository
    {
        private static string SessionField = "Data";
        public static List<Model> GetData()
        {
            if (HttpContext.Current.Session[SessionField] == null)
            {
                HttpContext.Current.Session[SessionField] = Enumerable.Range(0, 10).Select(i => new Model
                {
                    ID = i,
                    Text = "Text" + i,
                    TestDate = DateTime.Now.AddDays(i).AddHours(i).AddMinutes(i).AddSeconds(i).AddMilliseconds(i)
                }).ToList<Model>();
            }
            return (List<Model>)HttpContext.Current.Session[SessionField];
        }
    }
    public class Model
    {
        public int ID { get; set; }
        public string Text { get; set; }
        public DateTime TestDate { get; set; }
    }
}