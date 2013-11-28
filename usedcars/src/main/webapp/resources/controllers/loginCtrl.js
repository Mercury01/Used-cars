/**
 * 
 */

loginCtrl = function($scope, $http) {
	register = function() {
		
		console.log("Registering user: " + $scope.registerUsername);
		
		var registerForm = {
				username : $scope.registerUsername,
				password : $scope.registerPassword
		};
		
		$http({
			url : "register",
			method : "POST",
			data : JSON.stringify(registerForm)
		}).success(function(data) {
			alert(data);
			console.log("Registration succesful");
			console.log(data);
		}).error(function(data) {
			console.log("Registration failed");
		});
		//TODO floatoljon be valami szar, vagy tünjön el a regisztráció, vagy vmi
	};
};



//console.log("FILE" + fileToUpload);
//fileToUpload.submit()
//			.done(function() {
//				console.log("File upload succesful");
//			}).fail(function() {
//				console.log("File upload failed");
//			});

//console.log("");