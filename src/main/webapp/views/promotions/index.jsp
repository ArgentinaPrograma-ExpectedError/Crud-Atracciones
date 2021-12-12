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
			<h1>Listado de promociones</h1>
		</div>

		<c:if test="${user.isAdmin()}">
			<div class="mb-3">
				<a href="/turismo/promotions/create.do" class="btn btn-primary"
					role="button"> <i class="bi bi-plus-lg"></i> Nueva Promoción
				</a>
			</div>
		</c:if>
		<table class="table table-stripped table-hover">
			<thead>
				<tr>
					<th>Promoción</th>
					<th>Atracciones</th>
					<th>Tipo</th>
					<th>Descuento</th>
					<th>Costo</th>
					<th>Duración</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${promotions}" var="promotion">
					<c:if test="${user.isAdmin()}">
						<tr>
							<td><strong><c:out value="${promotion.name}"></c:out></strong>
								<p>
									<c:out value="${promotion.description}"></c:out>
								</p></td>
							<td><c:out value="${promotion.getNameAttractions()}"></c:out></td>
							<td><c:out value="${promotion.attractionType}"></c:out></td>
							<td><c:out value="${promotion.promotionType}"></c:out></td>
							<td><c:out value="${promotion.getCost()}"></c:out></td>
							<td><c:out value="${promotion.getDuration()}"></c:out></td>

							<td><a href="/turismo/promotions/edit.do?id=${promotion.id}"
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
					</c:if>
					<c:if
						test="${!user.admin && promotion.eneable && user.canAfford(promotion) && user.canAttend(promotion) && promotion.canHost(1)}">
						<tr>
							<td><strong><c:out value="${promotion.name}"></c:out></strong>
								<p>
									<c:out value="${promotion.description}"></c:out>
								</p></td>
							<td><c:out value="${promotion.type}"></c:out></td>
							<td><c:out value="${promotion.cost}"></c:out></td>
							<td><c:out value="${promotion.duration}"></c:out></td>

							<td><a href="/turismo/promotions/buy.do?id=${promotion.id}"
								class="btn btn-success rounded" role="button">Comprar</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

	</main>

</body>
</html>