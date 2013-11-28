<div id="detailsDiv">
	<h3 class="title"><b><span>{{detailsVehicle.brand}}</span> <span>{{detailsVehicle.model}}</span></b></h3>
	<table id="searchTable">		
			<tr>
				<td><label>Rendszám</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.licensePlate" readonly/></td>
			</tr>
			<tr>
				<td><label>Típus</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.type" /></td>
			</tr>
			<tr>
				<td><label>Márka</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.brand" /></td>
			</tr>
			<tr>
				<td><label>Modell</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.model" /></td>
			</tr>
			<tr>
				<td><label>Szín</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.color" /></td>
			</tr>
			<tr>
				<td><label>Üzemanyag</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.fuel" /></td>
			</tr>
			<tr>
				<td><label>Ár</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.price" /></td>
			</tr>
			<tr>
				<td><label>Évjárat</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.year" /></td>
			</tr>
			<tr>
				<td><label>Ajtók</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.doorNum" /></td>
			</tr>
			<tr>
				<td><label>Futott</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.mileage" /></td>
			</tr>
			<tr>
				<td><label>Váltó</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.transmission" /> </td>
			</tr>
			<tr>
				<td><label>Tömeg</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.weight" /></td>
			</tr>
			<tr>
				<td valign="top"><label>Fénykép</label></td>
					<td>
						<img id="detailsImage" data-ng-src="/usedcars/{{detailsVehicle.picture}}"/>
					</td>
				</tr>
		</table>
		<div ng-show="isEditable">
			<ul>
				<li class="functionList" data-ng-click="editFuncBtnClk()">Módosítás</li>
				<li class="functionList" data-ng-click="deleteFuncBtnClk()">Törlés</li>
			</ul>
		</div>
</div>