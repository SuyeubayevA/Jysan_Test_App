using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using JysanTestApp_1.Model;

namespace JysanTestApp_1
{
    public partial class IndividualsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateIndividuals();
            }
        }

        private void PopulateIndividuals()
        {
            List<Individual> Allindividuals = null;
            using (MyDatabaseEntities dc = new MyDatabaseEntities())
            {
                Allindividuals = dc.Individual.ToList();
            }

            if (Allindividuals == null || Allindividuals.Count == 0)
            {
                //trick to show footer when there is no data in the gridview
                Allindividuals.Add(new Individual());
                IndividGridview.DataSource = Allindividuals;
                IndividGridview.DataBind();
                IndividGridview.Rows[0].Visible = false;
            }
            else
            {
                IndividGridview.DataSource = Allindividuals;
                IndividGridview.DataBind();
            }
        }

        protected void IndividGridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Insert new contact
            if (e.CommandName == "Insert")
            {
                Page.Validate("Add");
                if (Page.IsValid)
                {
                    var fRow = IndividGridview.FooterRow;
                    TextBox txtIPName = (TextBox)fRow.FindControl("txtIPName");
                    TextBox txtIPFamilyName = (TextBox)fRow.FindControl("txtIPFamilyName");
                    TextBox txtIPFatherName = (TextBox)fRow.FindControl("txtIPFatherName");
                    TextBox txtIIN = (TextBox)fRow.FindControl("txtIIN");
                    TextBox txtAuthor = (TextBox)fRow.FindControl("txtAuthor");

                    using (MyDatabaseEntities dc = new MyDatabaseEntities())
                    {

                        //Here in this example we have done a little mistake // class name and page name is Same (contact) 
                        // We will remove contact page , as its not in use

                        dc.Individual.Add(new Individual
                        {
                            Name = txtIPName.Text.Trim(),
                            FamilyName = txtIPFamilyName.Text.Trim(),
                            FatherName = txtIPFatherName.Text.Trim(),
                            BIN_IIN = txtIIN.Text.Trim(),
                            Author = txtAuthor.Text.Trim(),

                        });
                        dc.SaveChanges();
                        PopulateIndividuals();
                    }
                }
            }
        }

        protected void Individview_RowEditing(object sender, GridViewEditEventArgs e)
        {
            IndividGridview.EditIndex = e.NewEditIndex;
            PopulateIndividuals();
        }

        protected void Individview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            IndividGridview.EditIndex = -1;
            PopulateIndividuals();
        }

        protected void Individview_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Page.Validate("edit");
            if (!Page.IsValid)
            {
                return;
            }

            //Get ID
            int individualID = (int)IndividGridview.DataKeys[e.RowIndex]["IndividualId"];

            //Find Controls 
            TextBox txtLPName = (TextBox)IndividGridview.Rows[e.RowIndex].FindControl("txtLPName");
            TextBox txtLPFamilyName = (TextBox)IndividGridview.Rows[e.RowIndex].FindControl("txtLPFamilyName");
            TextBox txtFatherName = (TextBox)IndividGridview.Rows[e.RowIndex].FindControl("txtFatherName");
            TextBox txtIIN = (TextBox)IndividGridview.Rows[e.RowIndex].FindControl("txtIIN");
            TextBox txtAuthor = (TextBox)IndividGridview.Rows[e.RowIndex].FindControl("txtAuthor");

            using (MyDatabaseEntities dc = new MyDatabaseEntities())
            {
                var v = dc.LegalEntity.Where(a => a.ContactID.Equals(individualID)).FirstOrDefault();
                if (v != null)
                {
                    v.Name = txtLPName.Text.Trim();
                    v.FamilyName = txtLPFamilyName.Text.Trim();
                    v.FatherName = txtFatherName.Text.Trim();
                    v.BIN_IIN = txtIIN.Text.Trim();
                    v.Author = txtAuthor.Text.Trim();
                }
                dc.SaveChanges();
                IndividGridview.EditIndex = -1;
                PopulateIndividuals();
            }
        }
    }
}