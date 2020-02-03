using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JysanTestApp_1
{
    public partial class LegalEntity1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateLegalEntity();
            }
        }

        private void PopulateLegalEntity()
        {
            List<Individual> AllLegals = null;
            using (MyDatabaseEntities dc = new MyDatabaseEntities())
            {
                AllLegals = dc.LegalEntity.ToList();
            }

            if (AllLegals == null || AllLegals.Count == 0)
            {
                //trick to show footer when there is no data in the gridview
                AllLegals.Add(new Individual());
                LegalGridview.DataSource = AllLegals;
                LegalGridview.DataBind();
                LegalGridview.Rows[0].Visible = false;
            }
            else
            {
                LegalGridview.DataSource = AllLegals;
                LegalGridview.DataBind();
            }
        }

        protected void LegalGridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Insert new contact
            if (e.CommandName == "Insert")
            {
                Page.Validate("Add");
                if (Page.IsValid)
                {
                    var fRow = LegalGridview.FooterRow;
                    TextBox txtLPName = (TextBox)fRow.FindControl("txtLPName");
                    TextBox txtLPFamilyName = (TextBox)fRow.FindControl("txtLPFamilyName");
                    TextBox txtCompanyName = (TextBox)fRow.FindControl("txtCompanyName");
                    TextBox txtBIN = (TextBox)fRow.FindControl("txtBIN");
                    TextBox txtAuthor = (TextBox)fRow.FindControl("txtAuthor");

                    using (MyDatabaseEntities dc = new MyDatabaseEntities())
                    {

                        //Here in this example we have done a little mistake // class name and page name is Same (contact) 
                        // We will remove contact page , as its not in use

                        dc.LegalEntity.Add(new LegalEntity
                        {
                            Name = txtLPName.Text.Trim(),
                            FamilyName = txtLPFamilyName.Text.Trim(),
                            CompanyName = txtCompanyName.Text.Trim(),
                            BIN_IIN = txtBIN.Text.Trim(),
                            Author = txtAuthor.Text.Trim(),

                        });
                        dc.SaveChanges();
                        PopulateLegalEntity();
                    }
                }
            }
        }

        protected void Legalview_RowEditing(object sender, GridViewEditEventArgs e)
        {
            LegalGridview.EditIndex = e.NewEditIndex;
            PopulateLegalEntity();
        }

        protected void Legalview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            LegalGridview.EditIndex = -1;
            PopulateLegalEntity();
        }

        protected void Legalview_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Page.Validate("edit");
            if (!Page.IsValid)
            {
                return;
            }

            //Get ID
            int legalID = (int)LegalGridview.DataKeys[e.RowIndex]["ID"];

            //Find Controls 
            TextBox txtLPName = (TextBox)LegalGridview.Rows[e.RowIndex].FindControl("txtLPName");
            TextBox txtLPFamilyName = (TextBox)LegalGridview.Rows[e.RowIndex].FindControl("txtLPFamilyName");
            TextBox txtCompanyName = (TextBox)LegalGridview.Rows[e.RowIndex].FindControl("txtCompanyName");
            TextBox txtBIN = (TextBox)LegalGridview.Rows[e.RowIndex].FindControl("txtBIN");
            TextBox txtAuthor = (TextBox)LegalGridview.Rows[e.RowIndex].FindControl("txtAuthor");

            using (MyDatabaseEntities dc = new MyDatabaseEntities())
            {
                var v = dc.LegalEntity.Where(a => a.ContactID.Equals(legalID)).FirstOrDefault();
                if (v != null)
                {
                    v.Name = txtLPName.Text.Trim();
                    v.FamilyName = txtLPFamilyName.Text.Trim();
                    v.CompanyName = txtCompanyName.Text.Trim();
                    v.BIN_IIN = txtBIN.Text.Trim();
                    v.Author = txtAuthor.Text.Trim();
                }
                dc.SaveChanges();
                LegalGridview.EditIndex = -1;
                PopulateLegalEntity();
            }
        }
    }
}