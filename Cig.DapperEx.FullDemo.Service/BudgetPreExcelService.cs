using Cig.DapperEx.FullDemo.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using xLiAd.DapperEx.Repository;

namespace Cig.DapperEx.FullDemo.Service
{
    public class BudgetPreExcelService : Repository<BudgetPreExcel>, IBudgetPreExcelService
    {
        public BudgetPreExcelService(string connectionString, RepoXmlProvider repo) : base(connectionString, repo)
        {
        }
    }
    public interface IBudgetPreExcelService : IRepository<BudgetPreExcel>
    {

    }
}
