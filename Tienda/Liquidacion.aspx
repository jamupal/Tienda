<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Liquidacion.aspx.cs" Inherits="Tienda.Liquidacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Content/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="Content/js/bootstrap.min.js" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="panel panel-default">
            <div class="panel-heading text-center">
                <h2>Tienda de abarrotes Doña Pacha</h2>
            </div>
            <div class="panel-body">

                <div class="col-md-12 column">
                    <div class="row clearfix">
                        <div class="col-md-6 col-md-offset-4">

                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <label>Nombre Producto</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn btn-default dropdown-menu-right" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        <asp:ListItem>Seleccione Producto</asp:ListItem>
                                        <asp:ListItem>Arroz</asp:ListItem>
                                        <asp:ListItem>Frijoles</asp:ListItem>
                                        <asp:ListItem>Pastas</asp:ListItem>
                                        <asp:ListItem>Crema dental</asp:ListItem>
                                        <asp:ListItem>Leche</asp:ListItem>
                                        <asp:ListItem>Jabon</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <label>Precio</label>
                                </div>
                                <div class="col-md-8">
                                    <asp:Label ID="lblPrecio" runat="server"></asp:Label>
                                </div>
                            </div>
                            <br />
                            <div class="row clearfix">

                                <div class="col-md-4">
                                    <label>Cantidad</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtCantidad" CssClass="form-control " placeholder="Ingrese la cantidad" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row text-center">
                                <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-default text-center" Text="Agregar" OnClick="btnAgregar_Click" />&nbsp;
                                <asp:Button ID="btnModificar" runat="server" CssClass="btn btn-default text-center" Text="Modificar" OnClick="btnModificar_Click" />
                            </div>

                            <br />

                            <div class="table-responsive  col-md-12 text-center">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Medium" Width="100%" AllowPaging="True" PageSize="7" href="#collapseExample" OnRowCommand="GridView1_RowCommand">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                                    <Columns>
                                        <asp:BoundField HeaderText="Nombre de producto" DataField="nombreProducto" HeaderStyle-CssClass="text-center" />
                                        <asp:BoundField HeaderText="Precio" DataField="precio" HeaderStyle-CssClass="text-center" />
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad" HeaderStyle-CssClass="text-center" />
                                        <asp:BoundField HeaderText="Valor" DataField="valor" HeaderStyle-CssClass="text-center" />
                                        <asp:ButtonField Text="Editar" HeaderText="Editar" CommandName="Editar" HeaderStyle-CssClass="text-center" />
                                        <asp:ButtonField Text="Eliminar" HeaderText="Eliminar" CommandName="Eliminar" HeaderStyle-CssClass="text-center" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="text-center" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" HorizontalAlign="Center" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>  
                                             <br />
                                                          
                                    </div>
                             
                                    <div style="font:bold">
                              
                                        <asp:Label ID="lblAcumulado" runat="server" Text="Total Acumulalado $" Visible="false"></asp:Label>
                                        <asp:Label ID="lblTotal" runat="server" Visible="false"></asp:Label>
                                    </div>
                            <br />
                                    <div class="row text-center">
                                        <asp:Button ID="btnfacturar" runat="server" CssClass="btn btn-default text-center" Text="Facturar" Visible="false" OnClick="btnfacturar_Click" />
                                    </div>

                                </div>

                            </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
