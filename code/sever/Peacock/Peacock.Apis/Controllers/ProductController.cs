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
    /// 商品
    /// </summary>
    [Route("product")]
    public class ProductController : BaseApiController
    {
        public ProductController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
        }

        /// <summary>
        /// 获取商品分组列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpPost("product-groups")]
        public PageResponseDto<ProductGroupResDto> GetProductGroups(BasePageSearch search)
        {
            var query = dbContext.T_Pro_ProductGroup
                                .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                .Where(i => !i.IsDeleted);
            int count = query.Count();
            var list = query.OrderBy(o => o.Id)
                                .Skip(search.Skip)
                                .Take(search.size)
                                .Select(c => new ProductGroupResDto
                                {
                                    ID = c.Id,
                                    Code = c.Code,
                                    Name = GetLanguageContent(c.LanguageRelationByName, search.language),
                                }).ToList();
            var result = new PageResponseDto<ProductGroupResDto>()
            {
                success = true,
                count = count,
                rows = list,
            };
            return result;
        }
    }
}
