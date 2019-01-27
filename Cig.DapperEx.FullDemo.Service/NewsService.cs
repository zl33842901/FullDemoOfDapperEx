using Cig.DapperEx.FullDemo.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using xLiAd.DapperEx.Repository;

namespace Cig.DapperEx.FullDemo.Service
{
    public class NewsService : Repository<News>, INewsService
    {
        public NewsService(string connectionString) : base(connectionString)
        {
        }

        //public NewsService(SqlConnection _con) : base(_con)
        //{
        //}
    }

    public interface INewsService : IRepository<News>
    {

    }
}
