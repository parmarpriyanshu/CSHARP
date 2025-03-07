using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LoginForm
{
    public partial class Form1: Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private void btnlogin_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            if (txtunm.Text != "" && txtpwd.Text != "")
            {
                string sql = "select * from login_new where username='" + txtunm.Text + "' and password ='" + txtpwd.Text + "'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count== 1)
                {
                    Form2 f2 = new Form2();
                    f2.Show();
                    this.Hide();
                }
            }         
        }
    }
}
