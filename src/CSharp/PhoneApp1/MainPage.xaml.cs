using System;
using System.Xml;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Microsoft.Phone.Controls;
using System.Xml.Linq;
namespace PhoneApp1
{
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        public MainPage()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                WebClient downloader = new WebClient();
                Uri uri = new Uri("http://localhost:50279/Voter.xml", UriKind.Absolute);
                downloader.DownloadStringCompleted += new DownloadStringCompletedEventHandler(RecordsDownloaded);
                downloader.DownloadStringAsync(uri);
            }
            catch (Exception err)
            {
            }
        }
        public void RecordsDownloaded(object sender, DownloadStringCompletedEventArgs e)
        {
            try
            {
                XElement xelement = XElement.Parse(e.Result);
                IEnumerable<XElement> Voters = xelement.Elements();
                foreach (var Voter in Voters)
                {
                    if (Voter.Element("nric").Value.Equals(textBox1.Text))
                    {
                        textBlock2.Text = "";
                        textBlock2.Text = textBlock2.Text + "NRIC : "+ Voter.Element("nric").Value + "\n" + "Name : " + Voter.Element("name").Value + "\n" + "Gender : " + Voter.Element("gender").Value + "\n" + "Parlimen : " + Voter.Element("parlimen").Value + "\n";
                    }
                }
            }
            catch (Exception err)
            {
            }
            if (textBlock2.Text.Length == 0)
            {
                textBlock2.Text = "No record founded!";
            }
        }
    }
}