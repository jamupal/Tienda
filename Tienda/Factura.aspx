<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="Tienda.Factura" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td>Numero de Identificación</td>
                <td>
                    <asp:TextBox ID="txtIdentificacion" runat="server"></asp:TextBox>
                </td>             
            </tr>
            <tr>
                <td>
                    Nombre
                </td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    Numero Factura
                </td>
                <td>
                    <asp:TextBox ID="txtNumeroFactura" runat="server"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    Valor Total
                </td>
                <td>
                    <asp:Label ID="lblValorTotal" runat="server" ></asp:Label>
                </td>
            </tr>
        </table>

        <div>
            <asp:Button ID="btnPagar" runat="server" Text="Pagar" OnClick="btnPagar_Click" />
        </div>
        <div>
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
