<!doctype html>
<html xmlns:ng="http://angularjs.org" data-ng-app>
<head>
    <link rel="stylesheet" href="resources/todo.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
</head>
<body data-ng-controller="vehicleCtrl">
	<h2>Haszn�lt aut� kereskedelem</h2>
	
	<div id="form-div">
		<h3>Keres�si krit�riumok</h3>
		<form>
			<p>
				<label>T�pus</label><br /> 
				<select data-ng-model="type" data-ng-options="t.name for t in types"></select>
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
				<label>�r</label><br /> 
				<input type="text" id="price-value-text" class="range-values" />
				<div id="price-slider"></div>
			</p>	
			<p>
				<label>�vj�rat</label><br />   
				<input type="text" id="year-value-text" class="range-values" />
				<div id="year-slider"></div>
			</p>
			<p>
				<label>Ajt�k sz�ma</label><br /> <select data-ng-model="doors"></select>
			</p>
			<p>Tov�bbi menupontok: </p>
			<p><input type="button" data-ng-click="searchBtnClk()" value="Keres�s"></p>
		</form>
	</div>
	
	
	<input type="button" value="Get asd" data-ng-click="vehicleDetails()"> {{result}}

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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="resources/vehicleCtrl.js"></script>

<script>
  $(function() {
    $( "#year-slider" ).slider({
      range: true,
      min: 1950,
      max: 2013,																	
      values: [ 2000, 2010 ],
      slide: function( event, ui ) {
        $( "#year-value-text" ).val(ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });
    $( "#year-value-text" ).val($( "#year-slider" ).slider( "values", 0 ) +
      " - " + $( "#year-slider" ).slider( "values", 1 ) );
    
    $( "#price-slider" ).slider({
        range: true,
        min: 0,
        max: 20000000,																	
        values: [ 100000, 2000000 ],
        slide: function( event, ui ) {
        	var lowerEnd = ui.values[ 0 ];
        	var higherEnd = ui.values[ 1 ];        	
          $( "#price-value-text" ).val(lowerEnd + " - " + higherEnd );
        }
      });
      $( "#price-value-text" ).val($( "#price-slider" ).slider( "values", 0 ) +
        " - " + $( "#price-slider" ).slider( "values", 1 ) );
  });
  </script>


</html>