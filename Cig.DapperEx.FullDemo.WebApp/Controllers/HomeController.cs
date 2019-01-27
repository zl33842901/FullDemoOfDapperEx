using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Cig.DapperEx.FullDemo.Entity;
using Cig.DapperEx.FullDemo.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Primitives;
using xLiAd.DapperEx.MsSql.Core.Helper;
using xLiAd.DapperEx.QueryHelper;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Cig.DapperEx.FullDemo.WebApp.Controllers
{
    public class HomeController : Controller
    {
        IDictInfoService dictInfoService;
        INewsService newsService;
        public HomeController(IDictInfoService dictInfoService, INewsService newsService)
        {
            this.dictInfoService = dictInfoService;
            this.newsService = newsService;
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Default()
        {
            return View();
        }
        public IActionResult Query(string ordernum, string deleted, string keyword)
        {
            Expression<Func<DictInfo, bool>> expression = null;
            int on = ordernum.ToInt();
            if (on > 0)
            {
                expression = expression.And(x => x.OrderNum == (OrderEnum)on);
            }
            if(deleted.ToInt() > 0)
            {
                if (deleted == "1")
                    expression = expression.And(x => x.Deleted);
                else
                    expression = expression.And(x => !x.Deleted);
            }
            if (!keyword.NullOrEmpty())
            {
                expression = expression.And(x => x.DictName.Contains(keyword) || x.Remark.Contains(keyword));
            }


            var l = dictInfoService.Where(expression);
            ViewBag.data = l;
            return View();
        }
        public IActionResult QueryXml()
        {
            var l = dictInfoService.QueryXml<News>("JoinSelect");
            ViewBag.data = l;
            return View();
        }
        public IActionResult PageListQueryHelper()
        {
            #region 引入参数
            var nv = (Request.Query as IEnumerable<KeyValuePair<string, StringValues>>).ToNameValue();
            #endregion
            #region 选择框
            var lls = dictInfoService.WhereSelect(x => x.DictID < 100021, x => new KeyValuePair<int, string>(x.DictID, x.DictName));
            ViewBag.dict = lls;
            #endregion
            return View();
        }
        [HttpPost]
        public IActionResult PageListQueryHelperData()
        {
            var nv = (Request.Form as IEnumerable<KeyValuePair<string, StringValues>>).ToNameValue();

            QueryParamProvider<News> query = new QueryParamProvider<News>();
            query.AddItem(x => x.DictID);
            query.AddItem(x => x.Deleted);
            query.AddItem(x => x.Title, QueryParamProviderOprater.Contains, null, "keyword");
            var expression = query.GetExpression(nv);

            QueryParamJoiner<News> qj = new QueryParamJoiner<News>();
            qj.AddItem<DictInfo, int>(dictInfoService, x => x.DictName, QueryParamJoinerOprater.Contains, x => x.DictID, x => x.DictID, null, "keyworddic");
            var eee = qj.GetExpression(nv);
            expression = expression.And(eee);

            var l = newsService.PageList(expression, x => x.Id, query.PageIndex ?? 1, query.PageSize ?? 20, true);
            l.Items.LeftJoin(dictInfoService, x => x.DictID, x => x.DictID, (x, y) => x.DictName = y.DictName, out var _, x => x.DictName);
            return Json(l);
        }
        public IActionResult PageList()
        {
            #region 选择框
            var lls = dictInfoService.WhereSelect(x => x.DictID < 100021, x => new KeyValuePair<int,string>( x.DictID, x.DictName ));
            ViewBag.dict = lls;
            #endregion
            return View();
        }
        public IActionResult PageListData(string dictid, string deleted, string keyword, int pagesize, int page)
        {
            pagesize = pagesize < 1 ? 10 : pagesize;
            page = page < 1 ? 1 : page;
            Expression<Func<News, bool>> expression = null;
            int on = dictid.ToInt();
            if (on > 0)
            {
                expression = expression.And(x => x.DictID == on);
            }
            if (!deleted.NullOrEmpty())
            {
                if (deleted == "True")
                    expression = expression.And(x => x.Deleted);
                else
                    expression = expression.And(x => !x.Deleted);
            }
            if (!keyword.NullOrEmpty())
            {
                expression = expression.And(x => x.Title.Contains(keyword));
            }
            var l = newsService.PageList(expression, x => x.Id, page, pagesize, true);
            return Json(l);
        }

        public IActionResult GetAllDict()
        {
            var lls = dictInfoService.WhereSelect(x => x.DictID < 100021, x => new KeyValuePair<int, string>(x.DictID, x.DictName));
            return Json(new { Result = lls });
        }

        public IActionResult Edit(string id)
        {
            var idint = id.ToInt();
            News n;
            if (idint > 0)
            {
                n = newsService.Find(idint);
            }
            else
            {
                n = new News();
            }
            ViewBag.Model = n;
            return View();
        }
        [HttpPost]
        public IActionResult Edit(News n)
        {
            int rst;
            if(n.Id <= 0)
            {
                n.CreateTime = DateTime.Now;
                rst = newsService.Add(n);
            }
            else
            {
                rst = newsService.Update(n);
            }
            return Json(new { Success = true, Result = rst });
        }
        [HttpPost]
        public IActionResult DelLogic(int id)
        {
            News n = new News()
            {
                Deleted = true,
                Id = id
            };
            var rst = newsService.Update(n, x => x.Deleted);
            //var rst = newsService.UpdateWhere(x => x.Id == id, x => x.Deleted, true); //上边这几行 可以用这一行代替。
            return Json(new { Success = true, Result = rst });
        }
        [HttpPost]
        public IActionResult DelPhysic(int id)
        {
            var rst = newsService.Delete(id);
            return Json(new { Success = true, Result = rst });
        }

        public IActionResult Trans()
        {
            News n = new News();
            DictInfo d = new DictInfo();
            ViewBag.Model = new { News = n, Dict = d };
            return View();
        }
        [HttpPost]
        public IActionResult Trans(VModel m)
        {
            m.News.CreateTime = DateTime.Now;
            var r = dictInfoService.TransInsert(m.News, m.Dict);
            if (r > 0)
            {
                return Json(new { Success = true, Result = r });
            }
            else
            {
                return Json(new { Success = false, Result = 0 });
            }
        }

        public class VModel
        {
            public News News { get; set; }
            public DictInfo Dict { get; set; }
        }
    }
}
