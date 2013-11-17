var vehicleApp = angular.module('vehicle', []);

//vehicleApp.config(function($routeProvider) {
//	$routeProvider.
//		when("/", 
//			{templateUrl : "partials/search.jsp"}	
//		).otherwise(
//				{redirectTo : "/"}
//		);
//});
	
vehicleApp.controller('vehicleCtrl', function vehicleCtrl($scope, $http, $location) {

	$scope.isSearch = true;
	$scope.isTopList = true;
	
//	function EventController($scope) {
//		  $scope.$on('SearchComplete', function() {
//			  console.log("Received event");
//			  $scope.isTopList = false;
//			  
//		  });
//		}
	
	$scope.searchBtnClk = function() {
//		$scope.searchResultList = search();
//		var searchResult = $scope.search;
//		console.log($scope.search);
//		$scope.search
//		alert(searchResult);
//		$scope.searchResultList = searchResult;
//		$scope.isTopList = false;
	};
	
//	$scope.searchBtnClk = function() {
//		var searchForm = {
//			           type : 		$scope.searchType.name,
//			           brand : 		$scope.brand,
//			           model : 		$scope.model,
//			           color : 		$scope.searchColor.name,
//			           fuel : 		$scope.searchFueltype.name,
//			           price_min :	$scope.price_min,
//			           price_max :	$scope.price_max,
//			           year_min :	$scope.year_min,
//			           year_max :	$scope.year_max,
//			           doors : 		$scope.searchDoor.name
//		};
//		console.log(searchForm);
//		
//		$http({
//			url : "search",
//			method : "POST",
//			data : JSON.stringify(searchForm)
//		}).success(function(data) {
//			$scope.searchResultList = data;
//			//$location.path("/");
//		}).error(function(data) {
//			$scope.result = "Error";
//		});
//		
//		$scope.isTopList = false;
//	};
		
	$scope.init = function() {
		$http({
			url : "top/10",
			method : "GET"
		}).success(function(data) {
			$scope.topList = data;
		}).error(function(data) {
			$scope.result = "Error";
		});
	};
	
	$scope.searchFuncBtnClk = function() {
		$scope.isSearch = true;
	};
	
	$scope.addFuncBtnClk = function() {
		$scope.isSearch = false;
	};
	
	$scope.backToTopFuncBtnClk = function() {
		$scope.isTopList = true;
	};
	
//	$scope.searchResultFuncBtnClk = function() {
//		$scope.isTopList = true;
//	};
//	
//	$scope.topFuncBtnClk = function() {
//		$scope.isTopList = false;
//	};
	
	
	
	//--------------PRICE-----------------
	
	$scope.prices = [0, 150000000];
	$scope.price_min = $scope.prices[0];
	$scope.price_max = $scope.prices[1];

	//--------------YEAR------------------
	
	$scope.years = [1960, 2013];
	$scope.year_min = $scope.years[0];
	$scope.year_max = $scope.years[1];
	
	//--------------TYPES-----------------
	
	$scope.searchTypes = [ {name: "Bármelyik"}, 
	                 {name: "Sport"}, 
	                 {name: "Pickup"}, 
	                 {name: "Terepjáró"},
	                 {name: "Cabrio"}, 
	                 {name: "Coupé"}, 
	                 {name: "Kisbusz"}, 
	                 {name: "Kombi"}, 
	                 {name: "Sedan"}
	                ];
	$scope.searchType = $scope.searchTypes[0];
	

	$scope.addTypes = [ {name: "Sport"}, 
	                 {name: "Pickup"}, 
	                 {name: "Terepjáró"},
	                 {name: "Cabrio"}, 
	                 {name: "Coupé"}, 
	                 {name: "Kisbusz"}, 
	                 {name: "Kombi"}, 
	                 {name: "Sedan"}
	                ];
	$scope.addType = $scope.addTypes[0];
	
	//--------------FUEL-------------------
	$scope.searchFueltypes = [ {name : "Bármelyik"},
	 	                 {name: "Etanol"},
	                     {name: "Benzin"}, 
	                     {name: "Benzin/gáz"}, 
	                     {name: "Biodízel"}, 
		                 {name: "Dízel"},
		                 {name: "Elektromos"}, 
		                 {name: "Hibrid"}
	                ];
	$scope.searchFueltype = $scope.searchFueltypes[0];
	
	$scope.addFueltypes = [ {name: "Etanol"},
	                     {name: "Benzin"}, 
	                     {name: "Benzin/gáz"}, 
	                     {name: "Biodízel"}, 
		                 {name: "Dízel"},
		                 {name: "Elektromos"}, 
		                 {name: "Hibrid"}
	                ];
	$scope.addFueltype = $scope.addFueltypes[0];
	
	//--------------DOORS-------------------
	
	$scope.searchDoors = [ {name: "Bármelyik"},
	                 {name: "2"},
	                 {name: "3"}, 
	                 {name: "4"}, 
	                 {name: "5"} 
	                ];
	$scope.searchDoor = $scope.searchDoors[0];
	
	$scope.addDoors = [ {name: "2"},
	                 {name: "3"}, 
	                 {name: "4"}, 
	                 {name: "5"} 
	                ];
	$scope.addDoor = $scope.addDoors[0];
	
	//--------------COLORS-------------------
	
	$scope.searchColors = [ {name: "Bármelyik"},
	                  {name: "Piros"},
	                  {name: "Kék"}, 
	                  {name: "Zöld"}, 
	                  {name: "Sárga"},
	                  {name: "Fehér"},
	                  {name: "Fekete"},
	                  {name: "Lila"}
	                ];
	$scope.searchColor = $scope.searchColors[0];
	
	$scope.addColors = [ {name: "Piros"},
		                  {name: "Kék"}, 
		                  {name: "Zöld"}, 
		                  {name: "Sárga"},
		                  {name: "Fehér"},
		                  {name: "Fekete"},
		                  {name: "Lila"}
	                ];
	$scope.addColor = $scope.addColors[0];
	//--------------TRANS--------------------
	
	$scope.searchTransmissions = [ {name: "Bármelyik"},
	                         {name: "Automata"},
	                         {name: "Manuális"}
	                         ];
	$scope.searchTransmission = $scope.searchTransmissions[0];
	
	$scope.addTransmissions = [ {name: "Automata"},
	                         {name: "Manuális"}
	                         ];
	$scope.addTransmission = $scope.addTransmissions[0];
	

});
