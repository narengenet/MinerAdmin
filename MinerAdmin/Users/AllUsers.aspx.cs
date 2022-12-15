using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinerAdmin.Users
{
    public partial class AllUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel.ActivePage = "allusers";
            Panel.ActiveSub= "users";

            MoneroDataSetTableAdapters.UsersTableAdapter users = new MoneroDataSetTableAdapters.UsersTableAdapter();
            MoneroDataSet.UsersDataTable dt = users.GetNotDeletedUsers();
            Repeater1.DataSource = dt.OrderBy(u => u.Name);
            Repeater1.DataBind();
        }
    }
}