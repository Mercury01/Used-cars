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
		$http({
			url : "search",
			method : "POST",
		}).success(function(data) {
			alert(data);	//TODO - JSON
		}).error(function(data) {
			$scope.result = "Error";
		});
	};

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