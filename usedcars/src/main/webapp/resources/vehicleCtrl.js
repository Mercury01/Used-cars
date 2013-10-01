function vehicleCtrl($scope, $http) {

	$scope.vehicleDetails = function() {
		$http({
			url : "vehicleDetails/"+"asd", //TODO
			method : "GET",
		}).success(function(data, status, headers, config) {
			$scope.result = data.licensePlate;
		}).error(function(data, status, headers, config) {
			$scope.result = "Error";
		});
	};
	
	$scope.searchBtnClk = function() {
		
//		var form = [{
//		           type :  $scope.type.name,
//		           brand : $scope.brand,
//		           model :  $scope.model,
//		           fueltype : $scope.fueltype.name,
//		           price : price
//		}];
		
		var form = [
			           $scope.type.name,
			           $scope.brand,
			           $scope.model,
			           $scope.fueltype.name,
			           price
			];

		
		
		$http({
			url : "search",
			method : "POST",
			data : form//,//"hugyoshugy" + $scope.result + $scope.error,
		}).success(function(data) {
			alert(data);	//TODO - JSON
		}).error(function(data) {
			$scope.result = "Error";
		});
	};	
	
	$scope.types = [ {name: "Barmelyik"}, 
	                 {name: "Sport"}, 
	                 {name: "Pickup"}, 
	                 {name: "Terepjaro"},
	                 {name: "Cabrio"}, 
	                 {name: "Coupe"}, 
	                 {name: "Kisbusz"}, 
	                 {name: "Kombi"}, 
	                 {name: "Sedan"}
	                ];
	$scope.type = $scope.types[1];
	
	$scope.fueltypes = [ {name: "Etanol"},
	                     {name: "Benzin"}, 
	                     {name: "Benzin/gaz"}, 
	                     {name: "Biodizel"}, 
		                 {name: "Dizel"},
		                 {name: "Elektromos"}, 
		                 {name: "Hibrid"}, 
	                ];
	$scope.fueltype = $scope.fueltypes[1];

	$scope.vehicles = [ {
		text : 'learn angular',
		done : true
	}, {
		text : 'build an angular app',
		done : false
	} ];

	$scope.addTodo = function() {
		$scope.todos.push({
			text : $scope.todoText,
			done : false
		});
		$scope.todoText = '';
	};

	$scope.remaining = function() {
		var count = 0;
		angular.forEach($scope.todos, function(todo) {
			count += todo.done ? 0 : 1;
		});
		return count;
	};

	$scope.archive = function() {
		var oldTodos = $scope.todos;
		$scope.todos = [];
		angular.forEach(oldTodos, function(todo) {
			if (!todo.done)
				$scope.todos.push(todo);
		});
	};
}