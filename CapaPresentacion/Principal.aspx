<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="CapaPresentacion.Principal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Dashboard</title>
</head>
<body class="bg-gradient-to-r from-blue-50 to-purple-50 min-h-screen flex flex-col">

    <form id="form1" runat="server" class="flex-grow">

        <nav class="bg-gradient-to-r from-blue-700 to-purple-700 shadow-lg fixed w-full top-0 z-50">
            <div class="max-w-7xl mx-auto px-6 sm:px-8 lg:px-10">
                <div class="flex justify-between h-16 items-center">
                    <a href="Principal.aspx" class="text-white text-2xl font-bold tracking-wide hover:text-gray-200 transition duration-300">
                        Dashboard
                    </a>

                    <div class="flex space-x-4">
                        <a href="Credenciales.aspx" class="text-white px-4 py-2 rounded-md text-sm font-medium hover:bg-blue-800 transition-all duration-300">
                            Credenciales
                        </a>
                        <a href="Notas.aspx" class="text-white px-4 py-2 rounded-md text-sm font-medium hover:bg-purple-800 transition-all duration-300">
                            Notas
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="max-w-7xl mx-auto p-8 mt-24 text-center">
            <h1 class="text-5xl font-extrabold text-gray-800 mb-6">Bienvenido al Dashboard</h1>
            <p class="text-lg text-gray-600 mb-8">Gestiona tus notas y credenciales de forma eficiente y segura.</p>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                
                <div class="bg-white rounded-xl shadow-xl transform hover:scale-105 transition-all duration-300 overflow-hidden">
                    <div class="w-full h-52 flex items-center justify-center bg-gray-100">
                        <img src="https://static.vecteezy.com/system/resources/previews/013/516/128/non_2x/sheet-of-notepad-for-notes-space-for-text-piece-of-paper-vector.jpg" class="h-full w-full object-cover" alt="Notas"/>
                    </div>
                    <div class="p-6">
                        <h2 class="text-3xl font-bold text-gray-800 mb-2">Administrar Notas</h2>
                        <p class="text-gray-600 mb-4">Accede y gestiona tus notas de forma rápida y eficiente.</p>
                        <a href="Notas.aspx" class="inline-block bg-blue-600 text-white px-5 py-3 rounded-md hover:bg-blue-700 transition-all duration-300">
                            Ir a Notas
                        </a>
                    </div>
                </div>

                <div class="bg-white rounded-xl shadow-xl transform hover:scale-105 transition-all duration-300 overflow-hidden">
                    <div class="w-full h-52 flex items-center justify-center bg-gray-100">
                        <img src="https://th.bing.com/th/id/OIP.n7P4ew7oS_q0Evc5AKJKYQHaHa?rs=1&pid=ImgDetMain" class="h-full w-full object-cover" alt="Credenciales"/>
                    </div>
                    <div class="p-6">
                        <h2 class="text-3xl font-bold text-gray-800 mb-2">Administrar Credenciales</h2>
                        <p class="text-gray-600 mb-4">Gestiona tus credenciales de acceso con seguridad.</p>
                        <a href="Credenciales.aspx" class="inline-block bg-purple-600 text-white px-5 py-3 rounded-md hover:bg-purple-700 transition-all duration-300">
                            Ir a Credenciales
                        </a>
                    </div>
                </div>

            </div>
        </div>
        
    </form>
</body>
</html>
