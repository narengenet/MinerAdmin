using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MinerAdmin.Users
{
    public partial class UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUserByID();
            }

            

        }


        private void GetUserByID()
        {
            Guid usrID = new Guid();
            if (Request.QueryString["userid"] != null)
            {
                usrID = Guid.Parse(Request.QueryString["userid"]);
                MoneroDataSetTableAdapters.UsersTableAdapter ta = new MoneroDataSetTableAdapters.UsersTableAdapter();
                MoneroDataSet.UsersRow dr = ta.GetDataByID(usrID).FirstOrDefault();  //ta.GetData().Where(u => u.Id == usrID).FirstOrDefault();
                if (dr != null)
                {
                    lblUsername.InnerText = dr.Username;

                    lblMoney.InnerText=dr.Balance.ToString();

                    hplWhatsapp.NavigateUrl= "https://wa.me/" + dr.Cellphone;
                    hplWhatsapp2.NavigateUrl= "https://wa.me/" + dr.Cellphone;
                    lblCellphone.InnerText=dr.Cellphone;

                    // find inviter
                    try
                    {
                        if (dr.Inviter != null)
                        {
                            MoneroDataSet.UsersRow _tmpR = ta.GetDataByID(dr.Inviter).FirstOrDefault();
                            if (_tmpR != null)
                            {
                                hplInviter.NavigateUrl = "/Users/UserDetails?userid=" + _tmpR.Id.ToString();
                                lblInviterUsername.InnerText = _tmpR.Username;
                            }
                        }
                    }
                    catch (Exception)
                    {

                        lblInviterUsername.InnerText = "-";
                    }

                    txtName.Text = dr.Name;
                    txtName.CssClass = "form-control is-valid text-control";

                    txtFamily.Text= dr.Family;
                    txtFamily.CssClass = "form-control is-valid text-control";

                    txtCellphone.Text = dr.Cellphone;
                    txtCellphone.CssClass = "form-control is-valid number-control";

                    txtUsername.Text = dr.Username;
                    txtUsername.CssClass = "form-control is-valid text-control";

                    txtEmail.Text = dr.Email;
                    txtEmail.CssClass = "form-control is-valid";

                    try
                    {
                        txtWallet.Text = dr.WalletAddress;
                    }
                    catch (Exception)
                    {

                        
                    }

                    hdfUserId.Value = dr.Id.ToString();

                    chkActivated.Checked = dr.IsActivated;

                    chkDeleted.Checked = dr.IsDeleted;





                }
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (hdfUserId.Value != "")
            {
                Guid userID = Guid.Parse(hdfUserId.Value);

                MoneroDataSetTableAdapters.UsersTableAdapter ta = new MoneroDataSetTableAdapters.UsersTableAdapter();
                MoneroDataSet.UsersRow dr = ta.GetDataByID(userID).FirstOrDefault();  //ta.GetData().Where(u => u.Id == usrID).FirstOrDefault();
                if (dr != null)
                {
                    //ta.Update(txtName.Text, txtFamily.Text, txtCellphone.Text, txtUsername.Text, chkActivated.Checked, dr.ConfirmationCode, dr.Balance, dr.ProfileMediaURL, txtEmail.Text, txtWallet.Text, dr.Inviter, dr.CreatedBy, dr.Created, dr.LastModifiedBy, DateTime.Now, chkDeleted.Checked, dr.Id, dr.IsActivated, dr.Balance, dr.Inviter, dr.CreatedBy, dr.Created, dr.LastModifiedBy, dr.LastModified, dr.IsDeleted);
                    //ta.UpdateUserByAdmin(txtName.Text,txtFamily.Text,txtUsername.Text,txtCellphone.Text,chkActivated.Checked,txtEmail.Text,txtWallet.Text,DateTime.Now.ToString(),chkDeleted.Checked,dr.Id);

                    MoneroDataSet.UsersRow _dr = ta.GetData().Where(u => u.Id != dr.Id && u.Email == txtEmail.Text).FirstOrDefault();
                    if (_dr!=null)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "hwa", "success=-2;message='Email "+txtEmail.Text+" is already taken';", true);
                        GetUserByID();
                        return;
                    }

                    _dr = ta.GetData().Where(u => u.Id != dr.Id && u.Username == txtUsername.Text).FirstOrDefault();
                    if (_dr != null)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "hwa", "success=-2;message='Username " + txtUsername.Text + " is already taken';", true);
                        GetUserByID();
                        return;
                    }

                    _dr = ta.GetData().Where(u => u.Id != dr.Id && u.Cellphone == txtCellphone.Text).FirstOrDefault();
                    if (_dr != null)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "hwa", "success=-2;message='Cellphone " + txtCellphone.Text + " is already taken';", true);
                        GetUserByID();
                        return;
                    }

                    Guid theID = dr.Id;
                    dr.Name = txtName.Text;
                    dr.Family=txtFamily.Text;
                    dr.Email=txtEmail.Text;
                    dr.Username=txtUsername.Text;
                    dr.Cellphone=txtCellphone.Text;
                    dr.IsActivated=chkActivated.Checked;
                    dr.IsDeleted=chkDeleted.Checked;


                    int res= ta.Update(dr);
                    //int result= ta.UpdateName(txtName.Text, theID);
                    GetUserByID();
                    ClientScript.RegisterStartupScript(GetType(), "hwa", "success=1;", true);

                    string sina = "aaa";

                }
            }
        }
    }
}