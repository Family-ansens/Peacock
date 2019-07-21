using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;
using Peacock.ViewModel.Manage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Peacock.ManageWeb.Helper
{
    public static class MenuHtmlHelper
    {
        public static IHtmlContent MenuFor<TModel>(this IHtmlHelper<TModel> html, List<MenuItem> list)
        {
            var listHtml = new HtmlContentBuilder();
            StringBuilder sb = new StringBuilder();

            foreach(var topMenu in list.OrderBy(o=>o.Seq))
            {
                // 附加顶部menu
                listHtml.AppendHtml("<ul class='sidebar-menu' data-widget='tree'>");
                listHtml.AppendHtml($"<li class='treeview'><a href='{topMenu.Url}' ><i class='fa fa-share'></i><span>{topMenu.Name}</span><span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span></a>");

                sb.Clear();

                if (topMenu.Children != null && topMenu.Children.Count > 0)
                {
                    sb.Append("<ul class='treeview-menu'>");
                    foreach (var child in topMenu.Children.OrderBy(o => o.Seq))
                    {
                        GetChildrenMenuHtml(child, sb);
                    }
                    sb.Append("</ul>");
                }

                listHtml.AppendHtml(sb.ToString());
                listHtml.AppendHtml("</li>");

                listHtml.AppendHtml("</ul>");
            }

            
            return listHtml;
        }

        private static void GetChildrenMenuHtml(MenuItem currentNode, StringBuilder sb)
        {
            if (currentNode.Children != null && currentNode.Children.Count > 0)
            {
                sb.Append($"<li class='treeview'><a href='{currentNode.Url}' ><i class='fa fa-share'></i><span>{currentNode.Name}</span><span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span></a>");

                sb.Append("<ul class='treeview-menu'>");
                foreach (var child in currentNode.Children.OrderBy(o => o.Seq))
                {
                    GetChildrenMenuHtml(child, sb);
                }
                sb.Append("</ul>");
                sb.Append("</li>");
            }
            else
            {
                sb.Append($"<li><a href='{currentNode.Url}'><i class='fa fa-circle-o'></i>{currentNode.Name}</a></li>");
            }           
        }
    }
}
