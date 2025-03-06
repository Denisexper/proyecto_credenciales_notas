<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notas.aspx.cs" Inherits="CapaPresentacion.Notas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GvNotas" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Titulo" HeaderText="Titulo" />
                <asp:BoundField DataField="Contenido" HeaderText="Descripcion" />
                <asp:BoundField DataField="fecha_creacion" HeaderText="Fecha de Creacion" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                        <asp:LinkButton ID="lnkEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />

        <asp:Label ID="lblNotas" runat="server" Text="AGREGAR NOTAS"></asp:Label>
        <p>
            <asp:Label ID="lblTitulo" runat="server" Text="Titulo"></asp:Label>
            <asp:TextBox ID="txtTitulo" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="lbl" runat="server" Text="Contenido"></asp:Label>
        <asp:TextBox ID="txtContenido" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
        </p>
    </form>
</body>
</html>
