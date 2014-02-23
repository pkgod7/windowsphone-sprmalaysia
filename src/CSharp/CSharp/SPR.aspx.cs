using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace CSharp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Boolean valid = false;
            try
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(Server.MapPath("Login.xml"));
                XmlElement root = doc.DocumentElement;
                XmlNodeList errorNodes = root.SelectNodes("/Students/Student");
                foreach (XmlNode errorNode in errorNodes)
                {
                    if ((TextBox1.Text.Equals(errorNode["username"].InnerText)) && (TextBox2.Text.Equals(errorNode["password"].InnerText)))
                    {
                        valid = true;
                    }
                }
            }
            catch (Exception err)
            {
            }
            TextBox1.Text = "";
            TextBox2.Text = "";
            if (valid == false)
            {
                Label1.Text = "Incorrect username and password.";
            }
            else if (valid == true)
            {
                Label1.Text = "Login success.";
                Response.Redirect("Voter.aspx");
            }
        }
    }
}