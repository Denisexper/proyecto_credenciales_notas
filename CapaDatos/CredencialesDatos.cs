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

        public bool InsertarCredenciales(string servicio, string usuario, string correo, string contraseña, DateTime fecha_registro)
        {
            using (SqlConnection con = new SqlConnection(conexionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO credenciales (servicio, usuario, correo, contraseña, fecha_registro) VALUES (@servicio, @usuario, @correo, @contraseña, @fecha_registro)", con))
                {
                    cmd.Parameters.AddWithValue("@servicio", servicio);
                    cmd.Parameters.AddWithValue("@usuario", usuario);
                    cmd.Parameters.AddWithValue("@correo", correo);
                    cmd.Parameters.AddWithValue("@contraseña", contraseña);
                    cmd.Parameters.AddWithValue("@fecha_registro", fecha_registro);

                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }

        public bool ActualizarCredenciales(int id, string servicio, string usuario, string correo, string contraseña, DateTime fecha_registro)
        {
            using (SqlConnection con = new SqlConnection(conexionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE credenciales SET servicio = @servicio, usuario = @usuario, correo = @correo, contraseña = @contraseña, fecha_registro = @fecha_registro WHERE id = @id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@servicio", servicio);
                    cmd.Parameters.AddWithValue("@usuario", usuario);
                    cmd.Parameters.AddWithValue("@correo", correo);
                    cmd.Parameters.AddWithValue("@contraseña", contraseña);
                    cmd.Parameters.AddWithValue("@fecha_registro", fecha_registro);

                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }

        public bool EliminarCredenciales(int id)
        {
            using (SqlConnection con = new SqlConnection(conexionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM credenciales WHERE id = @id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    
                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }
    }
}
