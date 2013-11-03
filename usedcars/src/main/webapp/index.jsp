<!doctype html>
<html xmlns:ng="http://angularjs.org" data-ng-app="vehicle">
<head>
<link rel="stylesheet" media="screen and (min-width: 1600px)" href="resources/large.css" />
<link rel="stylesheet" media="screen and (min-width: 800px) and (max-width: 1600px)" href="resources/medium.css" />
<link rel="stylesheet" media="screen and (max-width: 800px)" href="resources/small.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<title>Haszn�ltaut�-kereskedelem</title>
</head>
<body data-ng-controller="vehicleCtrl" data-ng-init="init()">

	<div id="container">
		<header>
			<h2>Haszn�lt aut� kereskedelem</h2>
		</header>

		<div id="box1" class="content">
<!-- 			<ul> -->
<!-- 				<li class="functionList" data-ng-click="searchResultFuncBtnClk()">Legut�bbi</li> -->
<!-- 				<li class="functionList" data-ng-click="topFuncBtnClk()">Felt�lt�s</li> -->
<!-- 			</ul> -->
			<div data-ng-show="isTopList" class="content" data-ng-include src="'partials/top.jsp'"></div>
			<div data-ng-show="!isTopList" class="content" data-ng-include src="'partials/searchResult.jsp'"></div>
		</div>

		<div id="box2" class="content">
			<ul>
				<li class="functionList" data-ng-click="searchFuncBtnClk()">Keres�s</li>
				<li class="functionList" data-ng-click="addFuncBtnClk()">Felt�lt�s</li>
			</ul>
			<div data-ng-show="isSearch" class="content" data-ng-include src="'partials/search.jsp'"></div>
			<div data-ng-show="!isSearch" class="content" data-ng-include src="'partials/add.jsp'"></div>
		</div>
		<footer> K�sz�tette: Szak�ly Tibor, V�l�czy B�lint </footer>

	</div>

</body>


<!-- Some of these libs are available locally under resources/libs/ -->

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="resources/libs/json2.min.js"></script>
<script type="text/javascript" src="http://blueimp.github.com/jQuery-File-Upload/js/jquery.fileupload.js"></script>
<!-- <script type="text/javascript" src="http://blueimp.github.com/jQuery-File-Upload/js/vendor/jquery.ui.widget.js"></script> -->
<script type="text/javascript" src="resources/vehicleUtilities.js"></script>
<script type="text/javascript" src="resources/vehicleApp.js"></script>
<script type="text/javascript" src="resources/vehicleDirectives.js"></script>
<script type="text/javascript" src="resources/controllers/topCtrl.js"></script>
<script type="text/javascript" src="resources/controllers/addCtrl.js"></script>
<script type="text/javascript" src="resources/controllers/loginCtrl.js"></script>

</html>