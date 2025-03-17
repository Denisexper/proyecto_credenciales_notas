<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Credenciales.aspx.cs" Inherits="CapaPresentacion.Credenciales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Gestión de Credenciales</title>
    <style>
        .grid-view {
            table-layout: fixed;
            width: 100%;
        }
        .grid-view td, .grid-view th {
            word-wrap: break-word;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .grid-view .edit-item input {
            width: 100%;
            box-sizing: border-box;
        }
    </style>
</head>
<body class="bg-gradient-to-r from-blue-100 to-purple-100">
    <form id="form1" runat="server">
        <nav class="bg-gradient-to-r from-blue-600 to-purple-600 shadow-lg fixed w-full top-0 z-50">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex items-center">
                        <a href="Principal.aspx" class="text-white text-lg font-semibold hover:text-gray-200 transition duration-300">Dashboard</a>
                    </div>
                    <div class="flex items-center space-x-4">
                        <a href="Credenciales.aspx" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-blue-700 hover:text-gray-200 transition duration-300">Credenciales</a>
                        <a href="Notas.aspx" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-purple-700 hover:text-gray-200 transition duration-300">Notas</a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="max-w-7xl mx-auto p-8 bg-white rounded-lg shadow-2xl mt-16">
            <div class="mb-8">
                <h1 class="text-3xl font-bold text-gray-800">Gestión de Credenciales</h1>
                <p class="text-gray-600">Administra y organiza tus credenciales de manera segura.</p>
            </div>

            <div class="flex flex-col space-y-8 items-start h-screen w-full">
                
                <div class="w-full bg-gradient-to-r from-blue-50 to-purple-50 p-8 rounded-lg shadow-lg">
                    <h2 class="text-2xl font-bold text-gray-800 mb-6">Agregar Credenciales</h2>
                    <div class="flex space-x-6 items-end w-full">
                         <div class="flex flex-col w-1/3">
                            <asp:TextBox ID="txtServicio" runat="server" Placeholder="Servicio"
                                CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" />
                        </div>
                        <div class="flex flex-col w-1/3">
                            <asp:TextBox ID="txtUsuario" runat="server" Placeholder="Usuario"
                                CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" />
                        </div>
                        <div class="flex flex-col w-1/3">
                            <asp:TextBox ID="txtCorreo" runat="server" Placeholder="Correo"
                                CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" />
                        </div>
                        <div class="flex flex-col w-1/3">
                            <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" Placeholder="Contraseña"
                                CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" />
                        </div>
                        <div class="flex flex-col w-1/3">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" CssClass="inline-flex justify-center py-2 px-6 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500" />
                        </div>
                    </div>
                </div>

                <div class="w-full">
                    <asp:GridView ID="gvCredenciales" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                        CssClass="grid-view w-full bg-white border border-gray-300 rounded-lg shadow-md overflow-hidden"
                        OnRowCancelingEdit="gvCredenciales_RowCancelingEdit"
                        OnRowDeleting="gvCredenciales_RowDeleting"
                        OnRowEditing="gvCredenciales_RowEditing"
                        OnRowUpdating="gvCredenciales_RowUpdating" >

                        <HeaderStyle CssClass="bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold text-left px-6 py-3" />
                        <RowStyle CssClass="bg-white border-b hover:bg-gray-50 transition duration-150" />
                        <AlternatingRowStyle CssClass="bg-gray-50 border-b hover:bg-gray-100 transition duration-150" />

                        <Columns>

                            <asp:BoundField DataField="usuario" HeaderText="usuario" ItemStyle-CssClass="px-6 py-4 text-gray-700" SortExpression="usuario" />

                            <asp:BoundField DataField="servicio" HeaderText="servicio" SortExpression="servicio" />
                            <asp:BoundField DataField="correo" HeaderText="correo" SortExpression="correo" />
                            <asp:BoundField DataField="contraseña" HeaderText="contraseña" SortExpression="contraseña" />
                            <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" ReadOnly="true" />
            
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditar" runat="server" CommandName="Edit"
                                        CssClass="px-3 py-1 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition duration-150">
                                        Editar
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Seguro que deseas eliminar esta nota?');"
                                        CssClass="px-3 py-1 bg-red-500 text-white rounded-lg hover:bg-red-600 transition duration-150 ml-2">
                                        Eliminar
                                    </asp:LinkButton>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnActualizar" runat="server" CommandName="Update"
                                        CssClass="px-3 py-1 bg-green-500 text-white rounded-lg hover:bg-green-600 transition duration-150">
                                        Guardar
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnCancelar" runat="server" CommandName="Cancel"
                                        CssClass="px-3 py-1 bg-gray-500 text-white rounded-lg hover:bg-gray-600 transition duration-150 ml-2">
                                        Cancelar
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>"  SelectCommand="SELECT [usuario], [servicio], [correo], [contraseña], [fecha_registro] FROM [credenciales]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
    
</body>
</html>