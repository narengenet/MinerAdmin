using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinerAdmin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MoneroDataSetTableAdapters.UsersTableAdapter users=new MoneroDataSetTableAdapters.UsersTableAdapter();
            MoneroDataSet.UsersDataTable dt = users.GetData();
            Repeater1.DataSource = dt.OrderBy(u=>u.Name);
            Repeater1.DataBind();
            lblUserCount.Text = dt.Rows.Count.ToString();

            
        }
    }
}