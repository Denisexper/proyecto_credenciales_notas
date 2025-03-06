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
    }
}