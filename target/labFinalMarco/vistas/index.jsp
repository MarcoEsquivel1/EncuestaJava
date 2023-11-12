<%

HttpSession sesion=request.getSession();


%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='es'>
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<!-- menus (ini) -->


<jsp:include page="menu/menu.jsp"></jsp:include>


<!-- menus (fin) -->

<!-- Header with image -->
<header class="bgimg w3-display-container w3-grayscale-min" id="home">
    <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
        <span class="w3-tag">Encuestas </span>
    </div>
    <div class="w3-display-middle w3-center">
        <span class="w3-text-black" style="font-size:90px;color:black;">Encuestas<br></span>
    </div>
</header>

<!-- Add a background color and large text to the whole page -->
<div class="w3-sand w3-grayscale w3-large">

    <!-- About Container -->
    <div class="w3-container" id="about">
        <div class="w3-content" style="max-width:700px">
            <h5 class="w3-center w3-padding-64"><span class="w3-tag w3-wide">Bienvenido/a <%=sesion.getAttribute("nombre") %></span></h5>
            <p>

            </p>
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

</body>
</html>