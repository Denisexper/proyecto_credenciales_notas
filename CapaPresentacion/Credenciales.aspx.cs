using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class Credenciales : System.Web.UI.Page
    {
        CredencialesNegocio credencialesN = new CredencialesNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                CargarCredenciales();
            }
        }

        protected void CargarCredenciales()
        {
            gvCredenciales.DataSource = credencialesN.ObtenerCredenciales();
            gvCredenciales.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtServicio.Text) || string.IsNullOrEmpty(txtUsuario.Text) || string.IsNullOrEmpty(txtCorreo.Text) || string.IsNullOrEmpty(txtContraseña.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert", 
                    "swal.fire('Error', 'Todos los campos son obligatorios', 'error')", true);

                return;
            }

            string servicio = txtServicio.Text;
            string usuario = txtUsuario.Text;
            string correo = txtCorreo.Text;
            string contraseña = txtContraseña.Text;
            DateTime fecha_registro = DateTime.Now;

            bool exito = credencialesN.InsertarCredenciales(servicio, usuario, correo, contraseña, fecha_registro);
            if (exito)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Exito', 'Credencial guardada correctamente', 'success')", true);
                LimpiarCampos();
                CargarCredenciales();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Error', 'Ocurrio un error al guardar la credencial', 'error')", true);
            }
        }

        protected void LimpiarCampos()
        {
            txtServicio.Text = string.Empty;
            txtUsuario.Text = string.Empty;
            txtCorreo.Text = string.Empty;
            txtContraseña.Text = string.Empty;
        }
    }
}