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
            Panel.ActivePage = "";
            Panel.ActiveSub = "";


            MoneroDataSetTableAdapters.UsersTableAdapter users=new MoneroDataSetTableAdapters.UsersTableAdapter();
            MoneroDataSet.UsersDataTable dt = users.GetNotDeletedUsers();
            Repeater1.DataSource = dt.OrderBy(u=>u.Name);
            Repeater1.DataBind();
            lblUserCount.Text = dt.Rows.Count.ToString();

            MoneroDataSetTableAdapters.TransactionsTableAdapter transTA = new MoneroDataSetTableAdapters.TransactionsTableAdapter();
            MoneroDataSet.TransactionsDataTable transacDT=transTA.GetData();
            lblPendingDeposits.Text = transacDT.Where(t => t.IsDeposit == true && t.Confirmed == false).Count().ToString();
            lblPendingWithdraws.Text = transacDT.Where(t => t.IsDeposit == false && t.Confirmed == false).Count().ToString();

            
        }
    }
}