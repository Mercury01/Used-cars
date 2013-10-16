vehicleApp.directive('sliderPrices', function() {
	return {
		restrict : 'A',
		link : function(scope, elem, attrs) {
			$(elem).slider({
				range : true,
				min : scope.prices[0],
				max : scope.prices[scope.prices.length - 1],
				values : [ scope.prices[0], scope.prices[scope.prices.length - 1] ],
				slide : function(event, ui) {
					scope.$apply(function() {
						scope.price_min = ui.values[0];
						scope.price_max = ui.values[1];
					});
					console.log(scope.price_min, scope.price_max);
				}
			});
		}
	};
});

vehicleApp.directive('sliderYears', function() {
	return {
		restrict : 'A',
		link : function(scope, elem, attrs) {
			$(elem).slider({
				range : true,
				min : scope.years[0],
				max : scope.years[scope.years.length - 1],
				values : [ scope.years[0], scope.years[scope.years.length - 1] ],
				slide : function(event, ui) {
					scope.$apply(function() {
						scope.year_min = ui.values[0];
						scope.year_max = ui.values[1];
					});
					console.log(scope.year_min, scope.year_max);
				}
			});
		}
	};
});

vehicleApp.directive('sliderAddYear', function() {
	return {
		restrict : 'A',
		link : function(scope, elem, attrs) {
			$(elem).slider({
				range : false,
				min : 0,
				max : 2000,
				value : 10,
				step: 1,
				slide : function(event, ui) {
					scope.$apply(function() {
						scope.addYear = ui.value;
					});
					console.log(scope.addYear);
				}
			});
		}
	};
});