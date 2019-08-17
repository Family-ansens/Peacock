using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Peacock.Apis.Models;
using Peacock.Dal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Controllers
{
    [Route("new")]
    public class NewController : BaseApiController
    {
        public NewController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
        }

        /// <summary>
        /// 获取新闻列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpPost("news")]
        public PageResponseDto<NewResDto> GetNews(BasePageSearch search)
        {
            var query = dbContext.T_New.Where(i => i.IsPublish && !i.IsDeleted);
            int count = query.Count();
            var list = query.AsTracking()//.Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                            .OrderByDescending(o => o.PublishTime)
                            .Skip(search.Skip)
                            .Take(search.size)
                            .Select(c => new NewResDto
                            {
                                ID = c.ID,
                                Title = GetLanguageContent(c.LanguageRelationByTitle, search.language),
                                PublishTime = c.PublishTime,
                            }).ToList();
            var result = new PageResponseDto<NewResDto>()
            {
                success = true,
                count = count,
                rows = list,
            };
            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <param name="language"></param>
        /// <returns></returns>
        [HttpGet("detail")]
        public IStatusCodeActionResult GetNewDetail(int id, string language)
        {
            var entity = dbContext.T_New.Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                                         .Include(i => i.LanguageRelationByContent).ThenInclude(i => i.TSystemLanguageContent)
                                         .FirstOrDefault(i => i.ID == id && !i.IsDeleted && i.IsPublish);
            if (entity == null) return NotFound();

            var data = new NewDetailResDto()
            {
                ID = entity.ID,
                Title = GetLanguageContent(entity.LanguageRelationByTitle, language),
                Content = GetLanguageContent(entity.LanguageRelationByContent, language),
                PublishTime = entity.PublishTime,
            };
            return Ok(data);
        }
    }
}
