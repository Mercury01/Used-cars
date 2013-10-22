<div id="form-div" data-ng-controller="addCtrl" data-ng-init="addInit()">
	<h3>Felt�lt�s</h3>
	<form id="searchForm">
		<table id="searchTable">
			<tr>
				<td><label>Rendsz�m</label></td>
				<td><input class="textInput" type="text" data-ng-model="addLicense" placeholder="Rendsz�m"/></td>
			</tr>
			<tr>
				<td><label>T�pus</label></td>
				<td><select data-ng-model="addType" data-ng-options="t.name for t in types"></select></td>
			</tr>
			<tr>
				<td><label>M�rka</label></td>
				<td><input class="textInput" type="text" data-ng-model="addBrand" placeholder="M�rka" /></td>
			</tr>
			<tr>
				<td><label>Modell</label></td>
				<td><input class="textInput" type="text" data-ng-model="addModel" placeholder="Modell" /></td>
			</tr>
			<tr>
				<td><label>Sz�n</label></td>
				<td><select data-ng-model="addColor" data-ng-options="c.name for c in colors"></select></td>
			</tr>
			<tr>				
				<td><label>�zemanyag</label></td>
				<td><select data-ng-model="addFuelType" data-ng-options="f.name for f in fueltypes"></select></td>
			</tr>
			<tr>
				<td><label>�r</label></td>
				<td><input class="textInput" type="text" data-ng-model="addPrice" placeholder="Elad�si �r" /></td>
				</tr>
			<tr>
				<td><label>�vj�rat</label></td>
<!-- 				<td><div id="year-slider" slider:addYear="year" ></div></td> -->
				<td><input class="textInput" type="text" data-ng-model="addYear" placeholder="�vj�rat" /></td>
			</tr>
			<tr>
				<td><label>Ajt�k</label></td>
				<td><select data-ng-model="addDoor" data-ng-options="d.name for d in doors"></select></td>
			</tr>
			<tr>
				<td><label>Futott</label></td>
				<td><input class="textInput" type="text" data-ng-model="addMileage" placeholder="Km" /></td>
				</tr>
			<tr>
			<tr>
				<td><label>V�lt�</label></td>
				<td><select data-ng-model="addTransmission" data-ng-options="t.name for t in transmissions"></select></td>
			</tr>
			<tr>
				<td><label>T�meg</label></td>
				<td><input class="textInput" type="text" data-ng-model="addWeight" placeholder="Kg" /></td>
			</tr>
			<tr>
				<td><label>F�nyk�p</label></td>
<!-- 				<td><input id="fileInput" class="fileInput" type="file" data-ng-model="addImage" data-url="/" multiple/></td> -->
<!-- 				<td><input id="fileInput" class="fileInput" type="file" name="files[]" data-url="/usedcars/uploadImage" multiple/></td> -->
				<td>
					<input type="file" data-ng-model-instant id="fileToUpload" onchange="setFiles(this)" />
				</td>
			</tr>
		</table>
		
		<ul>
			<li class="functionList" data-ng-click="addBtnClk()">Hirdet�s felad�sa</li>
		</ul>
		
		<div data-ng-show="progressVisible">
            <div class="percent">{{progress}}%</div>
            <div class="progress-bar">
                <div class="uploaded" ng-style="{'width': progress+'%'}"></div>
            </div>
        </div>
		
<!-- 		<input type="button" data-ng-click="addBtnClk(addLicense, addType, addBrand, addModel,  -->
<!-- 													addColor, addFuelType, addYear, addPrice, addDoor, addMileage, -->
<!-- 													addTransmission, addWeight, addImage)" value="Hirdet�s felad�sa"> -->
		
	</form>
</div>