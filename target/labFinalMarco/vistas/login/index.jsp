<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body class="img-fluid" style="background-image: url('https://miro.medium.com/1*qmqJtEds_YkFosh1pAAZ2w.png'); background-size: cover; background-repeat: no-repeat; background-attachment: fixed;">
  <div class="d-flex" style="height: 100vh;">
    <div class="container mx-auto my-auto p-5" style="background-color: white; opacity: 0.97">
      <div class="px-5">
        <!-- image logo -->
        <div class="row">
          <div class="col-12 pb-3" >
            <h2 class="display-5 text-center my-3">Login</h2>
          </div>
          <form action="../../../sesion" method="POST">
            <div class="form-floating my-4">
              <input type="text" class="form-control" style="background-color: #76c7e5; color: white"  name="username" id="username" placeholder="#" required>
              <label for="username" style="color: white; font-style: italic;">Nombre de usuario</label>
            </div>
            <div class="form-floating  my-4">
              <input type="password" class="form-control" style="background-color: #76c7e5; color: white" name="password" id="password" placeholder="#" required>
                <label for="password" style="color: white; font-style: italic;">Contraseña</label>
            </div>
            <c:if test="${param.foo != null}">
                <p style="color: red">${param.foo}</p>
            </c:if>
            <div class="d-flex justify-content-center">
              <a href="/registro" class="text-decoration-none" style="color: #76c7e5">¿No tienes cuenta? Registrate</a>
            </div>
            <input type="submit" class="btn" style="background: #76c7e5; color: #fff" value="Iniciar Sesión" name="submit">
          </form>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</body>
</html>