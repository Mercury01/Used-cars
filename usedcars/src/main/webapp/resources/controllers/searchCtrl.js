searchCtrl = function($scope, $http, $rootScope) {

//	$scope.search = function() {
//	search = function() {
	$scope.searchBtnClk = function() {
//function search($scope) {
	
		console.log("Searching.. "); //TODO
		console.log($scope.isTopList); //TODO
		
		var searchForm = {
			type : $scope.searchType.name,
			brand : $scope.brand,
			model : $scope.model,
			color : $scope.searchColor.name,
			fuel : $scope.searchFueltype.name,
			price_min : $scope.price_min,
			price_max : $scope.price_max,
			year_min : $scope.year_min,
			year_max : $scope.year_max,
			doors : $scope.searchDoor.name
		};
		console.log(searchForm);
		console.log("type: " + $scope.searchType.name);
		console.log($scope);

		$http({
			url : "search",
			method : "POST",
			data : JSON.stringify(searchForm)
		}).success(function(data) {
//			$rootScope.$emit('SearchComplete');
//			return "fasz";
			$scope.isTopList.value = false;
			console.log(data);
			$rootScope.searchResultList = data;
		}).error(function(data) {
//			return -1;
//			$scope.result = "Error";
		});

//		console.log("before search: " + $scope.isTopList.value);
//		$scope.isTopList.value = false;
//		console.log("after search: " + $scope.isTopList.value);
//		$rootScope.$apply();
//		return false;
//		console.log($scope.isTopList); //TODO
	};
	
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
	
	//--------------DOORS-------------------
	
	$scope.searchDoors = [ {name: "Bármelyik"},
	                 {name: "2"},
	                 {name: "3"}, 
	                 {name: "4"}, 
	                 {name: "5"} 
	                ];
	$scope.searchDoor = $scope.searchDoors[0];
	
	//--------------COLORS-------------------
	
	$scope.searchColors = [ {name: "Bármelyik"},
	                  {name: "Piros"},
	                  {name: "Kék"}, 
	                  {name: "Zöld"}, 
	                  {name: "Sárga"},
	                  {name: "Fehér"},
	                  {name: "Fekete"},
	                  {name: "Szürke"},
	                  {name: "Lila"}
	                ];
	$scope.searchColor = $scope.searchColors[0];
	
	//--------------TRANS--------------------
	
	$scope.searchTransmissions = [ {name: "Bármelyik"},
	                         {name: "Automata"},
	                         {name: "Manuális"}
	                         ];
	$scope.searchTransmission = $scope.searchTransmissions[0];
};