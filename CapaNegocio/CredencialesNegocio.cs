using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CredencialesNegocio
    {
        CredencialesDatos DatosCredenciales = new CredencialesDatos();


        public DataTable ObtenerCredenciales()
        {
            return DatosCredenciales.ObtenerCredeciales();
        }
    }
}
