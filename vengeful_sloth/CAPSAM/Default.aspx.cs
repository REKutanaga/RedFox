using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAPSAM
{
    public partial class _Default : Page
    {
        //public Control button;
        public bool show = false;
        public int num = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Response.Write("The Page Loaded at: " + DateTime.Now.ToLongTimeString());

                try
                {
                    //lblPanel1.Text = DateTime.Now.ToLongTimeString();
                    //lblPanel2.Text = DateTime.Now.ToLongTimeString();
                }

                catch(Exception error)
                {
                    Response.Write("Error : " + error.Message);
                }
            }
            else
            {
                num = 0;
            }
        }

        public void btnPanel_Click(Object sender, EventArgs e)
        {
            num++;
            Label1.Text = num.ToString();
        }
    }
}
