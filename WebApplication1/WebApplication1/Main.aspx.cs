using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication1
{
    public partial class Main : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            rememberBtn.Click += new EventHandler(btnRemember_Click);
            btnOrder.Click += new EventHandler(btnOrder_Click);
        }

        public void btnRemember_Click(object sender, EventArgs e)
        {
            string LastName = txtLastName.Text;
            string FirstName = txtFirstName.Text;

            txtComment.Text = "success";


            try
            {
                SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                //SqlConnection connection = new SqlConnection("Data Source=35.188.203.25,1433; Network Library=DBMSSOCN; Initial Catalog=UserInformation; User ID=admin; Password=password12!;");
                SqlCommand cmd = new SqlCommand("SELECT * FROM UserInformation where LastName = @txtLastName and FirstName = @txtFirstName;", connection);

                cmd.Parameters.AddWithValue("@txtFirstName", FirstName);
                cmd.Parameters.AddWithValue("@txtLastName", LastName);
                connection.Open();
                SqlDataReader ds = cmd.ExecuteReader();
                if(ds.HasRows)
                {
                    while (ds.Read())
                    {
                        int DeliveryStatus;
                        txtLastName.Text = ds.GetString(0);
                        txtFirstName.Text = ds.GetString(1);
                        txtPostalcode.Text = ds.GetString(2);
                        txtPhone.Text = ds.GetString(3);
                        listProvince.SelectedValue = ds.GetString(4);
                        foodCheckbox.SelectedValue = ds.GetString(5);
                        DeliveryStatus = Convert.ToInt32(ds.GetByte(6));
                        if (DeliveryStatus == 0)
                        {
                            RadioButton1.Checked = true;
                        }
                        else if (DeliveryStatus == 1)
                        {
                            RadioButton2.Checked = true;
                        }
                        txtComment.Text = "success";
                    }
                }
                else
                {
                    txtComment.Text = "User Not Found";
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                txtComment.Text = ex.Message;
            }
        }

        public void btnOrder_Click(object sender, EventArgs e)
        {
            bool check = true;
            string LastName = txtLastName.Text;
            string FirstName = txtFirstName.Text;
            string PostalCode = txtPostalcode.Text;
            string PhoneNumber = txtPhone.Text;
            string Province = listProvince.SelectedItem.Text;
            string Menu = foodCheckbox.SelectedItem.Text;
            int DeliveryStatus;
            string Comments = txtComment.Text;

            if(RadioButton1.Checked == true)
            {
                check = true;
            }
            else if (RadioButton2.Checked == true)
            {
                check = false;
            }

            if(check)
            {
                DeliveryStatus = 0;
            }
            else
            {
                DeliveryStatus = 1;
            }

            try
            {
                SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

                //SqlConnection connection = new SqlConnection("Data Source=35.188.203.25,1433; Network Library=DBMSSOCN; Initial Catalog=UserInformation; User ID=admin; Password=password12!;");
                SqlCommand cmd = new SqlCommand("INSERT INTO [UserInformation] ([LastName], [FirstName], [PostalCode], [PhoneNumber], [Province], " +
                "[Menu], [DeliveryOption], [Comment])" +
                " VALUES ( @LastName, @FirstName, @PostalCode, @PhoneNumber, @Province, @Menu, @DeliveryStatus, @Comments)");
                {
                    cmd.Connection = connection;
                    connection.Open();


                    cmd.Parameters.AddWithValue("@LastName", LastName);
                    cmd.Parameters.AddWithValue("@Firstname", FirstName);
                    cmd.Parameters.AddWithValue("@PostalCode", PostalCode);
                    cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
                    cmd.Parameters.AddWithValue("@Province", Province);
                    cmd.Parameters.AddWithValue("@Menu", Menu);
                    cmd.Parameters.AddWithValue("@DeliveryStatus", DeliveryStatus);
                    cmd.Parameters.AddWithValue("@Comments", txtComment.Text);
                    cmd.ExecuteNonQuery();
                    connection.Close();

                    txtComment.Text = "Success!!";

                }
            }
            catch
            {
                txtComment.Text = "Connection Failed";
            }
        }
    }
}