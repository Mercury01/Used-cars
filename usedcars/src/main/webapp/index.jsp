<!doctype html>
<html xmlns:ng="http://angularjs.org" data-ng-app="vehicle">
<head>
	<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css"> -->
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Audiowide&subset=latin,latin-ext' type='text/css'>
<link rel="stylesheet" media="screen and (min-width: 1440px)" href="resources/css/large.css" />
<link rel="stylesheet" media="screen and (min-width: 855px) and (max-width: 1439px)" href="resources/css/medium.css" />
<link rel="stylesheet" media="screen and (max-width: 854px)" href="resources/css/small.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<title>Használtautó-kereskedelem</title>
</head>
<body data-ng-controller="vehicleCtrl" data-ng-init="init()">

	<div id="container">

		<div class="content">
			<header class="sub-box">
				&nbsp;
				<!-- idk lol -->
				<h2>Használt autó kereskedelem</h2>
				&nbsp;
			</header>
			<div id="box1" class="box">
				<!-- 				<ul> -->
				<!-- 					<li class="functionList" data-ng-click="searchResultFuncBtnClk()">Legutóbbi</li> -->
				<!-- 					<li class="functionList" data-ng-click="topFuncBtnClk()">Feltöltés</li> -->
				<!-- 				</ul> -->
				<div data-ng-show="isTopList.value" data-ng-include src="'partials/top.jsp'"></div>
				<div data-ng-show="!(isTopList.value)" data-ng-include src="'partials/searchResult.jsp'"></div>
				
				<div id="error1" class="errorDiv"></div>
			</div>
		</div>

		<div class="content">
			<div id="box2" class="box">
<!-- 				<div data-ng-show="isDetails" data-ng-include src="'partials/details.jsp'"> -->
<!-- 				</div> -->
<!-- 						<div data-ng-show="isSearch" data-ng-include src="'partials/search.jsp'"></div> -->
<!-- 						<div data-ng-show="!isSearch" data-ng-include src="'partials/add.jsp'"></div> -->
						<div ng-switch on="rightContent">
							<div ng-switch-when="search" data-ng-include src="'partials/search.jsp'"></div>
							<div ng-switch-when="add" data-ng-include src="'partials/add.jsp'" id="addDiv"></div>
							<div ng-switch-when="details" data-ng-include src="'partials/details.jsp'"></div>
					</div>
				<ul>
					<li class="functionList" data-ng-click="searchFuncBtnClk()">Keresés</li>
					<li class="functionList" data-ng-click="addFuncBtnClk()">Feltöltés</li>
				</ul>
				
				<div id="error2" class="errorDiv"></div>
				
			</div>
			<footer class="sub-box"> 
			<br />Készítette: Szakály Tibor, Válóczy Bálint
				
<!-- 				<div ng-include src="'partials/loginMini.jsp'"></div> -->
			</footer>
		</div>

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
<script type="text/javascript" src="resources/controllers/searchCtrl.js"></script>
<script type="text/javascript" src="resources/controllers/loginCtrl.js"></script>

</html>