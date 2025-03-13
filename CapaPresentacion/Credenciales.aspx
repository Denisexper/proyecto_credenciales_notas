﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Credenciales.aspx.cs" Inherits="CapaPresentacion.Credenciales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Gestión de Credenciales</title>
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

            <div class="flex space-x-8 items-start">

                <div class="w-2/3">
                    <asp:GridView ID="gvCredenciales" runat="server" AutoGenerateColumns="false"
                        CssClass="w-full bg-white border border-gray-300 rounded-lg shadow-md overflow-hidden"
                        OnRowCancelingEdit="gvCredenciales_RowCancelingEdit"
                        OnRowDeleting="gvCredenciales_RowDeleting"
                        OnRowEditing="gvCredenciales_RowEditing"
                        OnRowUpdating="gvCredenciales_RowUpdating"
                        DataKeyNames="Id">

                        <HeaderStyle CssClass="bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold text-left px-6 py-3" />
                        <RowStyle CssClass="bg-white border-b hover:bg-gray-50 transition duration-150" />
                        <AlternatingRowStyle CssClass="bg-gray-50 border-b hover:bg-gray-100 transition duration-150" />

                        <Columns>

                            <asp:TemplateField HeaderText="Servicio">
                                <ItemTemplate>
                                    <asp:Label ID="lblServicio" runat="server" Text='<%# Eval("Servicio") %>' CssClass="px-6 py-4 block text-gray-700"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtServicio" runat="server" Text='<%# Eval("Servicio") %>' CssClass="border p-2 w-full rounded-md focus:ring-2 focus:ring-blue-500"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Usuario">
                                <ItemTemplate>
                                    <asp:Label ID="lblUsuario" runat="server" Text='<%# Eval("Usuario") %>' CssClass="px-6 py-4 block text-gray-700"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUsuario" runat="server" Text='<%# Eval("Usuario") %>' CssClass="border p-2 w-full rounded-md focus:ring-2 focus:ring-blue-500"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Correo">
                                <ItemTemplate>
                                    <asp:Label ID="lblCorreo" runat="server" Text='<%# Eval("Correo") %>' CssClass="px-6 py-4 block text-gray-700"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCorreo" runat="server" Text='<%# Eval("Correo") %>' CssClass="border p-2 w-full rounded-md focus:ring-2 focus:ring-blue-500"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Contraseña">
                                <ItemTemplate>
                                    <asp:Label ID="lblContraseña" runat="server" Text='<%# Eval("Contraseña") %>' CssClass="px-6 py-4 block text-gray-700"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtContraseña" runat="server" Text='<%# Eval("Contraseña") %>' CssClass="border p-2 w-full rounded-md focus:ring-2 focus:ring-blue-500"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="fecha_registro" HeaderText="Fecha de Registro" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-CssClass="px-6 py-4 text-gray-700" />

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="flex flex-col space-y-2">
                                        <asp:LinkButton ID="lnkEditar" runat="server" Text="Editar" CommandName="Edit"
                                            CssClass="text-blue-500 hover:text-blue-700 font-semibold transition duration-150"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkEliminar" runat="server" Text="Eliminar" CommandName="Delete"
                                            CssClass="text-red-500 hover:text-red-700 font-semibold transition duration-150"></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="flex flex-col space-y-2">
                                        <asp:LinkButton ID="lnkActualizar" runat="server" Text="Actualizar" CommandName="Update"
                                            CssClass="text-green-500 hover:text-green-700 font-semibold transition duration-150"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkCancelar" runat="server" Text="Cancelar" CommandName="Cancel"
                                            CssClass="text-gray-500 hover:text-gray-700 font-semibold transition duration-150"></asp:LinkButton>
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>

                <div class="w-1/3 bg-gradient-to-r from-blue-50 to-purple-50 p-8 rounded-lg shadow-lg">
                    <h2 class="text-2xl font-bold text-gray-800 mb-6">Agregar Credenciales</h2>
                    <div class="space-y-6">
                        <div class="flex flex-col">
                            <asp:Label ID="lblServicio" runat="server" Text="Servicio" CssClass="text-sm font-medium text-gray-700 mb-2"></asp:Label>
                            <asp:TextBox ID="txtServicio" runat="server" CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"></asp:TextBox>
                        </div>
                        <div class="flex flex-col">
                            <asp:Label ID="lblUsuario" runat="server" Text="Usuario" CssClass="text-sm font-medium text-gray-700 mb-2"></asp:Label>
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"></asp:TextBox>
                        </div>
                        <div class="flex flex-col">
                            <asp:Label ID="lblCorreo" runat="server" Text="Correo" CssClass="text-sm font-medium text-gray-700 mb-2"></asp:Label>
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"></asp:TextBox>
                        </div>
                        <div class="flex flex-col">
                            <asp:Label ID="lblContraseña" runat="server" Text="Contraseña" CssClass="text-sm font-medium text-gray-700 mb-2"></asp:Label>
                            <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"></asp:TextBox>
                        </div>
                        <div class="flex justify-end">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" CssClass="inline-flex justify-center py-2 px-6 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>