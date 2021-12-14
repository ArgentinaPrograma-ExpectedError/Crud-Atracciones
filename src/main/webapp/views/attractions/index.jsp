<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script defer
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=MedievalSharp&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/stylesheets/panel.css">

<title>Panel de Administrador</title>
</head>
<body>
	<header class="container">

		<h1 id=brand>
			<a href="index.html">PARQUE TIERRA MEDIA</a>
		</h1>
		<h2>Panel del Admistrador</h2>
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light navegador">
				<div class="container-fluid">
					<a class="navbar-brand" href="#"></a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
						aria-controls="navbarNavDropdown" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Lista
									de atracciones</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Tipos
									de promoción</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Lista
									de promociones</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Lista de
									Usuarios </a>
								<ul class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<li><a class="dropdown-item" href="#">Lista de
											usuarios</a></li>
									<li><a class="dropdown-item" href="#">Crear nuevo
											usuario</a></li>
									<!-- <li><a class="dropdown-item" href="#">Something else here</a></li> -->
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<main class="container">
		<br> <br>
		<h3>Lista de atracciones</h3>
		<br>
		<table class="container">
			<thead>
				<tr>
					<th>ID</th>
					<th>Atracción</th>
					<th>Costo</th>
					<th>Tiempo</th>
					<th>Cupo Diario</th>
					<th>Tipo de Atracción</th>

					<th colspan="4">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${attractions}" var="attraction">
					<tr>
						<td><c:out value="${attraction.id}"></c:out></td>
						<td><c:out value="${attraction.name}"></c:out></td>
						<td><c:out value="${attraction.cost}"></c:out></td>
						<td><c:out value="${attraction.duration}"></c:out></td>
						<td><c:out value="${attraction.capacity}"></c:out></td>
						<td><c:out value="${attraction.attractionType}"></c:out></td>

						<td><a
							href="/turismo/attractions/edit.do?id=${attraction.id}"
							class="btn btn-light rounded-0" role="button"><i
								class="bi bi-pencil-fill"></i></a> <a
							href="/turismo/attractions/delete.do?id=${attraction.id}"
							class="btn btn-danger rounded" role="button"><i
								class="bi bi-x-circle-fill"></i></a> <c:choose>
								<c:when test="${attraction.enable}">
									<a href="/turismo/attractions/enable.do?id=${attraction.id}"
										class="btn btn-success rounded" role="button">Deshabilitar</a>
								</c:when>
								<c:otherwise>
									<a href="/turismo/attractions/enable.do?id=${attraction.id}"
										class="btn btn-success rounded" role="button">Habilitar</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="mb-3">
			<a href="/turismo/attractions/create.do" class="btn btn-primary"
				role="button"> <i class="bi bi-plus-lg"></i> Nueva Atracción
			</a>
		</div>

		<br> <br> <br>
		<h3>Lista de Promociones</h3>
		<br>
		<table class="container">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Atracciones</th>
					<th>Promoción</th>
					<th>Tipo</th>
					<th>Descuento</th>
					<th>Precio</th>
					<th>Tiempo</th>
					<th colspan="4">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${promotions}" var="promotion">
					<tr>
						<td><c:out value="${promotion.id}"></c:out></td>
						<td><c:out value="${promotion.name}"></c:out></td>
						<td><c:out value="${promotion.atracciones}"></c:out></td>
						<td><c:out value="${promotion.promotionType}"></c:out></td>
						<td><c:out value="${promotion.attractionType}"></c:out></td>
						<td><c:out value="${promotion.discount}"></c:out></td>
						<td><c:out value="${promotion.cost}"></c:out></td>
						<td><c:out value="${promotion.time}"></c:out></td>

						<td><a
							href="/turismo/promotions/edit.do?id=${promotion.id}"
							class="btn btn-light rounded-0" role="button"><i
								class="bi bi-pencil-fill"></i></a> <a
							href="/turismo/promotions/delete.do?id=${promotion.id}"
							class="btn btn-danger rounded" role="button"><i
								class="bi bi-x-circle-fill"></i></a> <c:choose>
								<c:when test="${promotion.enable}">
									<a href="/turismo/promotions/enable.do?id=${promotion.id}"
										class="btn btn-success rounded" role="button">Deshabilitar</a>
								</c:when>
								<c:otherwise>
									<a href="/turismo/promotions/enable.do?id=${promotion.id}"
										class="btn btn-success rounded" role="button">Habilitar</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="mb-3">
			<a href="/turismo/attractions/create.do" class="btn btn-primary"
				role="button"> <i class="bi bi-plus-lg"></i> Nueva Atracción
			</a>
		</div>


		<br> <br> <br>

		<h3>Listado de usuarios</h3>
		<br>
		<table class=" container">

			<tr>
				<th>id</th>
				<th>nombre</th>
				<th>apellido</th>
				<th>tipo_preferido</th>
				<th>dinero_disponible</th>
				<th>tiempo_disponible</th>
			</tr>
			<tr>
				<td>1</td>
				<td>Steve</td>
				<td>Jobs</td>
				<td>1</td>
				<td>10</td>
				<td>8</td>
			</tr>
			<tr>
				<td>?</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>?</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>?</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>?</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>?</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>?</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>?</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>?</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>?</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="9">
					<button>Crear nuevo usurario</button> falta el enlace
				</td>
			</tr>

		</table>


	</main>
	<br>
	<br>
	<br>
	<footer>By @ExpectedError </footer>
</body>
</html>