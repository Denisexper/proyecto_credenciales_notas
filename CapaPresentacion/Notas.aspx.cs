using CapaNegocio;
using System;
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
            if (string.IsNullOrEmpty(txtTitulo.Text) || string.IsNullOrEmpty(txtContenido.Text))
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

        protected void GvNotas_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvNotas.EditIndex = e.NewEditIndex;
            CargarNotas();
        }

        protected void GvNotas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
 


            int id = Convert.ToInt32(GvNotas.DataKeys[e.RowIndex].Value);
            GridViewRow row = GvNotas.Rows[e.RowIndex];

            string titulo = (row.Cells[0].Controls[0] as System.Web.UI.WebControls.TextBox).Text;
            string contenido = (row.Cells[1].Controls[0] as System.Web.UI.WebControls.TextBox).Text;

            DateTime fecha_creacion = DateTime.Now;

            if (NotasN.ActualizarNota(id, titulo, contenido, fecha_creacion))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Exito', 'Nota actualizada correctamente', 'success')", true);

                GvNotas.EditIndex = -1;
                CargarNotas();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Error', 'Ocurrio un error al actualizar la nota', 'error')", true);
            }
        }

        protected void GvNotas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvNotas.EditIndex = -1;
            CargarNotas();
        }

        protected void GvNotas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GvNotas.DataKeys[e.RowIndex].Values[0]);
            if (NotasN.EliminarNota(id))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Exito', 'Nota eliminada correctamente', 'success')", true);
                CargarNotas();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Error', 'Ocurrio un error al eliminar la nota', 'error')", true);
            }
        }
    }
}
