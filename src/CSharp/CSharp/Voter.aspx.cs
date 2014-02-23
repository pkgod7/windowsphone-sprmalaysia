using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.IO;

namespace CSharp
{
    public partial class Voter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllRecordsFromXML();
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string filename = Server.MapPath("Voter.xml");
            if (File.Exists(filename) == true)
            {
                XmlDocument xdoc = new XmlDocument();
                xdoc.Load(Server.MapPath("Voter.xml"));
                XmlElement Voter = xdoc.CreateElement("Voter");

                XmlElement Nric = xdoc.CreateElement("nric");
                XmlText xmlNric = xdoc.CreateTextNode(txtNric.Text);

                XmlElement Name = xdoc.CreateElement("name");
                XmlText xmlName = xdoc.CreateTextNode(txtName.Text);

                XmlElement Gender = xdoc.CreateElement("gender");
                XmlText xmlGender = xdoc.CreateTextNode(txtGender.SelectedItem.Text);

                XmlElement Parlimen = xdoc.CreateElement("parlimen");
                XmlText xmlParlimen = xdoc.CreateTextNode(txtParlimen.SelectedItem.Text);

                Nric.AppendChild(xmlNric);
                Name.AppendChild(xmlName);
                Gender.AppendChild(xmlGender);
                Parlimen.AppendChild(xmlParlimen);

                Voter.AppendChild(Nric);
                Voter.AppendChild(Name);
                Voter.AppendChild(Gender);
                Voter.AppendChild(Parlimen);

                xdoc.DocumentElement.AppendChild(Voter);
                xdoc.Save(Server.MapPath("Voter.xml"));
            }
            else
            {
                XmlTextWriter xtw = new XmlTextWriter(filename, null);
                xtw.WriteStartDocument();
                xtw.WriteStartElement("Voters");
                xtw.WriteStartElement("Voter");
                xtw.WriteElementString("nric", txtNric.Text);
                xtw.WriteElementString("name", txtName.Text);
                xtw.WriteElementString("gender", txtGender.SelectedItem.Text);
                xtw.WriteElementString("parlimen", txtParlimen.SelectedItem.Text);
                xtw.WriteEndElement();
                xtw.WriteEndElement();
                xtw.WriteEndDocument();
                xtw.Close();
            }
            Response.Redirect("Voter.aspx");
        }
        public void GetAllRecordsFromXML()
        {
            System.Data.DataSet ds = new System.Data.DataSet();
            ds.ReadXml(Server.MapPath("Voter.xml"));
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetAllRecordsFromXML();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetAllRecordsFromXML();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Nric = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            TextBox Name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
            DropDownList Gender = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1");
            DropDownList Parlimen = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList2");
         
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath("Voter.xml"));
            XmlNodeList NodeList = xdoc.SelectNodes("/Voters/Voter");
            foreach (XmlNode item in NodeList)
            {
                if (item.ChildNodes[0].InnerText == Nric.Text)
                {
                    item.ChildNodes[1].InnerText = Name.Text;
                    item.ChildNodes[2].InnerText = Gender.SelectedItem.Text;
                    item.ChildNodes[3].InnerText = Parlimen.SelectedItem.Text;
                }
            }
            xdoc.Save(Server.MapPath("Voter.xml"));
            GridView1.EditIndex = -1;
            GetAllRecordsFromXML();
        }
    }
}