using Cig.DapperEx.FullDemo.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebForm
{
    /// <summary>
    /// h 的摘要说明
    /// </summary>
    public class h : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            var action = context.Request["a"];
            string rst = null;
            switch (action)
            {
                case "DelLogic":
                    rst = DelLogic(context.Request["id"].ToInt());
                    break;
                case "DelPhysic":
                    rst = DelPhysic(context.Request["id"].ToInt());
                    break;
            }
            context.Response.Write(rst);
        }
        public string DelLogic(int id)
        {
            News n = new News()
            {
                Deleted = true,
                Id = id
            };
            var rst = InitX.Instance.newsService.Update(n, x => x.Deleted);
            //var rst = newsService.UpdateWhere(x => x.Id == id, x => x.Deleted, true); //上边这几行 可以用这一行代替。
            return Newtonsoft.Json.JsonConvert.SerializeObject(new { Success = true, Result = rst });
        }
        public string DelPhysic(int id)
        {
            var rst = InitX.Instance.newsService.Delete(id);
            return Newtonsoft.Json.JsonConvert.SerializeObject(new { Success = true, Result = rst });
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}