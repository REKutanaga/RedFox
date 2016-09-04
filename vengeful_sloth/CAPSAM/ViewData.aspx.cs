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
        string updateString = "CALL set_customer_info";
        string deleteString = "CALL delete_customer";

        //lSize must match number of entry categories
        const int lSize = 8;
        List<string> modEntryList = new List<string>(new string[lSize]);


        //temporary color until 'color change on focus loss' is fixed
        public const string hexColSel = "\"#cc3333\"";
        //public const string hexColSel = "\"#0066ff\"";
        public const string hexColMain = "\"#FFFFFF\"";
        public const string hexColAlt = "\"#D5D5D5\"";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(ViewState["EntryList"] != null ) {
                modEntryList = (List<string>) ViewState["EntryList"];
            }

            foreach( GridViewRow row in DataGridView.Rows ) {
                /*if( row.RowIndex == DataGridView.SelectedIndex ) {
                    row.ToolTip = string.Empty;
                    //row.BackColor = ColorTranslator.FromHtml(hexColSel);
                } else {
                    //row.ToolTip = "Click to select this row.";
                }*/
                row.ToolTip = string.Empty;
            }
        }

        protected void SetEntryList() {
            modEntryList[1] = nameTextBox.Text;
            modEntryList[2] = addressTextBox.Text;
            modEntryList[3] = cityTextBox.Text;
            modEntryList[4] = stateTextBox.Text;
            modEntryList[5] = zipcodeTextBox.Text;
            modEntryList[6] = creditTextBox.Text;
            modEntryList[7] = termsTextBox.Text;

            ViewState["EntryList"] = modEntryList;
        }

        protected void GetEntryList() {
            idLabel.Text = modEntryList[0];
            nameTextBox.Text = modEntryList[1];
            addressTextBox.Text = modEntryList[2];
            cityTextBox.Text = modEntryList[3];
            stateTextBox.Text = modEntryList[4];
            zipcodeTextBox.Text = modEntryList[5];
            creditTextBox.Text = modEntryList[6];
            termsTextBox.Text = modEntryList[7];

            ViewState[ "EntryList" ] = modEntryList;
        }

        protected void ClearEntryList() {
            ClearSelectedIndex();

            modEntryList[0] = "Null";
            modEntryList[1] = string.Empty;
            modEntryList[2] = string.Empty;
            modEntryList[3] = string.Empty;
            modEntryList[4] = string.Empty;
            modEntryList[5] = string.Empty;
            modEntryList[6] = string.Empty;
            modEntryList[7] = string.Empty;

            ViewState["EntryList"] = modEntryList;
        }

        protected void ViewDataButton_Click(object sender, EventArgs e)
        {
            /*addDataContainer.Style["display"] = "none";
            viewDataContainer.Style["display"] = "block";

            ViewDataUpdatePanel.Update();*/
        }

        protected void ModDataButton_Click(object sender, EventArgs e)
        {
            /*addDataContainer.Style["display"] = "block";
            viewDataContainer.Style["display"] = "none";

            ViewDataUpdatePanel.Update();*/
        }

        protected void NewCustomer_Click(object sender, EventArgs e ) {
            MySqlCustomerData.Insert();
        }

        protected void DeleteCustomer_Click(object sender, EventArgs e ) {
            if( modEntryList[0] != "Null" ) {
                MySqlCustomerData.DeleteCommand = deleteString + "(" + modEntryList[0] + ")";

                ClearEntryList();
                GetEntryList();

                MySqlCustomerData.Delete();
            }
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
            GetEntryList();
        }

        protected void commitButton_Click(object sender, EventArgs e)
        {
            SetEntryList();

            StringBuilder entryString = new StringBuilder();
            for(int i = 1; i < modEntryList.Count(); i++) {
                entryString.Append( "," );
                entryString.Append( "'" );
                entryString.Append( modEntryList[i] );
                entryString.Append( "'" );
            }
            int idInt;
            int.TryParse(modEntryList[0], out idInt);
            MySqlCustomerData.UpdateCommand = updateString + "(" + idInt + entryString + ")";

            MySqlCustomerData.Update();

            ClearEntryList();

            GetEntryList();
        }

        /* BELOW IS FOR ROW HIGHLIGHTING AND SELECTION */

        protected void UpdateSelectedIndex() {
            ScriptManager.RegisterClientScriptBlock( this, GetType(), "ChangeRowID", $"rowID = {DataGridView.SelectedIndex}", true );
        }

        protected void ClearSelectedIndex() {
            DataGridView.SelectedIndex = -1;
            UpdateSelectedIndex();
        }

        protected void OnRowDataBound( object sender, GridViewRowEventArgs e ) {
            if( e.Row.RowType == DataControlRowType.DataRow ) {
                e.Row.Attributes.Add( "onmouseover", "MouseEvents(this, event)" );
                e.Row.Attributes.Add( "onmouseout", "MouseEvents(this, event)" );
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink( DataGridView, "Select$" + e.Row.RowIndex );
                //e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void OnSelectedIndexChanged( object sender, EventArgs e ) {
            UpdateSelectedIndex();

            //populate entry categories
            modEntryList[0] = DataGridView.SelectedRow.Cells[0].Text;
            modEntryList[1] = DataGridView.SelectedRow.Cells[1].Text;
            modEntryList[2] = DataGridView.SelectedRow.Cells[2].Text;
            modEntryList[3] = DataGridView.SelectedRow.Cells[3].Text;
            modEntryList[4] = DataGridView.SelectedRow.Cells[4].Text;
            modEntryList[5] = DataGridView.SelectedRow.Cells[5].Text;
            modEntryList[6] = DataGridView.SelectedRow.Cells[6].Text;
            modEntryList[7] = DataGridView.SelectedRow.Cells[7].Text;

            GetEntryList();

            /*foreach( GridViewRow row in DataGridView.Rows ) {
                if( row.RowIndex == DataGridView.SelectedIndex ) {
                    //row.ToolTip = string.Empty;
                } 
                else {
                    row.ToolTip = "Click to select this row.";
                }
            }*/
        }
    }
}
