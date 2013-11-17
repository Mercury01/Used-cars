<div id="form-div" data-ng-controller="addCtrl" data-ng-init="addInit()"
	xmlns:security="http://www.springframework.org/security/tags">
	<h3 class="title">Feltöltés</h3>
<!-- 	<form id="searchForm"> -->
		<table id="searchTable">
			<security:authorize ifAllGranted="ROLE_ADMIN">
			<tr>
				<td><label>Rendszám</label></td>
				<td><input class="textInput" type="text" data-ng-model="addLicense" placeholder="Rendszám" /></td>
			</tr>
			<tr>
				<td><label>Típus</label></td>
				<td><select data-ng-model="addType" data-ng-options="t.name for t in addTypes"></select></td>
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
				<td><select data-ng-model="addColor" data-ng-options="c.name for c in addColors"></select></td>
			</tr>
			<tr>
				<td><label>Üzemanyag</label></td>
				<td><select data-ng-model="addFuelType" data-ng-options="af.name for af in addFueltypes"></select></td>
			</tr>
			<tr>
				<td><label>Ár</label></td>
				<td><input class="textInput" type="text" data-ng-model="addPrice" placeholder="Eladási ár" /></td>
			</tr>
			<tr>
				<td><label>Évjárat</label></td>
				<td><input class="textInput" type="text" data-ng-model="addYear" placeholder="Évjárat" /></td>
			</tr>
			<tr>
				<td><label>Ajtók</label></td>
				<td><select data-ng-model="addDoor" data-ng-options="d.name for d in addDoors"></select></td>
			</tr>
			<tr>
				<td><label>Futott</label></td>
				<td><input class="textInput" type="text" data-ng-model="addMileage" placeholder="Km" /></td>
			</tr>
			<tr>
				<td><label>Váltó</label></td>
				<td><select data-ng-model="addTransmission" data-ng-options="t.name for t in addTransmissions"></select></td>
			</tr>
			<tr>
				<td><label>Tömeg</label></td>
				<td><input class="textInput" type="text" data-ng-model="addWeight" placeholder="Kg" /></td>
			</tr>
			<tr>
				<td><label>Fénykép</label></td>
<!-- 				<td><input type="file" data-ng-model-instant id="fileToUpload" onchange="setFiles(this)" /></td> -->
					<td>
						<div class="fileUpload">
<!-- 						 	<input id="uploadFile" placeholder="Válassz egy képet" disabled="disabled" /> -->
<!-- 							<span>Fénykép kiválasztása</span> -->
<!-- 							<input type="file" data-ng-model-instant id="fileToUpload" class="fileUpload" onchange="setFiles(this)" /> -->

							<input type="text" class="file_input_textbox" readonly="readonly" value='Nincs kiválasztva' data-ng-model="selectedFile">
							<div class="file_input_div">
								<input type="button" value="File kiválasztása" class="file_input_button" /> 
								<input type="file" name="uploaded_file"
									class="file_input_hidden" type="file" data-ng-model-instant id="fileToUpload" onchange="setFiles(this)" />
							</div>
						</div>
					</td>
				</tr>
			</security:authorize>
		</table>
		
		
		<ul>
			<li class="functionList" data-ng-click="addBtnClk()">Hirdetés feladása</li>
		</ul>
<!-- 		<div data-ng-show="progressVisible"> -->
<!-- 			<div class="percent">{{progress}}%</div> -->
<!-- 			<div class="progress-bar"> -->
<!-- 				<div class="uploaded" ng-style="{'width': progress+'%'}"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<!-- 		<input type="button" data-ng-click="addBtnClk(addLicense, addType, addBrand, addModel,  -->
		<!-- 													addColor, addFuelType, addYear, addPrice, addDoor, addMileage, -->

<!-- 	</form> -->
</div>