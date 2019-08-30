using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Peacock.Apis.Models;
using Peacock.Dal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Controllers
{
    [Route("company")]
    public class CompanyController : BaseApiController
    {
        public CompanyController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
        }

        /// <summary>
        /// 获取公司列表，包括简介，不包含富文本
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("list")]
        public PageResponseDto<CompanyResDto> GetList(BasePageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Company.Where(i => !i.IsDeleted);
            int count = query.Count();
            var list = query.Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                            .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                            .OrderByDescending(o => o.OrderId)
                            .Skip(search.Skip)
                            .Take(search.size)
                            .Select(c => new CompanyResDto
                            {
                                Id = c.ID,
                                Title = c.LanguageRelationByTitle.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                Introduction = c.LanguageRelationByIntroduction.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                Img = c.ImgPath,
                            }).ToList();
            var result = new PageResponseDto<CompanyResDto>()
            {
                success = true,
                count = count,
                rows = list,
            };
            return result;
        }


        /// <summary>
        /// 获取公司列表，包括富文本，不包括简介
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("list-detail")]
        public PageResponseDto<CompanyResDto> GetDetailList(BasePageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Company.Where(i => !i.IsDeleted);
            int count = query.Count();
            var list = query.Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                            .Include(i => i.LanguageRelationByContent).ThenInclude(i => i.TSystemLanguageContent)
                            .OrderByDescending(o => o.OrderId)
                            .Skip(search.Skip)
                            .Take(search.size)
                            .Select(c => new CompanyResDto
                            {
                                Id = c.ID,
                                Title = c.LanguageRelationByTitle.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                Content = c.LanguageRelationByContent.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                Img = c.ImgPath,
                            }).ToList();
            var result = new PageResponseDto<CompanyResDto>()
            {
                success = true,
                count = count,
                rows = list,
            };
            return result;
        }
    }
}
