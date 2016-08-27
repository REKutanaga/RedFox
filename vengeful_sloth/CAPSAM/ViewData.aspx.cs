using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Text;

namespace CAPSAM
{
    public partial class ViewData : System.Web.UI.Page
    {
        string selectString = "CALL match_customer_info";

        //public string hexColSel = "\"#A1DCF2\"";
        public string hexColSel = "\"#0066ff\"";
        public string hexColMain = "\"#FFFFFF\"";
        public string hexColAlt = "\"#D5D5D5\"";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void fadeEffect()
        {
            //ScriptManager.RegisterStartupScript(ViewDataUpdatePanel, typeof(UpdatePanel), "fadein", "divfade('viewDataContainer', 500, true)", true);
        }

        protected void ViewDataButton_Click(object sender, EventArgs e)
        {
            addDataContainer.Style["display"] = "none";
            viewDataContainer.Style["display"] = "block";

            ViewDataUpdatePanel.Update();
        }

        protected void ModDataButton_Click(object sender, EventArgs e)
        {
            addDataContainer.Style["display"] = "block";
            viewDataContainer.Style["display"] = "none";

            ViewDataUpdatePanel.Update();
        }

        protected void DataSearchButton_Click(object sender, EventArgs e)
        {
            string searchString;
            
            searchString = DataSearchText.Text;
            MySqlCustomerData.SelectCommand = selectString + "('" + searchString + "');";

            DataSearchLabel.Text = selectString + "('" + searchString + "');";

            DataGridView.DataBind();
        }

        protected void resetButton_Click(object sender, EventArgs e)
        {

        }

        protected void commitButton_Click(object sender, EventArgs e)
        {
            MySqlCustomerData.Insert();
            cuIdTextBox.Text = string.Empty;
            cuNameTextBox.Text = string.Empty;
            cuAddrTextBox.Text = string.Empty;
        }

        /* BELOW IS FOR ROW HIGHLIGHTING AND SELECTION */

        protected void OnRowDataBound( object sender, GridViewRowEventArgs e ) {
            if( e.Row.RowType == DataControlRowType.DataRow ) {
                e.Row.Attributes.Add( "onmouseover", "MouseEvents(this, event)" );
                e.Row.Attributes.Add( "onmouseout", "MouseEvents(this, event)" );
                e.Row.Attributes.Add( "onmousedown", "MouseEvents(this, event)" );
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink( DataGridView, "Select$" + e.Row.RowIndex );
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void OnSelectedIndexChanged( object sender, EventArgs e ) {
            foreach( GridViewRow row in DataGridView.Rows ) {
                if( row.RowIndex == DataGridView.SelectedIndex ) {
                    row.BackColor = ColorTranslator.FromHtml( hexColSel );
                    row.ToolTip = string.Empty;
                    ScriptManager.RegisterClientScriptBlock( this, this.GetType(), "ChangeRowID", $"rowID = {row.RowIndex}", true );
                } else {
                    if( row.RowIndex % 2 == 1 ) {
                        row.BackColor = ColorTranslator.FromHtml( hexColAlt );
                    } else {
                        row.BackColor = ColorTranslator.FromHtml( hexColMain );
                    }
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
    }
}
