using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CapaDatos
{
    public class CredencialesDatos
    {
        private string conexionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        public DataTable ObtenerCredeciales() 
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(conexionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM credenciales", con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }
            return dt;
        }
    }
}
