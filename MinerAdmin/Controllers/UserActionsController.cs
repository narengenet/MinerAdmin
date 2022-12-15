using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;



namespace MinerAdmin.Controllers
{

    public class UserActionsController : ApiController
    {
        public UserActionsController()
        {
            
        }
        [HttpGet]
        public string confirmdeposit(Guid transactionid)
        {
            MoneroDataSetTableAdapters.TransactionsTableAdapter ta = new MoneroDataSetTableAdapters.TransactionsTableAdapter();
            MoneroDataSet.TransactionsRow dr = ta.GetData().Where(t => t.Id == transactionid).FirstOrDefault();
            if (dr!=null)
            {
                dr.Confirmed = true;
                dr.LastModified = DateTime.Now;
                ta.Update(dr);

                MoneroDataSetTableAdapters.UsersTableAdapter _ta = new MoneroDataSetTableAdapters.UsersTableAdapter();
                MoneroDataSet.UsersRow _urow= _ta.GetDataByID(dr.UserID).FirstOrDefault();
                _urow.Balance += dr.Amount;
                _ta.Update(_urow);

                return "1";

            }

            return "0";
            
        }
        
        [HttpGet]
        public string confirmwithdraw(Guid transactionid,string hash)
        {
            MoneroDataSetTableAdapters.TransactionsTableAdapter ta = new MoneroDataSetTableAdapters.TransactionsTableAdapter();
            MoneroDataSet.TransactionsRow dr = ta.GetData().Where(t => t.Id == transactionid).FirstOrDefault();
            if (dr!=null)
            {
                dr.Confirmed = true;
                dr.LastModified = DateTime.Now;
                dr.TheHash= hash;
                ta.Update(dr);

                MoneroDataSetTableAdapters.UsersTableAdapter _ta = new MoneroDataSetTableAdapters.UsersTableAdapter();
                MoneroDataSet.UsersRow _urow= _ta.GetDataByID(dr.UserID).FirstOrDefault();
                _urow.Balance -= dr.Amount;
                _ta.Update(_urow);

                return "1";

            }

            return "0";
            
        }




    }
}
