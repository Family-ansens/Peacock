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
        /// 首页获取应用分组列表
        /// </summary>
        /// <returns></returns>
        [HttpGet("home/example-groups")]
        public List<ExampleGroupResDto> GetExampleGroupsByHome()
        {
            string languageType = GetLanguage();
            var list = dbContext.T_Pro_ExampleGroup.Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                            .Where(i => !i.IsDeleted).OrderBy(o => o.OrderId)
                            .Take(5)
                            .Select(c => new ExampleGroupResDto
                            {
                                ID = c.ID,
                                Code = c.Code,
                                Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                Examples = new List<ExampleResDto>(),
                            }).ToList();
            var groupIdArr = list.Select(i => i.ID).ToArray();
            var examples = dbContext.T_Pro_Example.Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                    .Where(i => !i.IsDeleted && groupIdArr.Contains(i.GroupId))
                                    .Select(c => new ExampleResDto
                                    {
                                        Id = c.ID,
                                        GroupId = c.GroupId,
                                        Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                        ImgUrl = c.ImgPath,
                                        OrderId = c.OrderId,
                                    }).ToList();

            foreach(var item in examples.GroupBy(g=>g.GroupId))
            {
                var group = list.FirstOrDefault(i => i.ID == item.Key);
                group.Examples = item.ToList().OrderBy(o => o.OrderId).Take(6).ToList();
            }

            return list;
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
                                 .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                 .Where(i => !i.IsDeleted);
            if (!string.IsNullOrEmpty(search.Query))
            {
                search.Query = search.Query.Replace(" ", string.Empty);
                query = query.Where(i => i.LanguageRelationByName.TSystemLanguageContent
                                                .Any(a => a.DisplayContent.Contains(search.Query))
                                        || i.LanguageRelationByIntroduction.TSystemLanguageContent
                                                .Any(a => a.DisplayContent.Contains(search.Query))
                                        || i.LanguageRelationByDescription.TSystemLanguageContent
                                                .Any(a => a.DisplayContent.Contains(search.Query)));
            }
            if (search.GroupId > 0)
            {
                query = query.Where(i => i.GroupId == search.GroupId);
            }
            int count = query.Count();
            var entities = query.Skip(search.Skip).Take(search.size).OrderBy(o => o.OrderId).ToList();
            var list = entities.Select(c => new ExampleResDto
                        {
                            Id = c.ID,
                            Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                            Introduction = c.LanguageRelationByIntroduction.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
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
        /// 获取最新应用列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("newest-examples")]
        public PageResponseDto<ExampleResDto> GetNewestExamples(BasePageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_Example
                                 .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                 .Where(i => !i.IsDeleted);
            int count = query.Count();
            var entities = query.Skip(search.Skip).Take(search.size).OrderByDescending(o => o.CreatedTime).ToList();
            var list = entities.Select(c => new ExampleResDto
            {
                Id = c.ID,
                Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                Introduction = c.LanguageRelationByIntroduction.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
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
        public ExampleDetailResDto GetExample(int id)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_Example
                                 .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.ExampleImgs)
                                 .Where(i => !i.IsDeleted && i.ID == id);
            var entity = query.FirstOrDefault();
            if (entity == null)
            {
                return new ExampleDetailResDto();
            }
            ExampleDetailResDto result = new ExampleDetailResDto()
            {
                Id = entity.ID,
                Name = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                Introduction = entity.LanguageRelationByIntroduction.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                ImgUrl = entity.ImgPath,
                Desc = entity.LanguageRelationByDescription.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                ImgList = entity.ExampleImgs.OrderByDescending(o => o.OrderId).Select(c => c.ImgUrl).ToList(),
            };
            var relationProducts = dbContext.T_Pro_ExampleProductRelation
                                            .Include(i => i.Product)
                                            .Where(i => i.ExampleId == id)
                                            .Select(c => new ExampleProductItem
                                            {
                                                ProductId = c.ProductId,
                                                ImgUrl = c.Product.ImgPath,
                                            }).ToList();
            result.RelationProducts = relationProducts;
            return result;
        }



    }
}
