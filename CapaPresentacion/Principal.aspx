<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="CapaPresentacion.Principal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Dashboard</title>
</head>
<body class="bg-gradient-to-r from-blue-100 to-purple-100">
    <form id="form1" runat="server">

        <!-- Navbar -->
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

        <!-- Main Content -->
        <div class="max-w-7xl mx-auto p-8 mt-20">
            <h1 class="text-4xl font-bold text-gray-800 mb-6 text-center">Bienvenidos al Dashboard</h1>
            <p class="text-lg text-gray-600 mb-8 text-center">Gestiona tus notas y credenciales de manera eficiente y segura.</p>

            <!-- Cards -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <!-- Card 1: Notas -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                    <div class="p-6">
                        <h2 class="text-2xl font-semibold text-gray-800 mb-2">Administrar Notas</h2>
                        <p class="text-gray-600 mb-4">Accede a la gestión de tus notas de forma rápida y eficiente.</p>
                        <a href="Notas.aspx" class="inline-block bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition duration-300">Ir a Notas</a>
                    </div>
                </div>

                <!-- Card 2: Credenciales -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                    <div class="p-6">
                        <h2 class="text-2xl font-semibold text-gray-800 mb-2">Administrar Credenciales</h2>
                        <p class="text-gray-600 mb-4">Gestiona las credenciales de acceso de forma segura.</p>
                        <a href="Credenciales.aspx" class="inline-block bg-purple-600 text-white px-4 py-2 rounded-md hover:bg-purple-700 transition duration-300">Ir a Credenciales</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
