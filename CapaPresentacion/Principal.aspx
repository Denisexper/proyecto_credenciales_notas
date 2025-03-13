﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="CapaPresentacion.Principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Dashboard</title>
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


        <div class="max-w-4xl mx-auto p-8 bg-white rounded-lg shadow-2xl mt-16">
            <h1 class="text-3xl font-bold text-gray-800 mb-4">Bienvenidos al Dashboard</h1>
            <p class="text-gray-600">Gestiona tus notas y credenciales de manera eficiente y segura.</p>
        </div>
    </form>
</body>
</html>
