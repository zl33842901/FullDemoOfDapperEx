using Cig.DapperEx.FullDemo.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using xLiAd.DapperEx.MsSql.Core.Helper;

namespace WebForm
{
    public partial class Index : System.Web.UI.Page
    {
        protected int dictId;
        protected bool? deleted;
        protected string keyword;
        protected int pagesize;
        protected int page;
        protected void Page_Load(object sender, EventArgs e)
        {
            dictId = Request["dictid"].ToInt();
            deleted = Request["deleted"] == "1" ? true : (Request["deleted"] == "2" ? (bool?)false : null);
            keyword = Request["keyword"];
            pagesize = Request["pagesize"].ToInt(10);
            page = Request["page"].ToInt(1);
            if (pagesize < 1) pagesize = 10;
            if (page < 1) page = 1;
            var ld = InitX.Instance.dictInfoService.WhereSelect(x => x.DictID < 100021, x => new KeyValuePair<int, string>(x.DictID, x.DictName));
            RptDict.DataSource = ld;
            RptDict.DataBind();

            pagesize = pagesize < 1 ? 10 : pagesize;
            page = page < 1 ? 1 : page;
            Expression<Func<News, bool>> expression = null;
            int on = dictId;
            if (on > 0)
            {
                expression = expression.And(x => x.DictID == on);
            }
            if (deleted != null)
            {
                if (deleted.Value)
                    expression = expression.And(x => x.Deleted);
                else
                    expression = expression.And(x => !x.Deleted);
            }
            if (!keyword.NullOrEmpty())
            {
                expression = expression.And(x => x.Title.Contains(keyword));
            }
            var l = InitX.Instance.newsService.PageList(expression, x => x.Id, page, pagesize, true);
            RptContent.DataSource = l.Items;
            RptContent.DataBind();
            RptPager.DataSource = Enumerable.Range(1, l.TotalPage);
            RptPager.DataBind();
        }
    }
}