using System;
using System.Collections.Generic;
using System.Text;
using Peacock.Dal;

namespace Peacock.BusinessLogic
{
    public class BaseService
    {
        protected readonly PeacockDbContext Context;

        public BaseService(PeacockDbContext context)
        {
            Context = context;
        }
    }
}
