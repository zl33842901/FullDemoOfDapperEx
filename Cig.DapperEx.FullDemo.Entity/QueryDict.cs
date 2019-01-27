using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using xLiAd.DapperEx.MsSql.Core.Helper;

namespace Cig.DapperEx.FullDemo.Entity
{
    public class QueryDict
    {
        public string Name { get; set; }
        public string Bak { get; set; }
        public bool? delete { get; set; }
        public DateTime? startdate { get; set; }
        public DateTime? enddate { get; set; }
        public Expression<Func<DictInfo, bool>> Expression
        {
            get
            {
                Expression<Func<DictInfo, bool>> e = null;
                if (!string.IsNullOrWhiteSpace(Name))
                    e = e.And(x => x.DictName.Contains(Name));
                if (!string.IsNullOrWhiteSpace(Bak))
                    e = e.And(x => x.Remark.Contains(Bak));
                if (delete != null)
                    e = e.And(x => x.Deleted == delete);
                if (startdate != null)
                    e = e.And(x => x.CreateTime > startdate.Value);
                if (enddate != null)
                    e = e.And(x => x.CreateTime < enddate.Value);
                return e;
            }
        }
    }
}
