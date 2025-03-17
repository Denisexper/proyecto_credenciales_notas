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
    public class NotasDatos
    {
        private string conexionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        //obtener Notas
        public DataTable ObtenerNotas()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(conexionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM notas", con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }
            return dt;
        }

        public bool InsertarNota(string titulo, string contenido, DateTime fecha_creacion)
        {
            using (SqlConnection con = new SqlConnection(conexionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO notas (titulo, contenido, fecha_creacion) VALUES (@titulo, @contenido, @fecha_creacion)", con))
                {
                    cmd.Parameters.AddWithValue("@titulo", titulo);
                    cmd.Parameters.AddWithValue("@contenido", contenido);
                    cmd.Parameters.AddWithValue("@fecha_creacion", fecha_creacion);

                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
            
        }

        public bool ActualizarNota(int id, string titulo, string contenido, DateTime fecha_creacion)
        {
            using (SqlConnection con = new SqlConnection(conexionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE notas SET titulo = @titulo, contenido = @contenido, fecha_creacion = @fecha_creacion WHERE id = @id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@titulo", titulo);
                    cmd.Parameters.AddWithValue("@contenido", contenido);
                    cmd.Parameters.AddWithValue("@fecha_creacion", fecha_creacion);

                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }

        public bool EliminarNota(int id)
        {
            using (SqlConnection con = new SqlConnection(conexionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM notas WHERE id = @id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);

                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }
    }
}
