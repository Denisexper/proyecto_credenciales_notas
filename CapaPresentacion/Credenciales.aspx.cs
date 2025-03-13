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

        protected void gvCredenciales_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCredenciales.EditIndex = e.NewEditIndex;
            CargarCredenciales();
        }

        protected void gvCredenciales_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvCredenciales.DataKeys[e.RowIndex].Values[0]);
            GridViewRow row = gvCredenciales.Rows[e.RowIndex];

            TextBox txtServicio = row.FindControl("txtServicio") as TextBox;
            TextBox txtUsuario = row.FindControl("txtUsuario") as TextBox;
            TextBox txtCorreo = row.FindControl("txtCorreo") as TextBox;
            TextBox txtContraseña = row.FindControl("txtContraseña") as TextBox;


            string Servicio = txtServicio.Text;
            string Usuario = txtUsuario.Text;
            string Correo = txtCorreo.Text;
            string Contraseña = txtContraseña.Text;
            DateTime fecha_creacion = DateTime.Now;

            if (credencialesN.ActualizarCredenciales(id, Servicio, Usuario, Correo, Contraseña, fecha_creacion))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Exito', 'Nota actualizada correctamente', 'success')", true);

                gvCredenciales.EditIndex = -1;
                CargarCredenciales();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Error', 'Ocurrio un error al actualizar la nota', 'error')", true);
                return;
            }
        }

        protected void gvCredenciales_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCredenciales.EditIndex = -1;
            CargarCredenciales();
        }

        protected void gvCredenciales_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvCredenciales.DataKeys[e.RowIndex].Values[0]);
            if (credencialesN.EliminarCredenciales(id))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Exito', 'Nota eliminada correctamente', 'success')", true);
                CargarCredenciales();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert",
                    "swal.fire('Error', 'Ocurrio un error al eliminar la nota', 'error')", true);
                return;
            }
        }
    }
}