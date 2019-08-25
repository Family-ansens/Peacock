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
    /// <summary>
    /// 应用
    /// </summary>
    [Route("example")]
    public class ExampleController : BaseApiController
    {
        public ExampleController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
        }

        /// <summary>
        /// 获取应用分组列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("example-groups")]
        public PageResponseDto<ExampleGroupResDto> GetExampleGroups(BasePageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_ExampleGroup
                                 .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Where(i => !i.IsDeleted);
            int count = query.Count();
            var list = query.OrderBy(o => o.ID)
                            .Skip(search.Skip)
                            .Take(search.size)
                            .Select(c => new ExampleGroupResDto
                            {
                                ID = c.ID,
                                Code = c.Code,
                                Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                            }).ToList();
            var result = new PageResponseDto<ExampleGroupResDto>()
            {
                success = true,
                count = count,
                rows = list,
            };
            return result;
        }

        /// <summary>
        /// 获取应用列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("examples")]
        public PageResponseDto<ExampleResDto> GetExamples(ExamplePageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_Example
                                 .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                 .Where(i => !i.IsDeleted);
            if (!string.IsNullOrEmpty(search.Query))
            {
                search.Query = search.Query.Replace(" ", string.Empty);
                query = query.Where(i => i.LanguageRelationByName.TSystemLanguageContent
                                                .Any(a => a.DisplayContent.Contains(search.Query))
                                        || i.LanguageRelationByDescription.TSystemLanguageContent
                                                .Any(a => a.DisplayContent.Contains(search.Query)));
            }
            int count = query.Count();
            var entities = query.Skip(search.Skip).Take(search.size).OrderBy(o => o.OrderId).ToList();
            var list = entities.Select(c => new ExampleResDto
                        {
                            Id = c.ID,
                            Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                            ImgUrl = c.ImgPath,
                        }).ToList();
            var result = new PageResponseDto<ExampleResDto>()
            {
                count = count,
                rows = list,
                success = true,
            };
            return result;
        }

        /// <summary>
        /// 获取应用列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("newest-examples")]
        public PageResponseDto<ExampleResDto> GetNewestExamples(BasePageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_Example
                                 .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Where(i => !i.IsDeleted);
            int count = query.Count();
            var entities = query.Skip(search.Skip).Take(search.size).OrderByDescending(o => o.CreatedTime).ToList();
            var list = entities.Select(c => new ExampleResDto
            {
                Id = c.ID,
                Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                ImgUrl = c.ImgPath,
            }).ToList();
            var result = new PageResponseDto<ExampleResDto>()
            {
                count = count,
                rows = list,
                success = true,
            };
            return result;
        }

        /// <summary>
        /// 获取应用详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("get/{id}")]
        public ProductDetailResDto GetExample(int id)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_Example
                                 .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.ExampleImgs)
                                 .Where(i => !i.IsDeleted && i.ID == id);
            var entity = query.FirstOrDefault();
            if (entity == null)
            {
                return new ProductDetailResDto();
            }
            ProductDetailResDto result = new ProductDetailResDto()
            {
                Id = entity.ID,
                Name = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                ImgUrl = entity.ImgPath,
                Desc = entity.LanguageRelationByDescription.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                ImgList = entity.ExampleImgs.Select(c => c.ImgUrl).ToList(),
            };
            return result;
        }

    }
}
