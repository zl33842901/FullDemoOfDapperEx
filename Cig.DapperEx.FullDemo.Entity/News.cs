using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Cig.DapperEx.FullDemo.Entity
{
    [Table("Articles")]
    public class News
    {
        [Key]
        [Identity]
        public int Id { get; set; }
        public string Title { get; set; }
        public int DictID { get; set; } 
        public DateTime CreateTime { get; set; }
        public string CreateTimeString => CreateTime.ToString("yyyy-MM-dd HH:mm:ss");
        public bool Deleted { get; set; }
        [NotMapped]
        public string DictName { get; set; }

        public override string ToString()
        {
            return Newtonsoft.Json.JsonConvert.SerializeObject(this);
        }
    }
}
