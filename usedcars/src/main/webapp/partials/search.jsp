<div id="form-div">
		<h3>Keresési kritériumok</h3>
		<form>
			<p>
				<label>Típus</label><br /> 
				<select data-ng-model="type" data-ng-options="t.name for t in types"></select>
			</p>
			
			<p>
				<label>Márka</label><br /> 
				<input type="text" data-ng-model="brand" placeholder="Márka"/>
			</p>
			
			<p>
				<label>Modell</label><br /> 
				<input type="text" data-ng-model="model" placeholder="Modell"/>
			</p>
			
			<p>
				<label>Szín</label><br /> 
				<select data-ng-model="color" data-ng-options="c.name for c in colors"></select>
			</p>
			
			<p>
				<label>Üzemanyag</label><br /> 
				<select data-ng-model="fueltype" data-ng-options="f.name for f in fueltypes"></select>
			</p>
			
			<p>
				<label>Ár</label><br /> 
				<span>{{price_min}}</span> - <span>{{price_max}}</span>
				<div id="price-slider" slider:prices="prices"></div>
			</p>	
			
			<p>
				<label>Évjárat</label><br />   
				<span>{{year_min}}</span> - <span>{{year_max}}</span>
				<div id="year-slider" slider:years="years"></div>
			</p>
			
			<p>
				<label>Ajtók száma</label><br /> 
				<select data-ng-model="door" data-ng-options="d.name for d in doors"></select>
			</p>
			
			<p>
				<input type="button" data-ng-click="searchBtnClk()" value="Keresés">
			</p>
		</form>
	</div>