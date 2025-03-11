<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notas.aspx.cs" Inherits="CapaPresentacion.Notas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Gestión de Notas</title>
</head>
<body class="bg-blue-200">
    <form id="form1" runat="server">
       
        <nav class="bg-blue-600 shadow-lg fixed w-full top-0 z-50">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    
                    <div class="flex items-center">
                        <a href="Principal.aspx" class="text-white text-lg font-semibold hover:text-gray-200 transition duration-300">Dashboard</a>
                    </div>
                   
                    <div class="flex items-center space-x-4">
                        <a href="Credenciales.aspx" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-blue-700 hover:text-gray-200 transition duration-300">Credenciales</a>
                        <a href="Notas.aspx" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-blue-700 hover:text-gray-200 transition duration-300">Notas</a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="max-w-4xl mx-auto p-8 bg-white rounded-lg shadow-md mt-16">
            <div class="mb-8">
                <h1 class="text-2xl font-bold text-gray-800">Gestión de Notas</h1>
            </div>

            <asp:GridView ID="GvNotas" runat="server" AutoGenerateColumns="false" CssClass="min-w-full bg-white border border-gray-200 rounded-lg shadow-sm">
                <Columns>
                    <asp:BoundField DataField="Titulo" HeaderText="Título" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-900" />
                    <asp:BoundField DataField="Contenido" HeaderText="Descripción" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-900" />
                    <asp:BoundField DataField="fecha_creacion" HeaderText="Fecha de Creación" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-900" />
                    <asp:TemplateField HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' CssClass="text-blue-600 hover:text-blue-900"></asp:LinkButton>
                            <asp:LinkButton ID="lnkEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="text-red-600 hover:text-red-900 ml-2"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="mt-8">
                <h2 class="text-xl font-semibold text-gray-800 mb-4">Agregar Notas</h2>
                <div class="space-y-4">
                    <div>
                        <asp:Label ID="lblTitulo" runat="server" Text="Título" CssClass="block text-sm font-medium text-gray-700"></asp:Label>
                        <asp:TextBox ID="txtTitulo" runat="server" CssClass="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lbl" runat="server" Text="Contenido" CssClass="block text-sm font-medium text-gray-700"></asp:Label>
                        <asp:TextBox ID="txtContenido" runat="server" CssClass="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" CssClass="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>