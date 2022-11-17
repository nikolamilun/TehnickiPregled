using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proba
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpisi_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=TehnickiPregled; Trusted_Connection=true"))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand($"INSERT INTO TehnickiPregled (automobilID, kontrolorID, datumPregleda, cena, prosao) VALUES ({ddlAutomobil.SelectedValue}, {ddlKontrolor.SelectedValue},'{kalDatum.SelectedDate.ToString()}', {txtCena.Text}, '{cbProsao.Checked}')", conn);

                cmd.ExecuteNonQuery();
            }
        }
    }
}