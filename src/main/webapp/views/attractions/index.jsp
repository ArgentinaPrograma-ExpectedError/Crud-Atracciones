<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/partials/nav.jsp"></jsp:include>

	<main class="container">

		<c:if test="${flash != null}">
			<div class="alert alert-danger">
				<p>
					<c:out value="${flash}" />
					<c:if test="${errors != null}">
						<ul>
							<c:forEach items="${errors}" var="entry">
								<li><c:out value="${entry.getValue()}"></c:out></li>
							</c:forEach>
						</ul>
					</c:if>
				</p>
			</div>
		</c:if>

		<div class="bg-light p-4 mb-3 rounded">
			<h1>Listado de atracciones</h1>
		</div>

		<c:if test="${user.isAdmin()}">
			<div class="mb-3">
				<a href="/turismo/attractions/create.do" class="btn btn-primary"
					role="button"> <i class="bi bi-plus-lg"></i> Nueva Atracción
				</a>
			</div>
		</c:if>
		<table class="table table-stripped table-hover">
			<thead>
				<tr>
					<th>Atracción</th>
					<th>Tipo</th>
					<th>Costo</th>
					<th>Duración</th>
					<th>Cupo</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${attractions}" var="attraction">
					<c:if test="${user.isAdmin()}">
						<tr>
							<td><strong><c:out value="${attraction.name}"></c:out></strong>
								<p>
									<c:out value="${attraction.description}"></c:out>
								</p></td>
							<td><c:out value="${attraction.type}"></c:out></td>
							<td><c:out value="${attraction.cost}"></c:out></td>
							<td><c:out value="${attraction.duration}"></c:out></td>
							<td><c:out value="${attraction.capacity}"></c:out></td>

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
					</c:if>
					<c:if
						test="${!user.admin && attraction.eneable && user.canAfford(attraction) && user.canAttend(attraction) && attraction.canHost(1)}">
						<tr>
							<td><strong><c:out value="${attraction.name}"></c:out></strong>
								<p>
									<c:out value="${attraction.description}"></c:out>
								</p></td>
							<td><c:out value="${attraction.type}"></c:out></td>
							<td><c:out value="${attraction.cost}"></c:out></td>
							<td><c:out value="${attraction.duration}"></c:out></td>
							<td><c:out value="${attraction.capacity}"></c:out></td>

							<td><a
								href="/turismo/attractions/buy.do?id=${attraction.id}"
								class="btn btn-success rounded" role="button">Comprar</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

	</main>

</body>
</html>