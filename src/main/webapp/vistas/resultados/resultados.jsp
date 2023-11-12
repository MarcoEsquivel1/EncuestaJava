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
        <span class="w3-tag">Resultados de encuesta</span>
    </div>
    <div class="w3-display-middle w3-center">
        <span class="w3-text-black" style="font-size:90px;color:black;">Resultados<br></span>
    </div>
</header>

<!-- Add a background color and large text to the whole page -->
<div class="w3-large">

    <!-- About Container -->
    <div class="w3-container" id="about">
        <div class="container py-5">
            <div class="my-5">
                <h4 class="fw-bold">¿Sexo del encuestado?</h4>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Opción</th>
                            <th scope="col">Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${resultados.getRes_sexo()}" var="respuesta">
                            <tr>
                                <td>${respuesta.getOpcion()}</td>
                                <td>${respuesta.getCantidad()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="my-5">
                <h4 class="fw-bold">¿Deporte favorito del encuestado?</h4>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Opción</th>
                            <th scope="col">Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${resultados.getRes_dep()}" var="respuesta">
                            <tr>
                                <td>${respuesta.getOpcion()}</td>
                                <td>${respuesta.getCantidad()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="my-5">
                <h4 class="fw-bold">¿Nivel de estudio del encuestado?</h4>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Opción</th>
                            <th scope="col">Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${resultados.getRes_estudio()}" var="respuesta">
                            <tr>
                                <td>${respuesta.getOpcion()}</td>
                                <td>${respuesta.getCantidad()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="my-5">
                <h4 class="fw-bold">¿Tema favorito del encuestado?</h4>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Opción</th>
                            <th scope="col">Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${resultados.getRes_tema()}" var="respuesta">
                            <tr>
                                <td>${respuesta.getOpcion()}</td>
                                <td>${respuesta.getCantidad()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->


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