<%
    HttpSession sesion=request.getSession();
%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
<style>
body, html {
  height: 100%;
  font-family: "Inconsolata", sans-serif;
}

.bgimg {
  background-position: center;
  background-size: cover;
  background-image: url("https://www.tescom-ups.com/ftp_files/img_files/survey_banner.jpg");
  min-height: 30%;
}

.menu {
  display: none;
}
</style>
<div class="w3-top">
    <div class="w3-row w3-padding w3-black">
        <div class="w3-col s3">
            <a href="http://localhost:8080/sesion" class="w3-button w3-block w3-black">INICIO</a>
        </div>
        <div class="w3-col s3">
            <a href="http://localhost:8080/cuenta" class="w3-button w3-block w3-black">Mi cuenta</a>
        </div>
        <div class="w3-col s3">
            <div class="w3-dropdown-hover w3-block w3-black">
                <button class="w3-button w3-block w3-black" title="Acciones">ACCIONES<i class="fa fa-caret-down"></i></button>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block w-100">
                    <%
                    if((int)sesion.getAttribute("id_rol")==2){
                    %>
                        <%
                        if((byte)sesion.getAttribute("encuestado")==0){
                        %>
                        <a href="http://localhost:8080/encuesta" class="w3-bar-item w3-button w3-block w-100">Hacer encuesta</a>
                        <%
                        }else if((byte)sesion.getAttribute("encuestado")==1){
                        %>
                        <a href="http://localhost:8080/encuesta" class="w3-bar-item w3-button w3-block w-100">Ver mi encuesta</a>
                        <%
                        }
                        %>
                    <%
                    }else if((int)sesion.getAttribute("id_rol")==1){
                    %>
                        <a href="/resultados" class="w3-bar-item w3-button w3-block w-100">Ver resultados</a>
                        <a href="/encuestas" class="w3-bar-item w3-button w3-block w-100">Ver encuestas</a>
                        <a href="/graficos" class="w3-bar-item w3-button w3-block w-100">Ver gr&aacute;ficos</a>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>
        <div class="w3-col s3">
            <a href="../../logout" class="w3-button w3-block w3-black">Cerrar sesi&oacute;n</a>
        </div>


    </div>
</div>

