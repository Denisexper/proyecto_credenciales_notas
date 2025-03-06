using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class NotasNegocio
    {
        NotasDatos DatosNotas = new NotasDatos();

        public DataTable ObtenerNotas()
        {
            return DatosNotas.ObtenerNotas();
        }

        public bool InsertarNota(string titulo, string contenido, DateTime fecha_creacion)
        {
            return DatosNotas.InsertarNota(titulo, contenido, fecha_creacion);
        }

        public bool ActualizarNota(int id, string titulo, string contenido, DateTime fecha_creacion)
        {
            return DatosNotas.ActualizarNota(id, titulo, contenido, fecha_creacion);
        }

        public bool EliminarNota(int id)
        {
            return DatosNotas.EliminarNota(id);
        }
    }
}
