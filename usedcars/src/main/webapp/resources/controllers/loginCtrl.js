/**
 * 
 */

loginCtrl = function($scope, $http, $compile) {
	
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
			console.log("Registration successful");
			console.log(data);
			showError2("Sikeres regisztr�ci�");
		}).error(function(data) {
			console.log("Registration failed");
		});
		//TODO floatoljon be valami szar, vagy t�nj�n el a regisztr�ci�, vagy vmi
	};
	
	//TODO ofc nem jelenik meg �jra, ha lej�r a session
	$scope.login = function() {
		console.log("Login click");
		//TODO delete
		var url = "j_spring_security_check?ajax=true&" + 
		"j_username=" + $scope.loginUsername +
		"&j_password= " + $scope.loginPassword;
		console.log(url);
//		
//		document.getElementById('#addDiv').src = 'partials/add.jsp';
		
		$http({
			url : "j_spring_security_check?ajax=true&" + 
					"j_username=" + $scope.loginUsername +
					"&j_password=" + $scope.loginPassword,
			method : "POST",
////			data : JSON.stringify(loginForm)//$(".loginForm").serialize()//
		}).success(function(data) {
			document.getElementById('#addDiv').src = 'partials/add.jsp';
			console.log("Login successful");
////			$('#addDiv').attr('src', $('partials/add.jsp'));
			$scope.$broadcast("REFRESH");
			$scope.isLoggedIn = true;
		}).error(function(data) {
			console.log("Login failed");
		});
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