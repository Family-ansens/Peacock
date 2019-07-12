using Peacock.ViewModel.Manage;
using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.BusinessLogic.Common
{
    public class MenuService : BaseService
    {
        public List<MenuGroup> GetMenus(string languageType = "")
        {
            if (string.IsNullOrEmpty(languageType))
            {
                languageType = LanguageType.ZhCn;
            }

            List<MenuItem> menuItems = new List<MenuItem>();
            menuItems.Add(new MenuItem("主页", "/", 1));
            menuItems.Add(new MenuItem("用户主页", "/Account/Index", 2));
            menuItems.Add(new MenuItem("Demo", "/Home/Demo", 3));

            List<MenuGroup> menuGroups = new List<MenuGroup>();
            menuGroups.Add(new MenuGroup("Default", 1, "首页", menuItems));

            return menuGroups;
        }
    }
}
