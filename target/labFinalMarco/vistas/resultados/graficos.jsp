<%@ page import="utils.MREJ_utils" %>
<%@ page import="modelos.MREJ_cls_resultados" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
HttpSession sesion=request.getSession();
MREJ_cls_resultados resultados=(MREJ_cls_resultados)sesion.getAttribute("resultados");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='es'>
<head>
    <title>Home</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        //labels
        const labelsSex = [
            <%for(int i=0;i<resultados.getRes_sexo().size();i++){%>
                '<%=resultados.getRes_sexo().get(i).getOpcion()%>',
            <%}%>
        ];

        const labelsDep = [
            <%for(int i=0;i<resultados.getRes_dep().size();i++){%>
                '<%=resultados.getRes_dep().get(i).getOpcion()%>',
            <%}%>
        ];

        const labelsEstudio = [
            <%for(int i=0;i<resultados.getRes_estudio().size();i++){%>
                '<%=resultados.getRes_estudio().get(i).getOpcion()%>',
            <%}%>
        ];

        const labelsTema = [
            <%for(int i=0;i<resultados.getRes_tema().size();i++){%>
                '<%=resultados.getRes_tema().get(i).getOpcion()%>',
            <%}%>
        ];

        //data
        const dataSex = {
            labels: labelsSex,
            datasets: [{
                label: 'Sexo',
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                ],
                data: [
                    <%for (int i = 0; i < resultados.getRes_sexo().size(); i++) {%>
                        <%=resultados.getRes_sexo().get(i).getCantidad()%>,
                    <%}%>
                ],
            }]
        };

        const dataDep = {
            labels: labelsDep,
            datasets: [{
                label: 'Departamento',
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(153, 102, 255)',
                    'rgb(255, 159, 64)',
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(153, 102, 255)',
                    'rgb(255, 159, 64)',
                ],
                data: [
                    <%for (int i = 0; i < resultados.getRes_dep().size(); i++) {%>
                        <%=resultados.getRes_dep().get(i).getCantidad()%>,
                    <%}%>
                ],
            }]
        };

        const dataEstudio = {
            labels: labelsEstudio,
            datasets: [{
                label: 'Estudio',
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                ],
                data: [
                    <%for (int i = 0; i < resultados.getRes_estudio().size(); i++) {%>
                        <%=resultados.getRes_estudio().get(i).getCantidad()%>,
                    <%}%>
                ],
            }]
        };

        const dataTema = {
            labels: labelsTema,
            datasets: [{
                label: 'Tema',
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(153, 102, 255)',
                    'rgb(255, 159, 64)',
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(153, 102, 255)',
                    'rgb(255, 159, 64)',
                ],
                data: [
                    <%for (int i = 0; i < resultados.getRes_tema().size(); i++) {%>
                        <%=resultados.getRes_tema().get(i).getCantidad()%>,
                    <%}%>
                ],
            }]
        };

        //config
            const configSex = {
            type: 'pie',
            data: dataSex,
            options: {}
        };

        const configDep = {
            type: 'pie',
            data: dataDep,
            options: {}
        };

        const configEstudio = {
            type: 'pie',
            data: dataEstudio,
            options: {}
        };

        const configTema = {
            type: 'pie',
            data: dataTema,
            options: {}
        };
    </script>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<!-- menus (ini) -->


<jsp:include page="../menu/menu.jsp"></jsp:include>


<!-- menus (fin) -->

<!-- Header with image -->
<header class="bgimg w3-display-container w3-grayscale-min" id="home">
    <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
        <span class="w3-tag">Graficos de la encuesta</span>
    </div>
    <div class="w3-display-middle w3-center">
        <span class="w3-text-black" style="font-size:90px;color:black;">Graficos<br></span>
    </div>
</header>

<!-- Add a background color and large text to the whole page -->
<div class="w3-large">

    <!-- About Container -->
    <div class="w3-container" id="about">
        <div class="container py-5">
            <div class="row my-4">
                <div class="col-6">
                    <h2 class="text-center">Sexo del encuestado</h2>
                    <div id="canvas-holder" style="width:70%; margin: 0 auto;">
                        <canvas id="sexChart"></canvas>
                    </div>
                </div>
                <div class="col-6">
                    <h2 class="text-center">Deporte Fav.</h2>
                    <div id="canvas-holder" style="width:70%; margin: 0 auto;">
                  		<canvas id="depChart"></canvas>
                  	</div>
                </div>
            </div>
            <div class="row my-4">
                <div class="col-6">
                    <h2 class="text-center">Niv. Estudio</h2>
                    <div id="canvas-holder" style="width:70%; margin: 0 auto;">
                  		<canvas id="estudioChart"></canvas>
                  	</div>
                </div>
                <div class="col-6">
                    <h2 class="text-center">Tema Fav.</h2>
                    <div id="canvas-holder" style="width:70%; margin: 0 auto;">
                  		<canvas id="temaChart"></canvas>
                  	</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<script>
    //create charts
    const myChart = new Chart(
        document.getElementById('sexChart'),
        configSex
    );

    const myChart2 = new Chart(
        document.getElementById('depChart'),
        configDep
    );

    const myChart3 = new Chart(
        document.getElementById('estudioChart'),
        configEstudio
    );

    const myChart4 = new Chart(
        document.getElementById('temaChart'),
        configTema
    );
</script>

<script>
// Tabbed Menu
function openMenu(evt, menuName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("menu");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-dark-grey", "");
  }
  document.getElementById(menuName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-dark-grey";
}
document.getElementById("myLink").click();
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</body>
</html>