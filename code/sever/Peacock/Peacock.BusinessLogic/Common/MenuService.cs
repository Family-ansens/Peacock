using Peacock.Dal;
using Peacock.ViewModel.Manage;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Peacock.BusinessLogic.Common
{
    public class MenuService : BaseService
    {
        public MenuService(PeacockDbContext context): base(context)
        {
        }

        public List<MenuItem> GetMenus(string languageType = "")
        {
            List<T_System_Menu> list = null;
            List<MenuItem> menuItems = new List<MenuItem>();

            if (string.IsNullOrEmpty(languageType))
            {
                list = Context.T_System_Menu.Where(i => !i.IsDeleted).ToList();
            }
            else
            {
                list = Context.T_System_Menu.Where(i => !i.IsDeleted && i.LanguageRelation != null && i.LanguageRelation.TSystemLanguageContent.Any(a=>a.LanguageType.Equals(languageType))).ToList();
            }

            if (list.Count == 0)
            {
                //menuItems.Add(new MenuItem("主页", "/", 1));
                //menuItems.Add(new MenuItem("用户主页", "/Account/Index", 2));
                //menuItems.Add(new MenuItem("Demo", "/Home/Demo", 3));

                var topItem = new MenuItem
                {
                    Name = "主页",
                    Seq = 1,
                    Url = "/",
                };

                var secondList = new List<MenuItem>
                {
                    new MenuItem
                    {
                        Name = "用户主页",
                        Url = "/Account/Index",
                        Seq = 3,
                        Parent = topItem,
                        Children = new List<MenuItem>
                        {
                            new MenuItem
                            {
                                Name = "二级",
                                Url = "/Account/Index",
                                Seq = 1,
                            }
                        }
                    },
                    new MenuItem
                    {
                        Name = "Demo",
                        Url = "/Home/Demo",
                        Seq = 1,
                        Parent = topItem,
                    },
                };

                topItem.Children = secondList;

                menuItems.Add(topItem);
            }
            else
            {
                menuItems = ConvertToViewList(list);
            }

            return menuItems;
        }

        /// <summary>
        /// 转换为ViewModel
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        private List<MenuItem> ConvertToViewList(List<T_System_Menu> entities)
        {
            List<MenuItem> list = new List<MenuItem>();

            var topList = entities.Where(i => i.ParentId == 0).ToList();

            foreach(var topItem in topList)
            {
                list.Add(InitMenuViewModel(topItem, entities, null));
            }
            return list;
        }

        /// <summary>
        /// 递归生成子级菜单
        /// </summary>
        /// <param name="current"></param>
        /// <param name="entities"></param>
        /// <param name="parentVM"></param>
        /// <returns></returns>
        private MenuItem InitMenuViewModel(T_System_Menu current, List<T_System_Menu> entities, MenuItem parentVM)
        {
            MenuItem result = new MenuItem
            {
                Id = current.Id,
                ParentId = current.ParentId,
                Name = current.Name,
                Url = current.Url,
                Seq = current.Seq,
                Children = new List<MenuItem>(),
                Parent = parentVM,
            };

            var children = entities.Where(i => i.ParentId == current.Id).ToList();
            if (children.Count == 0)
            {
                return result;
            }
            else
            {
                foreach(var child in children)
                {
                    result.Children.Add(InitMenuViewModel(child, entities, result));
                }
            }
            return result;
        }
    }
}
