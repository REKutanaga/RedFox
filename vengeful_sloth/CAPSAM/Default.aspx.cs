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
            if(ViewState["numValue"] != null)
            {
                num = (int)ViewState["numValue"];
            }
            else
            {
                Label1.Text = num.ToString();
            }
        }

        public void btnPanel_Click(Object sender, EventArgs e)
        {
            num++;
            ViewState["numValue"] = num;
            Label1.Text = num.ToString();
        }
    }
}
