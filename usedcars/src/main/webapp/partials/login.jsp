<div id="securityDiv" data-ng-controller="loginCtrl">
	<h3>K�rlek jelentkezz be!</h3>
	<form action="j_spring_security_check?ajax=true" method="post">
		<p>
			<label for="j_username" class="formLabel">Felhaszn�l�n�v</label> 
			<input name="j_username" type="text" class="formInput" ng-model="loginUsername"/>
		</p>
		<p>
			<label for="j_password" class="formLabel">Jelsz�</label> 
			<input name="j_password" type="password" class="formInput" ng-model="loginPassword"/>
		</p>
		<p>
<!-- 			<input type="submit" value="Bejelentkez�s" class="formButton"/> -->
			<input type="button" value="Bejelentkez�s" class="formButton" ng-click="login()" />
		</p>
	</form>
	
	<p>Ha m�g nem rendelkezel fi�kkal...</p>
	
	<h3>Regisztr�lhatsz egy �jat</h3>
	<form>
		<p>
			<label class="formLabel">Felhaszn�l�n�v</label> 
			<input type="text" id="username" class="formInput" data-ng-model="registerUsername"/>
		</p>
	
		<p>
			<label class="formLabel">Jelsz�</label> 
			<input type="password" id="password" class="formInput" data-ng-model="registerPassword"/>
		</p>
	
		<p>
			<input type="button" value="Regisztr�ci�" onclick="register()" class="formButton"/>
		</p>
	</form>
</div>