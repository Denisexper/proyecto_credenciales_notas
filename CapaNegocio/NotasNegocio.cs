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
    }
}
