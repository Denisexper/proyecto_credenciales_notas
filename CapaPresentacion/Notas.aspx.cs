using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class Notas : System.Web.UI.Page
    {
        NotasNegocio NotasN = new NotasNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarNotas();
            }

        }

        protected void CargarNotas()
        {
            GvNotas.DataSource = NotasN.ObtenerNotas();
            GvNotas.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtTitulo.Text) || string.IsNullOrEmpty(txtContenido.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Error', 'Todos los campos son obligatorios', 'error')", true);
                return;
            }

            string titulo = txtTitulo.Text;
            string contenido = txtContenido.Text;

            DateTime fecha_creacion = DateTime.Now;

            bool exito = NotasN.InsertarNota(titulo, contenido, fecha_creacion);
            if (exito) 
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Exito', 'Nota guardada correctamente', 'success')", true);
                LimpiarCampos();
                CargarNotas();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Error', 'Ocurrio un error al guardar la nota', 'error')", true);
            }
        }

        protected void LimpiarCampos()
        {
            txtTitulo.Text = string.Empty;
            txtContenido.Text = string.Empty;
        }
    }
}