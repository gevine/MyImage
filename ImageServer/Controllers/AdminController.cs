using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ImageServer.Controllers
{
    public class AdminController : ApiController
    {
        MyImageEntities db = new MyImageEntities();
        public IQueryable<Customer> GetCustomers()
        {
            return db.Customers;
        }

        public IQueryable<Role> GetRoles()
        {
            return db.Roles;
        }
    }
}
