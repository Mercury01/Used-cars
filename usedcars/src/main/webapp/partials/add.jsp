<div id="form-div" data-ng-controller="addCtrl" data-ng-init="addInit()">
	<h3>Feltöltés</h3>
	<form id="searchForm">
		<table id="searchTable">
			<tr>
				<td><label>Rendszám</label></td>
				<td><input class="textInput" type="text" data-ng-model="addLicense" placeholder="Rendszám"/></td>
			</tr>
			<tr>
				<td><label>Típus</label></td>
				<td><select data-ng-model="addType" data-ng-options="t.name for t in types"></select></td>
			</tr>
			<tr>
				<td><label>Márka</label></td>
				<td><input class="textInput" type="text" data-ng-model="addBrand" placeholder="Márka" /></td>
			</tr>
			<tr>
				<td><label>Modell</label></td>
				<td><input class="textInput" type="text" data-ng-model="addModel" placeholder="Modell" /></td>
			</tr>
			<tr>
				<td><label>Szín</label></td>
				<td><select data-ng-model="addColor" data-ng-options="c.name for c in colors"></select></td>
			</tr>
			<tr>				
				<td><label>Üzemanyag</label></td>
				<td><select data-ng-model="addFuelType" data-ng-options="f.name for f in fueltypes"></select></td>
			</tr>
			<tr>
				<td><label>Ár</label></td>
				<td><input class="textInput" type="text" data-ng-model="addPrice" placeholder="Eladási ár" /></td>
				</tr>
			<tr>
				<td><label>Évjárat</label></td>
<!-- 				<td><div id="year-slider" slider:addYear="year" ></div></td> -->
				<td><input class="textInput" type="text" data-ng-model="addYear" placeholder="Évjárat" /></td>
			</tr>
			<tr>
				<td><label>Ajtók</label></td>
				<td><select data-ng-model="addDoor" data-ng-options="d.name for d in doors"></select></td>
			</tr>
			<tr>
				<td><label>Futott</label></td>
				<td><input class="textInput" type="text" data-ng-model="addMileage" placeholder="Km" /></td>
				</tr>
			<tr>
			<tr>
				<td><label>Váltó</label></td>
				<td><select data-ng-model="addTransmission" data-ng-options="t.name for t in transmissions"></select></td>
			</tr>
			<tr>
				<td><label>Tömeg</label></td>
				<td><input class="textInput" type="text" data-ng-model="addWeight" placeholder="Kg" /></td>
			</tr>
			<tr>
				<td><label>Fénykép</label></td>
<!-- 				<td><input id="fileInput" class="fileInput" type="file" data-ng-model="addImage" data-url="/" multiple/></td> -->
<!-- 				<td><input id="fileInput" class="fileInput" type="file" name="files[]" data-url="/usedcars/uploadImage" multiple/></td> -->
				<td>
					<input type="file" data-ng-model-instant id="fileToUpload" onchange="setFiles(this)" />
				</td>
			</tr>
		</table>
		
		<ul>
			<li class="functionList" data-ng-click="addBtnClk()">Hirdetés feladása</li>
		</ul>
		
		<div data-ng-show="progressVisible">
            <div class="percent">{{progress}}%</div>
            <div class="progress-bar">
                <div class="uploaded" ng-style="{'width': progress+'%'}"></div>
            </div>
        </div>
		
<!-- 		<input type="button" data-ng-click="addBtnClk(addLicense, addType, addBrand, addModel,  -->
<!-- 													addColor, addFuelType, addYear, addPrice, addDoor, addMileage, -->
<!-- 													addTransmission, addWeight, addImage)" value="Hirdetés feladása"> -->
		
	</form>
</div>