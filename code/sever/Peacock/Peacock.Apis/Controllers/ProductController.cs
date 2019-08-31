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
        [HttpGet("product-groups")]
        public PageResponseDto<ProductGroupResDto> GetProductGroups(BasePageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_ProductGroup
                                .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                .Where(i => !i.IsDeleted);
            int count = query.Count();
            var list = query.OrderByDescending(o => o.Id)
                                .Skip(search.Skip)
                                .Take(search.size)
                                .Select(c => new ProductGroupResDto
                                {
                                    ID = c.Id,
                                    Code = c.Code,
                                    Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                }).ToList();
            var result = new PageResponseDto<ProductGroupResDto>()
            {
                success = true,
                count = count,
                rows = list,
            };
            return result;
        }

        /// <summary>
        /// 首页获取商品分组列表
        /// </summary>
        /// <returns></returns>
        [HttpGet("home/product-groups")]
        public List<ProductGroupResDto> GetExampleGroupsByHome()
        {
            string languageType = GetLanguage();
            var list = dbContext.T_Pro_ProductGroup.Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                            .Where(i => !i.IsDeleted).OrderByDescending(o => o.OrderId)
                            .Take(5)
                            .Select(c => new ProductGroupResDto
                            {
                                ID = c.Id,
                                Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                Products = new List<ProductResDto>(),
                            }).ToList();
            var groupIdArr = list.Select(i => i.ID).ToArray();
            var products = dbContext.T_Pro_Product
                                    .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                    .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                    .Where(i => !i.IsDeleted && groupIdArr.Contains(i.GroupId))
                                    .Select(c => new ProductResDto
                                    {
                                        Id = c.ID,
                                        GroupId = c.GroupId,
                                        Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                        Introduction = c.LanguageRelationByIntroduction.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                                        ImgUrl = c.ImgPath,
                                        OrderId = c.OrderId,
                                    }).ToList();

            foreach (var item in products.GroupBy(g => g.GroupId))
            {
                var group = list.FirstOrDefault(i => i.ID == item.Key);
                group.Products = item.ToList().OrderByDescending(o => o.OrderId).Take(6).ToList();
            }

            return list;
        }

        /// <summary>
        /// 获取产品列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("products")]
        public PageResponseDto<ProductResDto> GetProducts(ProductPageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_Product
                                 .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.ProductGourp).ThenInclude(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Where(i => !i.IsDeleted);
            if (!string.IsNullOrEmpty(search.Query))
            {
                search.Query = search.Query.Replace(" ", string.Empty);
                query = query.Where(i => i.LanguageRelationByName.TSystemLanguageContent
                                            .Any(a => a.DisplayContent.Contains(search.Query))
                                         || i.LanguageRelationByDescription.TSystemLanguageContent
                                               .Any(a => a.DisplayContent.Contains(search.Query))
                                         || i.ProductGourp.LanguageRelationByName.TSystemLanguageContent
                                                .Any(a => a.DisplayContent.Contains(search.Query))
                                         || i.LanguageRelationByIntroduction.TSystemLanguageContent
                                                .Any(a => a.DisplayContent.Contains(search.Query)));
            }
            int count = query.Count();
            var entities = query.Skip(search.Skip).Take(search.size).OrderByDescending(o => o.OrderId).ToList();
            var list = entities.Select(c => new ProductResDto
            {
                Id = c.ID,
                Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                Introduction = c.LanguageRelationByIntroduction.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                ImgUrl = c.ImgPath,
            }).ToList();
            var result = new PageResponseDto<ProductResDto>()
            {
                count = count,
                rows = list,
                success = true,
            };
            return result;
        }

        /// <summary>
        /// 获取最新产品列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("newest-products")]
        public PageResponseDto<ProductResDto> GetNewestProducts(BasePageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_Product
                                 .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                 .Where(i => !i.IsDeleted);

            int count = query.Count();
            var entities = query.Skip(search.Skip).Take(search.size).OrderByDescending(o => o.CreatedTime).ToList();
            var list = entities.Select(c => new ProductResDto
            {
                Id = c.ID,
                Name = c.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                Introduction = c.LanguageRelationByIntroduction.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                ImgUrl = c.ImgPath,
            }).ToList();
            var result = new PageResponseDto<ProductResDto>()
            {
                count = count,
                rows = list,
                success = true,
            };
            return result;
        }

        /// <summary>
        /// 获取商品详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("get/{id}")]
        public ProductDetailResDto GetProduct(int id)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_Product
                                 .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.ProductImgs)
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
                ImgList = entity.ProductImgs.OrderByDescending(o => o.OrderId).Select(c => c.ImgUrl).ToList(),
            };
            return result;
        }

        /// <summary>
        /// 获取热销商品列表
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpGet("hot-sale-products")]
        public PageResponseDto<HotSaleProductResDto> GetHotSaleProducts(ProductPageSearch search)
        {
            string languageType = GetLanguage();
            var query = dbContext.T_Pro_HotSaleProduct
                                 .Include(i => i.Product)
                                 .ThenInclude(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                 .Include(i => i.Product)
                                 .ThenInclude(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                 .OrderByDescending(i => i.OrderId);
            int count = query.Count();
            var list = query.Skip(search.Skip).Take(search.size).OrderByDescending(o => o.OrderId)
                .Select(c => new HotSaleProductResDto
                {
                    ProductId = c.ID,
                    ProductName = c.Product.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                    ImgUrl = c.Product.ImgPath,
                    Introduction = c.Product.LanguageRelationByIntroduction.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == languageType).DisplayContent,
                }).ToList();
            var result = new PageResponseDto<HotSaleProductResDto>()
            {
                count = count,
                rows = list,
                success = true,
            };
            return result;
        }
    }
}
