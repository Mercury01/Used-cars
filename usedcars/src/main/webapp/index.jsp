<!doctype html>
<html xmlns:ng="http://angularjs.org" data-ng-app="vehicle">
<head>
<link rel="stylesheet" media="screen and (min-width: 1600px)" href="resources/large.css"/>
<link rel="stylesheet" media="screen and (min-width: 800px) and (max-width: 1600px)" href="resources/medium.css"/>
<link rel="stylesheet" media="screen and (max-width: 800px)" href="resources/small.css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

</head>
<body data-ng-controller="vehicleCtrl" data-ng-init="init()">

	<div id="container">
		<header>
			<h2>Használt autó kereskedelem</h2>
		</header>

		<div id="box1" class="content" ng-include src="'partials/top.jsp'">
<!-- 			<ng-include src="partials/top.jsp"></ng-include>asd -->
		</div>

		<div id="box2" class="content">
			<ng-view></ng-view>
		</div>

		<footer> Készítette: Szakály Tibor, Válóczy Bálint </footer>

	</div>

</body>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="resources/json2.min.js"></script>
<script type="text/javascript" src="resources/vehicleApp.js"></script>
<script type="text/javascript" src="resources/vehicleDirectives.js"></script>

</html>