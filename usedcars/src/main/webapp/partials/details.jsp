<div id="detailsDiv">
	<h3 class="title"><b><span>{{detailsVehicle.brand}}</span> <span>{{detailsVehicle.model}}</span></b></h3>
	<table id="searchTable">		
			<tr>
				<td><label>Rendsz�m</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.licensePlate" readonly/></td>
			</tr>
			<tr>
				<td><label>T�pus</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.type" /></td>
			</tr>
			<tr>
				<td><label>M�rka</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.brand" /></td>
			</tr>
			<tr>
				<td><label>Modell</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.model" /></td>
			</tr>
			<tr>
				<td><label>Sz�n</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.color" /></td>
			</tr>
			<tr>
				<td><label>�zemanyag</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.fuel" /></td>
			</tr>
			<tr>
				<td><label>��r</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.price" /></td>
			</tr>
			<tr>
				<td><label>�vj�rat</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.year" /></td>
			</tr>
			<tr>
				<td><label>Ajt�k</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.doorNum" /></td>
			</tr>
			<tr>
				<td><label>Futott</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.mileage" /></td>
			</tr>
			<tr>
				<td><label>V�lt�</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.transmission" /> </td>
			</tr>
			<tr>
				<td><label>T�meg</label></td>
				<td><input class="textInput" type="text" data-ng-model="detailsVehicle.weight" /></td>
			</tr>
			<tr>
				<td valign="top"><label>F�nyk�p</label></td>
					<td>
						<img id="detailsImage" data-ng-src="/usedcars/{{detailsVehicle.picture}}"/>
					</td>
				</tr>
		</table>
		<div ng-show="isEditable">
			<ul>
				<li class="functionList" data-ng-click="editFuncBtnClk()">M�dos�t�s</li>
				<li class="functionList" data-ng-click="deleteFuncBtnClk()">T�rl�s</li>
			</ul>
		</div>
</div>