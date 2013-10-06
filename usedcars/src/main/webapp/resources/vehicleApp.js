var vehicleApp = angular.module('vehicle', []);

vehicleApp.config(function($routeProvider) {
	$routeProvider.
		when("/", 
				{templateUrl : "partials/search.jsp"}
		).otherwise(
				{redirectTo : "/"}
		);
});
	
vehicleApp.controller('vehicleCtrl', function vehicleCtrl($scope, $http, $location) {

	$scope.searchBtnClk = function() {
		var form = {
			           type : 		$scope.type.name,
			           brand : 		$scope.brand,
			           model : 		$scope.model,
			           color : 		$scope.color.name,
			           fuel : 		$scope.fueltype.name,
			           price_min :	$scope.price_min,
			           price_max :	$scope.price_max,
			           year_min :	$scope.year_min,
			           year_max :	$scope.year_max,
			           doors : 		$scope.door.name
		};
		
		$http({
			url : "search",
			method : "POST",
			data : JSON.stringify(form)
		}).success(function(data) {
			$location.path("/");
			//alert(data);	//TODO - JSON
		}).error(function(data) {
			$scope.result = "Error";
		});
	};
	
	
	//--------------PRICE-----------------
	
	$scope.prices = [0, 15000000];
	$scope.price_min = $scope.prices[0];
	$scope.price_max = $scope.prices[1];

	//--------------YEAR------------------
	
	$scope.years = [0, 25];
	$scope.year_min = $scope.years[0];
	$scope.year_max = $scope.years[1];
	
	//--------------TYPES-----------------
	
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
	$scope.type = $scope.types[0];
	
	//--------------FUEL-------------------
	
	$scope.fueltypes = [ {name: "Etanol"},
	                     {name: "Benzin"}, 
	                     {name: "Benzin/gaz"}, 
	                     {name: "Biodizel"}, 
		                 {name: "Dizel"},
		                 {name: "Elektromos"}, 
		                 {name: "Hibrid"}
	                ];
	$scope.fueltype = $scope.fueltypes[1];
	
	//--------------DOORS-------------------
	
	$scope.doors = [ {name: "2"},
	                 {name: "3"}, 
	                 {name: "4"}, 
	                 {name: "5"} 
	                ];
	$scope.door = $scope.doors[2];
	
	//--------------COLORS-------------------
	
	$scope.colors = [{name: "Piros"},
	                 {name: "Kek"}, 
	                 {name: "Zold"}, 
	                 {name: "Sarga"},
	                 {name: "Feher"},
	                 {name: "Fekete"},
	                 {name: "Lila"}
	                ];
	$scope.color = $scope.colors[0];
});
