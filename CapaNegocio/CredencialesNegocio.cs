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

        public bool InsertarCredenciales(string servicio, string usuario, string correo, string contraseña, DateTime fecha_registro)
        {
            return DatosCredenciales.InsertarCredenciales(servicio, usuario, correo, contraseña, fecha_registro);
        }

        public bool ActualizarCredenciales(int id, string servicio, string usuario, string correo, string contraseña, DateTime fecha_registro)
        {
            return DatosCredenciales.ActualizarCredenciales(id, servicio, usuario, correo, contraseña, fecha_registro);
        }

        public bool EliminarCredenciales(int id)
        {
            return DatosCredenciales.EliminarCredenciales(id);
        }
    }
}
