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
        private bool toggle;

        protected void Page_Load(object sender, EventArgs e)
        {
            toggle = false;
        }

        protected void ToggleDisp(object sender, EventArgs e)
        {
            FindControl("toggledButton").Visible = !toggle;
        }
    }
}