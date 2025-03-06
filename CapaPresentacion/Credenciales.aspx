<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Credenciales.aspx.cs" Inherits="CapaPresentacion.Credenciales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="gvCredenciales" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Servicio" HeaderText="Servicio" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
                <asp:BoundField DataField="Correo" HeaderText="Correo" />
                <asp:BoundField DataField="Contraseña" HeaderText="Contraseña" />
                <asp:BoundField DataField="fecha_registro" HeaderText="Fecha de Registro" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                        <asp:LinkButton ID="lnkEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <p>
            <asp:Label ID="lblCredenciales" runat="server" Text="AGREGAR CREDENCIALES"></asp:Label>
        </p>
        <asp:Label ID="lblServicio" runat="server" Text="Servicio"></asp:Label>
        <asp:TextBox ID="txtServicio" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="lblCorreo" runat="server" Text="Correo"></asp:Label>
        <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="lblContraseña" runat="server" Text="Contraseña"></asp:Label>
            <asp:TextBox ID="txtContraseña" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
    </form>
</body>
</html>
