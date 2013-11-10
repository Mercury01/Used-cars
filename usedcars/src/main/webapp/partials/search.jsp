<div id="searchForm">
	<h3 class="title">Keres�si krit�riumok</h3>
<!-- 	<form id="searchForm"> -->
		<table id="searchTable">
			<tr>
				<td><label>T�pus</label></td>
				<td><select data-ng-model="type" data-ng-options="t.name for t in types"></select></td>
			</tr>
			<tr>
				<td><label>M�rka</label></td>
				<td><input class="textInput" type="text" data-ng-model="brand" placeholder="M�rka" /></td>
			</tr>
			<tr>
				<td><label>Modell</label></td>
				<td><input class="textInput" type="text" data-ng-model="model" placeholder="Modell" /></td>
			</tr>
			<tr>
				<td><label>Sz�n</label></td>
				<td><select data-ng-model="color" data-ng-options="c.name for c in colors"></select></td>
			</tr>
			<tr>				
				<td><label>�zemanyag</label></td>
				<td><select data-ng-model="fueltype" data-ng-options="f.name for f in fueltypes"></select></td>
			</tr>
			<tr>
				<td><label>�r</label><br /> <span>{{price_min}}</span> - <span>{{price_max}}</span></td>
				<td><div id="price-slider" slider:prices="prices"></div></td>
			</tr>
			<tr>
				<td><label>�vj�rat</label><br /> <span>{{year_min}}</span> - <span>{{year_max}}</span></td>
				<td><div id="year-slider" slider:years="years"></div></td>
			</tr>
			<tr>
				<td><label>Ajt�k sz�ma</label></td>
				<td><select data-ng-model="door" data-ng-options="d.name for d in doors"></select></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<ul>
			<li class="functionList" data-ng-click="searchBtnClk()">Keres�s</li>
		</ul>
<!-- 		<input type="button" data-ng-click="searchBtnClk()" value="Keres�s"> -->
<!-- 	</form> -->
</div>