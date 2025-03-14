﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notas.aspx.cs" Inherits="CapaPresentacion.Notas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Gestión de Notas</title>
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
                <h1 class="text-3xl font-bold text-gray-800">Gestión de Notas</h1>
                <p class="text-gray-600">Administra y organiza tus notas de manera eficiente.</p>
            </div>

            <div class="flex space-x-8 items-start">
                
               <div class="w-2/3">
                        <asp:GridView ID="GvNotas"
                            runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                            CssClass="grid-view w-full border border-gray-300 rounded-lg shadow-md overflow-hidden"
                            OnRowCancelingEdit="GvNotas_RowCancelingEdit"
                            OnRowDeleting="GvNotas_RowDeleting"
                            OnRowEditing="GvNotas_RowEditing"
                            OnRowUpdating="GvNotas_RowUpdating">
                            <HeaderStyle CssClass="bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold text-left px-6 py-3" />
                            <RowStyle CssClass="bg-white border-b hover:bg-gray-50 transition duration-150" />
                            <AlternatingRowStyle CssClass="bg-gray-50 border-b hover:bg-gray-100 transition duration-150" />
                            <Columns>
                                <asp:BoundField DataField="titulo" HeaderText="titulo" ItemStyle-CssClass="px-6 py-4 text-gray-700" SortExpression="titulo" />
                                <asp:BoundField DataField="contenido" HeaderText="contenido" SortExpression="contenido" />
                                <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:credenciales_notasConnectionString2 %>" ProviderName="<%$ ConnectionStrings:credenciales_notasConnectionString2.ProviderName %>" SelectCommand="SELECT [titulo], [contenido], [fecha_creacion] FROM [notas]"></asp:SqlDataSource>
                </div>

                <div class="w-1/3 bg-gradient-to-r from-blue-50 to-purple-50 p-8 rounded-lg shadow-lg">
                    <h2 class="text-2xl font-bold text-gray-800 mb-6">Agregar una nota</h2>
                    <div class="space-y-6">
                        <div class="flex flex-col">
                            <asp:Label ID="lblTitulo" runat="server" Text="Título" CssClass="text-sm font-medium text-gray-700 mb-2"></asp:Label>
                            <asp:TextBox ID="txtTitulo" runat="server" CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"></asp:TextBox>
                        </div>
                        <div class="flex flex-col">
                            <asp:Label ID="lblContenido" runat="server" Text="Contenido" CssClass="text-sm font-medium text-gray-700 mb-2"></asp:Label>
                            <asp:TextBox ID="txtContenido" runat="server" CssClass="px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"></asp:TextBox>
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
