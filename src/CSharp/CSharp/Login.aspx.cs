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
    public partial class Login1 : System.Web.UI.Page
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
            string filename = Server.MapPath("Login.xml");
            if (File.Exists(filename) == true)
            {
                XmlDocument xdoc = new XmlDocument();
                xdoc.Load(Server.MapPath("Login.xml"));
                XmlElement Student = xdoc.CreateElement("Student");

                XmlElement Username = xdoc.CreateElement("username");
                XmlText xmlUsername = xdoc.CreateTextNode(txtUsername.Text);

                XmlElement Password = xdoc.CreateElement("password");
                XmlText xmlPassword = xdoc.CreateTextNode(txtPassword.Text);

                Username.AppendChild(xmlUsername);
                Password.AppendChild(xmlPassword);

                Student.AppendChild(Username);
                Student.AppendChild(Password);

                xdoc.DocumentElement.AppendChild(Student);
                xdoc.Save(Server.MapPath("Login.xml"));
            }
            else
            {
                XmlTextWriter xtw = new XmlTextWriter(filename, null);
                xtw.WriteStartDocument();
                xtw.WriteStartElement("Students");
                xtw.WriteStartElement("Student");
                xtw.WriteElementString("username", txtUsername.Text);
                xtw.WriteElementString("password", txtPassword.Text);
                xtw.WriteEndElement();
                xtw.WriteEndElement();
                xtw.WriteEndDocument();
                xtw.Close();
            }
            Response.Redirect("Login.aspx");
        }
        public void GetAllRecordsFromXML()
        {
            System.Data.DataSet ds = new System.Data.DataSet();
            ds.ReadXml(Server.MapPath("Login.xml"));
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}