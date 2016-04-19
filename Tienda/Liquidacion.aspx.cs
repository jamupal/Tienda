using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tienda
{
    public partial class Liquidacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
            {
               
            }
        }
        
        public void MostrarCampos()
        {
            lblAcumulado.Visible = true;
            lblTotal.Visible = true;
            btnfacturar.Visible = true;
        }

        public void Limpiarcampos()
            {
            lblPrecio.Text = "";
            txtCantidad.Text = "";
            DropDownList1.SelectedIndex = 0;
            btnModificar.Visible = false;

            }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           if (DropDownList1.SelectedIndex == 1)
            {
                lblPrecio.Text = "1400";
                txtCantidad.Enabled = true;
            }
           if (DropDownList1.SelectedIndex == 2)
            {
                lblPrecio.Text = "1800";
                txtCantidad.Enabled = true;
            }
            if (DropDownList1.SelectedIndex == 3)
            {
                lblPrecio.Text = "1000";
                txtCantidad.Enabled = true;
            }
            if (DropDownList1.SelectedIndex == 4)
            {
                lblPrecio.Text = "2800";
                txtCantidad.Enabled = true;
            }
            if (DropDownList1.SelectedIndex == 5)
            {
                lblPrecio.Text = "3800";
                txtCantidad.Enabled = true;
            }
            if (DropDownList1.SelectedIndex == 6)
            {
                lblPrecio.Text = "1800";
                txtCantidad.Enabled = true;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            List<Productos> list = new List<Productos>();

            Productos nuevoProducto = new Productos();

            nuevoProducto.nombreProducto = DropDownList1.Text;
            nuevoProducto.precio = Convert.ToDecimal(lblPrecio.Text);
            nuevoProducto.cantidad = Convert.ToInt32(txtCantidad.Text);
            nuevoProducto.valor = nuevoProducto.cantidad * nuevoProducto.precio;

            if (Session["Productos"]!=null)
            {
                list = ((List<Productos>)Session["Productos"]);
            }

            list.Add(nuevoProducto);
            Session["Productos"] = list;

            GridView1.DataSource = list;
            GridView1.DataBind();

            decimal acum = 0;

            foreach (Productos item in list)
            {
                acum = acum + item.valor;
            }

            lblTotal.Text = acum.ToString();
            Limpiarcampos();
            MostrarCampos();
            txtCantidad.Enabled = false;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int indiceFila = Convert.ToInt32(e.CommandArgument.ToString());
            

            if (e.CommandName == "Editar")
            {
                DropDownList1.Text = GridView1.Rows[indiceFila].Cells[0].Text;
                lblPrecio.Text = GridView1.Rows[indiceFila].Cells[1].Text;
                txtCantidad.Text = GridView1.Rows[indiceFila].Cells[2].Text;

                DropDownList1.Enabled = false;
                btnAgregar.Visible = false;
                btnModificar.Visible = true;
                txtCantidad.Enabled = true;
            }


            if (e.CommandName == "Eliminar")
            {
               
                List<Productos> miLista = new List<Productos>();
                if (Session["Productos"] != null)
                {
                    miLista = ((List<Productos>)Session["Productos"]);
                }

                miLista.RemoveAt(indiceFila);

                Session["Productos"] = miLista;// guarde los registros

                GridView1.DataSource = miLista;
                GridView1.DataBind();

                decimal acum = 0;

                foreach (Productos item in miLista)
                {
                    acum = acum - item.valor;
                    
                }

                lblTotal.Text =Math.Abs(acum).ToString();

                if(acum == 0)
                {
                    lblTotal.Visible = false;
                    lblAcumulado.Visible = false;
                    btnfacturar.Visible = false;
                    btnModificar.Visible = false;
                }

            }
            
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string param_nombreProducto = DropDownList1.Text;

            List<Productos> miLista = new List<Productos>();
            if (Session["Productos"] != null)
            {
                miLista = ((List<Productos>)Session["Productos"]);
            }

            int indiceLista =
            miLista.FindIndex(s => s.nombreProducto == param_nombreProducto);

            miLista[indiceLista].precio =Convert.ToDecimal(lblPrecio.Text);
            miLista[indiceLista].cantidad =Convert.ToInt32(txtCantidad.Text);
            miLista[indiceLista].valor = miLista[indiceLista].precio * miLista[indiceLista].cantidad;

            Session["Productos"] = miLista;// guarde los registros

            GridView1.DataSource = miLista;
            GridView1.DataBind();

            decimal acum = 0;

            foreach (Productos item in miLista)
            {
                acum = acum + item.valor;
            }

            lblTotal.Text = acum.ToString();
            Limpiarcampos();
            DropDownList1.Enabled = true;
            btnAgregar.Visible = true;
            txtCantidad.Enabled = false;
        }

        protected void btnfacturar_Click(object sender, EventArgs e)
        {
            Session["Valor"] = lblTotal.Text;
            Response.Redirect("Factura.aspx");
        }
    }
    
}