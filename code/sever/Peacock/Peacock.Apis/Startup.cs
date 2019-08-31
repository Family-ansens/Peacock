﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Peacock.Apis.Filter;
using Peacock.Apis.Swagger;
using Peacock.Dal;
using Swashbuckle.AspNetCore.Swagger;

namespace Peacock.Apis
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
                setting.DateFormatString = "yyyy-MM-dd HH:mm:ss";

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

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = "Peacock.Apis", Version = "v1.0.0" });
                c.IncludeXmlComments(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Peacock.Apis.xml"));
                c.OperationFilter<SwaggerHttpHeaderOperation>();
            });

            services.AddCors(options =>
            {
                options.AddPolicy("allow_all", builder =>
                {
                    builder.AllowAnyOrigin() //允许任何来源的主机访问
                           .AllowAnyMethod()
                           .AllowAnyHeader()
                           .AllowCredentials();//指定处理cookie
                });
            });

            services.AddMvc(options =>
            {
                options.Filters.Add<ExceptionFilter>();
            }).SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseStaticFiles();

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Peacock.Apis v1.0.0");
            });

            app.UseCors("allow_all");
            app.UseMvc();
            //app.UseMvc(routes =>
            //{
            //    routes.MapRoute(
            //        name: "language",
            //        template: "{language=Chinese}/{controller}/{action}");
            //});
        }
    }
}
