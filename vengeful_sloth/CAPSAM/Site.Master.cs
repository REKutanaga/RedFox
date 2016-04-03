using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAPSAM
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(3000); //doesn't work in main thread I think
            Page.ClientScript.RegisterStartupScript(GetType(), "call", "switchLoader();", true);
        }
    }
}
