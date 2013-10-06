<div id="form-div">
		<h3>Keres�si krit�riumok</h3>
		<form>
			<p>
				<label>T�pus</label><br /> 
				<select data-ng-model="type" data-ng-options="t.name for t in types"></select>
			</p>
			
			<p>
				<label>M�rka</label><br /> 
				<input type="text" data-ng-model="brand" placeholder="M�rka"/>
			</p>
			
			<p>
				<label>Modell</label><br /> 
				<input type="text" data-ng-model="model" placeholder="Modell"/>
			</p>
			
			<p>
				<label>Sz�n</label><br /> 
				<select data-ng-model="color" data-ng-options="c.name for c in colors"></select>
			</p>
			
			<p>
				<label>�zemanyag</label><br /> 
				<select data-ng-model="fueltype" data-ng-options="f.name for f in fueltypes"></select>
			</p>
			
			<p>
				<label>�r</label><br /> 
				<span>{{price_min}}</span> - <span>{{price_max}}</span>
				<div id="price-slider" slider:prices="prices"></div>
			</p>	
			
			<p>
				<label>�vj�rat</label><br />   
				<span>{{year_min}}</span> - <span>{{year_max}}</span>
				<div id="year-slider" slider:years="years"></div>
			</p>
			
			<p>
				<label>Ajt�k sz�ma</label><br /> 
				<select data-ng-model="door" data-ng-options="d.name for d in doors"></select>
			</p>
			
			<p>
				<input type="button" data-ng-click="searchBtnClk()" value="Keres�s">
			</p>
		</form>
	</div>