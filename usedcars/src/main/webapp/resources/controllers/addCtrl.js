/**
 * 
 */

addCtrl = function($scope, $http) {
	
	//$scope.fileToUpload = null;
	
	$scope.addInit = function() {
//		$scope.notFilled = false;
	};
	
	/*$('#fileInput').bind('fileuploadadd', function(e, data){
        // Add the files to the list
        //numFiles = $scope.fileList.length
//        for (var i=0; i < data.files.length; ++i) {
//            var file = data.files[i];
        // .$apply to update angular when something else makes changes
//            console.log(file);
//            console.log(data);
//        $scope.$apply(
//            $scope.fileList.push({name: file.name})
//            );
//        }
        // Begin upload immediately
        
        fileToUpload = data;
 
	});*/
	
	setFiles = function(element) {
	    $scope.$apply(function(scope) {
	      console.log('Selected files:', element.files);
	      // Turn the FileList object into an Array
	        scope.files = [];
	        for (var i = 0; i < element.files.length; i++) {
	          $scope.files.push(element.files[i]);
	        }
	        $scope.progressVisible = false;
	        $scope.selectedFile = $scope.files[0].name;
	      });
	    console.log($scope.isTopList); //TODO
	    };
	    
    uploadFile = function(licensePlate) {
        var fd = new FormData();
////        for (var i in $scope.files) {
////            fd.append("uploadedFile", $scope.files[i]);
////        }
//        console.log(licensePlate);
        fd.append("image", $scope.files[0]);
        fd.append("licensePlate", licensePlate);
//        var xhr = new XMLHttpRequest();
////        xhr.upload.addEventListener("progress", uploadProgress, false);
////        xhr.addEventListener("load", uploadComplete, false);
////        xhr.addEventListener("error", uploadFailed, false);
////        xhr.addEventListener("abort", uploadCanceled, false);
//        xhr.open("POST", "uploadImage");
//        $scope.progressVisible = true;
//        xhr.send(fd);
        
	$http({
		url : "uploadImage",
		method : "POST",
		headers: { 'Content-Type': undefined },
		transformRequest: angular.identity,
		data : fd
	}).success(function(data) {
		$scope.init();
	}).error(function(data) {
		$scope.result = "Error";
	});
	
//		$http.post("uploadImage", fd, {
//	        withCredentials: true,
//	        headers: {'Content-Type': undefined },
//	        transformRequest: angular.identity
//	    })
//	    .success(function(data) {
//			
//		}).error(function(data) {
//			
//		});
	
    };
	
	$scope.addBtnClk = function() {
			
//		console.log("PARAMS: ", $scope.addLicense, $scope.addType, $scope.addBrand, $scope.addModel, 
//				$scope.addColor, $scope.addFuelType, $scope.addYear, $scope.addPrice, $scope.addDoor, $scope.addMileage,
//				$scope.addTransmission, $scope.addWeight, fileToUpload);
		
		if (!checkNull($scope.addType, $scope.addColor, $scope.addFuelType, $scope.addDoor, $scope.addTransmission, fileToUpload) ||	//TODO check fileToUpload
			!checkNumbers($scope.addYear, $scope.addPrice, $scope.addDoor, $scope.addMileage, $scope.addWeight)) {
//			$scope.notFilled = true;
			showError2("Kérlek az összes mezõt töltsd ki!");
			return;	
		}
		
		var addForm = {
		           vehicleId  : 		0,
		           licensePlate  : 		$scope.addLicense,
		           type  : 		$scope.addType.name,
		           brand : 		$scope.addBrand,
		           model : 		$scope.addModel,
		           color : 		$scope.addColor.name,
		           fuel	 : 		$scope.addFuelType.name,
		           price :		$scope.addPrice,
		           doorNum  :		$scope.addDoor.name,
		           year	 :		$scope.addYear,
		           mileage  : 		$scope.addMileage,
		           transmission  : 		$scope.addTransmission.name,
		           weight  : 		$scope.addWeight,
		           image  : 		$scope.addImage
		};

		$http({
			url : "add",
			method : "POST",
			data : JSON.stringify(addForm)
		}).success(function(data) {
			$scope.init();
		}).error(function(data) {
			$scope.result = "Error";
		});
		
		uploadFile($scope.addLicense);
		
		clearForm();
	};
	
	//TODO might be wrong, only tested once
	clearForm = function() {
		$scope.addLicense = null;
		$scope.addType = $scope.addTypes[0];
		$scope.addBrand = null;
		$scope.addModel = null;
		$scope.addColor = $scope.addColors[0];
		$scope.addFuelType = $scope.addFueltypes[0];
		$scope.addPrice = null;
		$scope.addDoor = $scope.addDoors[0];
		$scope.addYear = null;
		$scope.addMileage = null;
		$scope.addTransmission = $scope.addTransmissions[0];
		$scope.addWeight = null;
		$scope.selectedFile = null;
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