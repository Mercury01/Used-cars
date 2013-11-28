<div id="securityDiv" data-ng-controller="loginCtrl">
	<h3>Kérlek jelentkezz be!</h3>
	<form action="j_spring_security_check?ajax=true" method="post">
		<p>
			<label for="j_username" class="formLabel">Felhasználónév</label> 
			<input name="j_username" type="text" class="formInput" ng-model="loginUsername"/>
		</p>
		<p>
			<label for="j_password" class="formLabel">Jelszó</label> 
			<input name="j_password" type="password" class="formInput" ng-model="loginPassword"/>
		</p>
		<p>
<!-- 			<input type="submit" value="Bejelentkezés" class="formButton"/> -->
			<input type="button" value="Bejelentkezés" class="formButton" ng-click="login()" />
		</p>
	</form>
	
	<p>Ha még nem rendelkezel fiókkal...</p>
	
	<h3>Regisztrálhatsz egy újat</h3>
	<form>
		<p>
			<label class="formLabel">Felhasználónév</label> 
			<input type="text" id="username" class="formInput" data-ng-model="registerUsername"/>
		</p>
	
		<p>
			<label class="formLabel">Jelszó</label> 
			<input type="password" id="password" class="formInput" data-ng-model="registerPassword"/>
		</p>
	
		<p>
			<input type="button" value="Regisztráció" onclick="register()" class="formButton"/>
		</p>
	</form>
</div>