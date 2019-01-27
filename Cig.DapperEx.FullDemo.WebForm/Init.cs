using Cig.DapperEx.FullDemo.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using xLiAd.DapperEx.Repository;

namespace WebForm
{
    public class InitX
    {
        RepoXmlProvider repoXmlProvider;
        String Connection;
        string BudgetExcelConnection;
        #region 确保单例
        static object forLock = new object();
        static InitX _instance;
        public static InitX Instance
        {
            get
            {
                if(_instance == null)
                {
                    lock (forLock)
                    {
                        if (_instance == null)
                            _instance = new InitX();
                    }
                }
                return _instance;
            }
        }
        private InitX()
        {
            var xmlPath = System.IO.Directory.GetCurrentDirectory() + "\\Xml\\sql.xml";
            repoXmlProvider = new RepoXmlProvider(xmlPath);
            Connection = System.Configuration.ConfigurationManager.AppSettings["Connection"];
            BudgetExcelConnection = System.Configuration.ConfigurationManager.AppSettings["BudgetExcelConnection"];
        }
        #endregion

        public INewsService newsService
        {
            get
            {
                return new NewsService(Connection);
            }
        }
        public IDictInfoService dictInfoService
        {
            get
            {
                return new DictInfoService(Connection, repoXmlProvider);
            }
        }
        public IBudgetPreExcelService budgetPreExcelService
        {
            get
            {
                return new BudgetPreExcelService(BudgetExcelConnection, repoXmlProvider);
            }
        }
    }
}