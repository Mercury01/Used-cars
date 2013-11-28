/**
 * Utilities for validation, logging, etc.
 */

checkNumbers = function(addYear, addPrice, addDoor, addMileage, addWeight) {
	console.log("Checking numbers ", addYear, addPrice, addDoor, addMileage, addWeight);
	var result = (isNumber(addDoor.name) && isNumber(addYear) && isNumber(addPrice)
			&& isNumber(addMileage) && isNumber(addWeight));

	console.log("	Result: " + result);
	return result;
};

isNumber = function(string) {
	var pattern = new RegExp(/^\d+$/);
	return pattern.test(string);
};

checkNull = function(addType, addColor, addFuelType, addDoor, addTransmission) {
	console.log("Checking objects ", addType, addColor, addFuelType, addDoor, addTransmission);
	var result = (addType && addColor && addFuelType
			&& addDoor && addTransmission);
	console.log("	Result: ", result);
	return result;
};

showError1 = function(message) {
	$("#error1").hide();
	$("#error1").empty();
	$("#error1").text(message);
	$("#error1").fadeIn("slow");
};

showError2 = function(message) {
	$("#error2").hide();
	$("#error2").empty();
	$("#error2").text(message);
	$("#error2").fadeIn("slow");
};