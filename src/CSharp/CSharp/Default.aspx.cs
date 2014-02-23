using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
namespace CSharp
{
    public partial class Default : System.Web.UI.Page
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
            string filename = Server.MapPath("StudentData.xml");
            if (File.Exists(filename) == true)
            {
                XmlDocument xdoc = new XmlDocument();
                xdoc.Load(Server.MapPath("StudentData.xml"));
                XmlElement Student = xdoc.CreateElement("Student");
                
                XmlElement ID = xdoc.CreateElement("ID");
                XmlText xmlID = xdoc.CreateTextNode(txtID.Text);

                XmlElement FirstName = xdoc.CreateElement("FirstName");
                XmlText xmlFirstName = xdoc.CreateTextNode(txtFirstName.Text);

                XmlElement LastName = xdoc.CreateElement("LastName");
                XmlText xmlLastName = xdoc.CreateTextNode(txtLastName.Text);

                XmlElement City = xdoc.CreateElement("City");
                XmlText xmlCity = xdoc.CreateTextNode(ddlCity.SelectedItem.Text);

                XmlElement Gender = xdoc.CreateElement("Gender");
                XmlText xmlGender = xdoc.CreateTextNode(rblGender.SelectedItem.Text);

                XmlElement Pincode = xdoc.CreateElement("Pincode");
                XmlText xmlPincode = xdoc.CreateTextNode(txtPincode.Text);

                XmlElement MobileNo = xdoc.CreateElement("MobileNo");
                XmlText xmlMobileNo = xdoc.CreateTextNode(txtMobileNo.Text);

                ID.AppendChild(xmlID);
                FirstName.AppendChild(xmlFirstName);
                LastName.AppendChild(xmlLastName);
                City.AppendChild(xmlCity);
                Gender.AppendChild(xmlGender);
                Pincode.AppendChild(xmlPincode);
                MobileNo.AppendChild(xmlMobileNo);

                Student.AppendChild(ID);
                Student.AppendChild(FirstName);
                Student.AppendChild(LastName);
                Student.AppendChild(City);
                Student.AppendChild(Gender);
                Student.AppendChild(Pincode);
                Student.AppendChild(MobileNo);

                xdoc.DocumentElement.AppendChild(Student);
                xdoc.Save(Server.MapPath("StudentData.xml"));
            }
            else
            {
                XmlTextWriter xtw = new XmlTextWriter(filename, null);
                xtw.WriteStartDocument();
                xtw.WriteStartElement("Students");
                xtw.WriteStartElement("Student");
                xtw.WriteElementString("ID",txtID.Text);
                xtw.WriteElementString("FirstName",txtFirstName.Text);
                xtw.WriteElementString("LastName", txtLastName.Text);
                xtw.WriteElementString("City", ddlCity.SelectedItem.Text);
                xtw.WriteElementString("Gender", rblGender.SelectedItem.Text);
                xtw.WriteElementString("Pincode", txtPincode.Text);
                xtw.WriteElementString("MobileNo", txtMobileNo.Text);
                xtw.WriteEndElement();
                xtw.WriteEndElement();
                xtw.WriteEndDocument();
                xtw.Close();
            }
            Response.Redirect("Default.aspx");
        }
        public void GetAllRecordsFromXML()
        {
            System.Data.DataSet ds = new System.Data.DataSet();
            ds.ReadXml(Server.MapPath("StudentData.xml"));
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
            TextBox ID=(TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
            TextBox FirstName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2");
            TextBox LastName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");
            DropDownList City = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList2");
            DropDownList Gender = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList3");
            TextBox Pincode = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4");
            TextBox MobileNo = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5");
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath("StudentData.xml"));
            XmlNodeList NodeList = xdoc.SelectNodes("/Students/Student");
            foreach (XmlNode item in NodeList)
            {
                if (item.ChildNodes[0].InnerText == ID.Text)
                {
                    item.ChildNodes[1].InnerText = FirstName.Text;
                    item.ChildNodes[2].InnerText = LastName.Text;
                    item.ChildNodes[3].InnerText = City.SelectedItem.Text;
                    item.ChildNodes[4].InnerText = Gender.SelectedItem.Text;
                    item.ChildNodes[5].InnerText = Pincode.Text;
                    item.ChildNodes[6].InnerText = MobileNo.Text;
                }
            }
            xdoc.Save(Server.MapPath("StudentData.xml"));
            GridView1.EditIndex = -1;
            GetAllRecordsFromXML();            
        }

    }
}