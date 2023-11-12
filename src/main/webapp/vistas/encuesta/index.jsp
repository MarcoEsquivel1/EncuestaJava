<%
HttpSession sesion=request.getSession();
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
        <span class="w3-tag">Mi encuesta</span>
    </div>
    <div class="w3-display-middle w3-center">
        <span class="w3-text-black" style="font-size:90px;color:black;">Encuesta<br></span>
    </div>
</header>

<!-- Add a background color and large text to the whole page -->
<div class="w3-large">

    <!-- About Container -->
    <div class="w3-container" id="about">
        <div class="container py-5">
            <form action="../../encuesta" method="POST">
                <input type="hidden" name="id" id="id" <%if(sesion.getAttribute("id")!=null){%> value="<%=sesion.getAttribute("id")%>" <%}%>>
                <div class="form-floating my-4">
                   <input type="text" class="form-control bg-dark text-white" style="font-size: 18"  name="nombre" id="nombre" placeholder="#" disabled <% if(sesion.getAttribute("nombre")!=null){%> value="<%=sesion.getAttribute("nombre")%>" <%}%>>
                   <label for="nombre" style="color: white; font-style: italic; font-size: 18">Nombre completo</label>
                </div>

                <div class="form-control bg-dark text-white my-4" style="font-style: italic; border-radius: 10px; padding: 10px;">
                <label for="sexo" style="color: gray; font-style: italic; font-size: 16; font-weight: bold;">Sexo:</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="sexo" id="genero1" value="1">
                        <label class="form-check-label" for="genero1" style="color: white; font-style: italic; font-size: 18">
                            Masculino
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="sexo" id="genero2" value="0" checked>
                        <label class="form-check-label" for="genero2" style="color: white; font-style: italic; font-size: 18">
                            Femenino
                        </label>
                    </div>
                </div>

                <div class="form-control bg-dark text-white my-4" style="font-style: italic; border-radius: 10px; padding: 10px;">
                <label for="dep_fav" style="color: gray; font-style: italic; font-size: 16; font-weight: bold;">Deporte Favorito:</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="dep_fav" id="dep_fav1" value="1">
                        <label class="form-check-label" for="dep_fav1" style="color: white; font-style: italic; font-size: 18">
                            Futbol
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="dep_fav" id="dep_fav2" value="2">
                        <label class="form-check-label" for="dep_fav2" style="color: white; font-style: italic; font-size: 18">
                            Basketbol
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="dep_fav" id="dep_fav3" value="3">
                        <label class="form-check-label" for="dep_fav3" style="color: white; font-style: italic; font-size: 18">
                            Jockey
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="dep_fav" id="dep_fav4" value="4">
                        <label class="form-check-label" for="dep_fav4" style="color: white; font-style: italic; font-size: 18">
                            Beisbol
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="dep_fav" id="dep_fav5" value="5">
                        <label class="form-check-label" for="dep_fav5" style="color: white; font-style: italic; font-size: 18">
                            Golf
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="dep_fav" id="dep_fav6" value="6" checked>
                        <label class="form-check-label" for="dep_fav6" style="color: white; font-style: italic; font-size: 18">
                            Otro
                        </label>
                    </div>
                </div>

                <div class="form-floating my-4">
                    <select class="form-select bg-dark text-white" style="font-size: 18" name="nivel_estudio" id="nivel_estudio" required>
                        <option value="" style="font-size: 18" selected disabled>Seleccione su nivel de estudio</option>
                        <option value="1" style="font-size: 18">Basico</option>
                        <option value="2" style="font-size: 18">Intermedio</option>
                        <option value="3" style="font-size: 18">Superior</option>
                    </select>
                    <label for="nivel_estudio" style="color: white; font-style: italic; font-size: 18">Nivel de Estudio</label>
                </div>

                <div class="form-control bg-dark text-white my-4" style="font-style: italic; border-radius: 10px; padding: 10px;">
                                <label for="tema_fav" style="color: gray; font-style: italic; font-size: 16; font-weight: bold;">Tema Favorito:</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="tema_fav" id="tema_fav1" value="1">
                                        <label class="form-check-label" for="tema_fav1" style="color: white; font-style: italic; font-size: 18">
                                            Televisión
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="tema_fav" id="tema_fav2" value="2">
                                        <label class="form-check-label" for="tema_fav2" style="color: white; font-style: italic; font-size: 18">
                                            Cocina
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="tema_fav" id="tema_fav3" value="3">
                                        <label class="form-check-label" for="tema_fav3" style="color: white; font-style: italic; font-size: 18">
                                            Tecnología
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="tema_fav" id="tema_fav4" value="4">
                                        <label class="form-check-label" for="tema_fav4" style="color: white; font-style: italic; font-size: 18">
                                            Mísica
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="tema_fav" id="tema_fav5" value="5">
                                        <label class="form-check-label" for="tema_fav5" style="color: white; font-style: italic; font-size: 18">
                                            Deportes
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="tema_fav" id="tema_fav6" value="6" checked>
                                        <label class="form-check-label" for="tema_fav6" style="color: white; font-style: italic; font-size: 18">
                                            Otro
                                        </label>
                                    </div>
                                </div>
                <input type="submit" class="btn btn-dark text-white" style="font-size: 18" value="Enviar" name="submit">
            </form>
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