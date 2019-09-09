using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using MySql.Data.EntityFrameworkCore.Extensions;
using Newtonsoft.Json.Serialization;
using Peacock.BusinessLogic.Common;
using Peacock.Dal;

namespace Peacock.ManageWeb
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

            var setting = new JsonSerializerSettings();
            JsonConvert.DefaultSettings = () =>
            {
                //空值处理
                setting.NullValueHandling = NullValueHandling.Ignore;
                //首字母小写
                //setting.ContractResolver = new CamelCasePropertyNamesContractResolver();
                setting.ContractResolver = new DefaultContractResolver();

                return setting;
            };
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //注入数据库DbContext
            string dbType = Configuration["DbType"];
            if (dbType.Equals("SqlSever"))
            {
                string sqlConnectionStr = Configuration.GetConnectionString("PeacockSqlSeverProvider");
                services.AddDbContext<PeacockDbContext>(options =>
                    options.UseSqlServer(sqlConnectionStr)
                );
            }
            else if (dbType.Equals("MySql"))
            {
                string sqlConnectionStr = Configuration.GetConnectionString("PeacockMysqlProvider");
                services.AddDbContext<PeacockDbContext>(options =>
                    options.UseMySQL(sqlConnectionStr)
                );
            }

            services.AddLogging();

            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                .AddCookie(o => o.LoginPath = new PathString("/Account/Login"));

            // 注入服务
            services.AddTransient<MenuService>();


            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2)
                    .AddJsonOptions(options => {
                        options.SerializerSettings.ContractResolver = new DefaultContractResolver();
                        options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
                    });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                //app.UseHsts();
            }

            //app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseAuthentication();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "areaRoute",
                    template: "{area:exists}/{controller=User}/{action=Index}/{id?}");

                routes.MapRoute(
                   name: "default",
                   template: "{controller=User}/{action=Index}/{id?}");
            });
        }
    }
}
