using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MinerAdmin.Users
{
    public partial class Deposits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel.ActivePage = "deposits";
            Panel.ActiveSub = "transactions";

            if (Request.QueryString["userid"] == null)
            {
                MoneroDataSetTableAdapters.AllTransactionsTableAdapter users = new MoneroDataSetTableAdapters.AllTransactionsTableAdapter();
                MoneroDataSet.AllTransactionsDataTable dt = users.GetTransactions();

                if (Request.QueryString["pending"]==null)
                {
                    Repeater1.DataSource = dt.OrderByDescending(u => u.Created).Where(t => t.IsDeposit == true);
                    Repeater1.DataBind();
                }
                else
                {
                    Repeater1.DataSource = dt.OrderByDescending(u => u.Created).Where(t => t.IsDeposit == true && t.Confirmed==false);
                    Repeater1.DataBind();
                }
                
            }
            else
            {
                Guid theUserID = Guid.Parse(Request.QueryString["userid"]);

                MoneroDataSetTableAdapters.AllTransactionsTableAdapter users = new MoneroDataSetTableAdapters.AllTransactionsTableAdapter();
                MoneroDataSet.AllTransactionsDataTable dt = users.GetTransactions();
                Repeater1.DataSource = dt.OrderByDescending(u => u.Created).Where(t => t.IsDeposit == true && t.UserID==theUserID);
                Repeater1.DataBind();
            }
        }
    }
}