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
    /// 系统公告
    /// </summary>
    [Route("announcement")]
    public class AnnouncementController : BaseApiController
    {
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="peacockDbContext"></param>
        public AnnouncementController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
        }

        /// <summary>
        /// 获取公告列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("list")]
        public PageResponseDto<AnnouncementResDto> GetList(BasePageSearch search)
        {
            string languageType = GetLanguage();


            var query = dbContext.T_Announcement.Where(i => !i.IsDeleted);
            int count = query.Count();
            var list = query.Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.AnnouncementsWithTitle)
                            .Include(i => i.LanguageRelationByContent).ThenInclude(i => i.AnnouncementsWithContent)
                            .OrderByDescending(o => o.LastUpdatedTime)
                            .Select(c => new AnnouncementResDto
                            {
                                Id = c.ID,
                                Title = c.LanguageRelationByTitle.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                Content = c.LanguageRelationByContent.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                            }).ToList();

            return new PageResponseDto<AnnouncementResDto>()
            {
                count = count,
                rows = list,
                success = true,
            };
        }
    }
}
