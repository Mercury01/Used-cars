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
	
	$scope.searchTypes = [ {name: "B�rmelyik"}, 
	      	                 {name: "Sport"}, 
	      	                 {name: "Pickup"}, 
	      	                 {name: "Terepj�r�"},
	      	                 {name: "Cabrio"}, 
	      	                 {name: "Coup�"}, 
	      	                 {name: "Kisbusz"}, 
	      	                 {name: "Kombi"}, 
	      	                 {name: "Sedan"}
	      	                ];
	 $scope.searchType = $scope.searchTypes[0];
	 
	//--------------FUEL-------------------
	 
	$scope.searchFueltypes = [ {name : "B�rmelyik"},
	 	                 {name: "Etanol"},
	                     {name: "Benzin"}, 
	                     {name: "Benzin/g�z"}, 
	                     {name: "Biod�zel"}, 
		                 {name: "D�zel"},
		                 {name: "Elektromos"}, 
		                 {name: "Hibrid"}
	                ];
	$scope.searchFueltype = $scope.searchFueltypes[0];
	
	//--------------DOORS-------------------
	
	$scope.searchDoors = [ {name: "B�rmelyik"},
	                 {name: "2"},
	                 {name: "3"}, 
	                 {name: "4"}, 
	                 {name: "5"} 
	                ];
	$scope.searchDoor = $scope.searchDoors[0];
	
	//--------------COLORS-------------------
	
	$scope.searchColors = [ {name: "B�rmelyik"},
	                  {name: "Piros"},
	                  {name: "K�k"}, 
	                  {name: "Z�ld"}, 
	                  {name: "S�rga"},
	                  {name: "Feh�r"},
	                  {name: "Fekete"},
	                  {name: "Sz�rke"},
	                  {name: "Lila"}
	                ];
	$scope.searchColor = $scope.searchColors[0];
	
	//--------------TRANS--------------------
	
	$scope.searchTransmissions = [ {name: "B�rmelyik"},
	                         {name: "Automata"},
	                         {name: "Manu�lis"}
	                         ];
	$scope.searchTransmission = $scope.searchTransmissions[0];
};