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
    }
}