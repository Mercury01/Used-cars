<!doctype html>
<html xmlns:ng="http://angularjs.org" data-ng-app>
<head>
<!--     <link rel="stylesheet" href="resources/todo.css"> -->
</head>
<body data-ng-controller="vehicleCtrl">
	<h2>Haszn�lt aut� kereskedelem</h2>
	<div>
		<h3>Keres�si krit�riumok</h3>
		<form>
			<p>
				<label>T�pus</label><br /> <select data-ng-model="types"></select>
			</p>
			<p>
				<label>M�rka</label><br /> <input type="text" data-ng-model="brand" />
			</p>
			<p>
				<label>Modell</label><br /> <input type="text" data-ng-model="model" />
			</p>
			<p>
				<label>Sz�n</label><br /> <select data-ng-model="colors"></select>
			</p>
			<p>
				<label>�r</label><br /> range slider helye
			</p>	
			<p>
				<label>�vj�rat</label><br /> range slider helye
			</p>
			<p>
				<label>Ajt�k sz�ma</label><br /> <select data-ng-model="doors"></select>
			</p>
			<p>Tov�bbi menupontok: </p>
			<p><input type="button" data-ng-click="searchBtnClk()" value="Keres�s"></p>
		</form>



	</div>
	<input type="button" value="Get asd" ng-click="vehicleDetails()"> {{result}}

	<!-- ------------------------------------------------ -->

<!-- 	<div> -->
<!-- 		<span>{{remaining()}} of {{todos.length}} remaining</span> [ <a href="" data-ng-click="archive()">archive</a> ] -->
<!-- 		<ul class="unstyled"> -->
<!-- 			<li data-ng-repeat="todo in todos"><input type="checkbox" data-ng-model="todo.done"> <span -->
<!-- 				class="done-{{todo.done}}">{{todo.text}}</span></li> -->
<!-- 		</ul> -->
<!-- 		<form data-ng-submit="addTodo()"> -->
<!-- 			<input type="text" data-ng-model="todoText" size="30" placeholder="add new todo here"> <input -->
<!-- 				class="btn-primary" type="submit" value="add"> -->
<!-- 		</form> -->
<!-- 	</div> -->
</body>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="resources/vehicleCtrl.js"></script>
</html>