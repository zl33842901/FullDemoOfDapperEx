using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Cig.DapperEx.FullDemo.Entity;
using Cig.DapperEx.FullDemo.Service;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json.Serialization;
using xLiAd.DapperEx.Repository;

namespace Cig.DapperEx.FullDemo.WebApp
{
    public class Startup
    {
        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
                .AddEnvironmentVariables();
            Configuration = builder.Build();

            //Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
        }
        public IConfigurationRoot Configuration { get; }
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            //services.Configure<Cig.DapperEx.FullDemo.Entity.SettingConfigration>(Configuration.GetSection("ConnectionStrings"));
            //获取数据库配置
            var conf = Configuration.GetSection("ConnectionStrings").Get<SettingConfigration>();
            //使用类似 mybatis 的XML方式存SQL语句时，需要下边这个对象，否则不需要。
            var xmlPath = System.IO.Directory.GetCurrentDirectory() + "\\Xml\\sql.xml";
            RepoXmlProvider repoXmlProvider = new RepoXmlProvider(xmlPath);
            //注意，这个 数据库访问层对象，不要使用单例。
            services.AddScoped<IDictInfoService>(x => new DictInfoService(conf.DefaultConnection, repoXmlProvider));
            services.AddScoped<INewsService>(x => new NewsService(conf.DefaultConnection));
            services.AddMvc(config =>
            {
                //var policy = new AuthorizationPolicyBuilder()
                //    .RequireAuthenticatedUser()
                //    .Build();
                //config.Filters.Add(new AuthorizeFilter(policy));
            })
            .AddJsonOptions(opt =>
            {
                var resolver = opt.SerializerSettings.ContractResolver;
                if (resolver != null)
                {
                    var res = resolver as DefaultContractResolver;
                    res.NamingStrategy = null;  // <<!-- this removes the camelcasing
                }
                opt.SerializerSettings.DateTimeZoneHandling = Newtonsoft.Json.DateTimeZoneHandling.Local;
            });
            services.AddMemoryCache();
            services.AddSession();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseStaticFiles();
            app.UseSession();
            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Default}/{id?}");
            });
            //app.Run(async (context) =>
            //{
            //    await context.Response.WriteAsync("Hello World!");
            //});
        }
    }
}
