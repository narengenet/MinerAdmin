using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinerAdmin.Users
{
    public partial class LoginHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel.ActivePage = "loginhistory";
            Panel.ActiveSub = "history";

            if (Request.QueryString["userid"]==null)
            {
                MoneroDataSetTableAdapters.UserLoginHistoryTableAdapter loginHistory = new MoneroDataSetTableAdapters.UserLoginHistoryTableAdapter();
                MoneroDataSet.UserLoginHistoryDataTable dt = loginHistory.GetUserLogins();
                Repeater1.DataSource = dt.OrderByDescending(u => u.LastModified);
                Repeater1.DataBind();
            }
            else
            {
                Guid theUserID = Guid.Parse(Request.QueryString["userid"]);
                MoneroDataSetTableAdapters.UserLoginHistoryTableAdapter loginHistory = new MoneroDataSetTableAdapters.UserLoginHistoryTableAdapter();
                MoneroDataSet.UserLoginHistoryDataTable dt = loginHistory.GetUserLogins();
                Repeater1.DataSource = dt.OrderByDescending(u => u.LastModified).Where(u=>u.User== theUserID);
                Repeater1.DataBind();
            }


        }
    }
}