<!doctype html>
<html xmlns:ng="http://angularjs.org" data-ng-app="vehicle">
<head>
    <link rel="stylesheet" href="resources/todo.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
</head>
<body data-ng-controller="vehicleCtrl">
	<h2>Használt autó kereskedelem</h2>
	
	<ng-view></ng-view>
	
<!-- 	<p><span>{{day_range[0]}}</span> - <span>{{day_range[day_range.length-1]}}</span></p> -->
<!-- 	<div slider:days days="days"></div> -->
	
<!-- 	<input type="button" value="Get asd" data-ng-click="vehicleDetails()"> {{result}} -->
	
</body>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="resources/json2.min.js"></script>
<script type="text/javascript" src="resources/vehicleApp.js"></script>
<script type="text/javascript" src="resources/vehicleDirectives.js"></script>

</html>