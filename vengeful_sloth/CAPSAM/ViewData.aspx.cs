using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAPSAM
{
    public partial class ViewData : System.Web.UI.Page
    {
        string selectString = "CALL get_data_at_id_name_addr_with_aliases";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataSearchButton_Click(object sender, EventArgs e)
        {
            string searchString;
            
            searchString = DataSearchText.Text;
            MySqlCustomerData.SelectCommand = selectString + "('" + searchString + "');";

            DataSearchLabel.Text = selectString + "('" + searchString + "');";

            DataGridView.DataBind();
        }

        protected void commitButton_Click(object sender, EventArgs e)
        {
            MySqlCustomerData.Insert();
            cuIdTextBox.Text = string.Empty;
            cuNameTextBox.Text = string.Empty;
            cuAddrTextBox.Text = string.Empty;
            coNameTextBox.Text = string.Empty;
            cuNumTextBox.Text = string.Empty;
            orOpenTextBox.Text = string.Empty;
            orSchedTextBox.Text = string.Empty;
            orProgTextBox.Text = string.Empty;
            orCompTextBox.Text = string.Empty;
        }
    }
}
