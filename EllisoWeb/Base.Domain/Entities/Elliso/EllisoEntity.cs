using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Elliso.Domain
{
    [Table("Elliso")]
    public class EllisoEntity
    {
        [Key]
        [DisplayName("員工ID")]
        public string EmployeeId { get; set; }

        [DisplayName("員工AD")]
        public string EmployeeAd { get; set; }

        [DisplayName("員工名稱")]
        public string EmployeeName { get; set; }

        [DisplayName("部門別")]
        public string DepartmentId { get; set; }

        [DisplayName("是否啟用")]
        public byte Enabled { get; set; }

        [DisplayName("群組ID")]
        public int GrpId { get; set; }

        [DisplayName("建立日期")]
        public DateTime CreateTime { get; set; }

        [DisplayName("建立者")]
        public string Creator { get; set; }

        [DisplayName("更新日期")]
        public DateTime UpdateTime { get; set; }

        [DisplayName("更新者")]
        public string Updator { get; set; }
    }
}