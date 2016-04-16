using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tienda
{
    public partial class Factura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblValorTotal.Text = Session["Valor"].ToString();
            }
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Senor(a) " + txtNombre.Text + " Muchas gracias por su compra";
        }
    }
}