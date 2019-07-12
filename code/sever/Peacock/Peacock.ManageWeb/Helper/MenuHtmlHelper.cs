using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;
using Peacock.ViewModel.Manage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Peacock.ManageWeb.Helper
{
    public static class MenuHtmlHelper
    {
        public static IHtmlContent MenuFor<TModel>(this IHtmlHelper<TModel> html, List<MenuItem> list)
        {
            var listHtml = new HtmlContentBuilder();

            






            listHtml.AppendHtml("<ol><li>");
            listHtml.AppendHtml("</li></ol>");
            return listHtml;
        }


    }
}
