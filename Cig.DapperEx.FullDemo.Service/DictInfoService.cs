using Cig.DapperEx.FullDemo.Entity;
using System;
using System.Data.SqlClient;
using xLiAd.DapperEx.MsSql.Core;
using xLiAd.DapperEx.Repository;

namespace Cig.DapperEx.FullDemo.Service
{
    public class DictInfoService : Repository<DictInfo>, IDictInfoService
    {
        public DictInfoService(string connectionString, RepoXmlProvider repo) : base(connectionString, repo)
        {
        }

        //public DictInfoService(SqlConnection _con, RepoXmlProvider repo) : base(_con, repo)
        //{
        //}

        public int TransInsert(News n, DictInfo d)
        {
            try {
                var rst = 0;
                con.Transaction(tc =>
                {
                    rst += tc.CommandSet<News>().Insert(n);
                    rst += tc.CommandSet<DictInfo>().Insert(d);
                });
                return rst;
            }catch(Exception e)
            {
                return 0;
            }
        }
    }

    public interface IDictInfoService : IRepository<DictInfo>
    {
        int TransInsert(News n, DictInfo d);
    }
}
