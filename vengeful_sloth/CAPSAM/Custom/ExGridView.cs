using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;


namespace CAPSAM.CustomControls
{
    [
    ToolboxData("<{0}:ExGridView runat=\"server\"> </{0}:ExGridView>")
    ]
    public class ExGridView : GridView
    {

        public ExGridView() { }

        public Unit GridHeight { get; set; }

        private String CalculateWidth()
        {
            string strWidth = "auto";
            if (!this.Width.IsEmpty)
            {
                strWidth = String.Format("{0}{1}", this.Width.Value, ((this.Width.Type == UnitType.Percentage) ? "%" : "px"));
            }
            return strWidth;
        }

        private String CalculateHeight()
        {
            string strHeight = "auto";
            if (!this.GridHeight.IsEmpty)
            {
                strHeight = String.Format("{0}{1}", this.GridHeight.Value, ((this.GridHeight.Type == UnitType.Percentage) ? "%" : "px"));
            }
            return strHeight;
        }

        protected override void Render(HtmlTextWriter writer)
        {
            //render header row 
            writer.Write("<table cellspacing='" + this.CellSpacing.ToString() + "' cellpadding='" + this.CellPadding.ToString() + "' style='width:" + CalculateWidth() + "'>");
            GridViewRow customHeader = this.HeaderRow;

            if (this.HeaderRow != null)
            {
                customHeader.ApplyStyle(this.HeaderStyle);
                if (AutoGenerateColumns == false)
                {
                    int i = 0;
                    foreach (DataControlField col in this.Columns)
                    {
                        customHeader.Cells[i].ApplyStyle(col.HeaderStyle);
                        i++;
                    }
                }

                customHeader.RenderControl(writer);
                this.HeaderRow.Visible = false;


            }
            writer.Write("</table>");

            //render data rows
            writer.Write("<div id='" + ClientID + "_div'  style='" +
                             "padding-bottom:0px;overflow-x:auto;overflow-y:auto;" +

                             "width:" + CalculateWidth() + ";" +
                             "height:" + CalculateHeight() + ";" +
                             "background-color:transparent;'>");

            //get the pager row and make invisible
            GridViewRow customPager = this.BottomPagerRow;
            if (this.BottomPagerRow != null)
            {
                this.BottomPagerRow.Visible = false;
            }


            base.Render(writer);
            writer.Write("</div>");

            //render pager row
            if (customPager != null && this.PageCount > 0)
            {
                writer.Write("<table  border='0' cellspacing='" + this.CellSpacing.ToString() + "' cellpadding='" + this.CellPadding.ToString() + "' style='width:" + CalculateWidth() + "'>");
                customPager.ApplyStyle(this.PagerStyle);
                customPager.Visible = true;
                customPager.RenderControl(writer);
                writer.Write("</table>");
            }


        }
    }

}
