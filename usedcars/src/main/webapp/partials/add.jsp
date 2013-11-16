<%-- <%@ taglib prefix='sec' uri='https://www.springframework.org/security/tags' %> --%>
<div id="form-div" data-ng-controller="addCtrl" data-ng-init="addInit()"
	xmlns:security="http://www.springframework.org/security/tags">
	<h3 class="title">FeltˆltÈs</h3>
	<div id="error" data-ng-show="notFilled">KÈrlek az osszes mezoët toltsd ki megfeleloë ÈrtÈkekkel!</div>
	<form id="searchForm">
		<table id="searchTable">
			<security:authorize ifAllGranted="ROLE_ADMIN">
			<tr>
				<td><label>Rendsz·m</label></td>
				<td><input class="textInput" type="text" data-ng-model="addLicense" placeholder="Rendsz·m" /></td>
			</tr>
			<tr>
				<td><label>TÌpus</label></td>
				<td><select data-ng-model="addType" data-ng-options="t.name for t in types"></select></td>
			</tr>
			<tr>
				<td><label>M·rka</label></td>
				<td><input class="textInput" type="text" data-ng-model="addBrand" placeholder="M·rka" /></td>
			</tr>
			<tr>
				<td><label>Modell</label></td>
				<td><input class="textInput" type="text" data-ng-model="addModel" placeholder="Modell" /></td>
			</tr>
			<tr>
				<td><label>SzÌn</label></td>
				<td><select data-ng-model="addColor" data-ng-options="c.name for c in colors"></select></td>
			</tr>
			<tr>
				<td><label>‹zemanyag</label></td>
				<td><select data-ng-model="addFuelType" data-ng-options="f.name for f in fueltypes"></select></td>
			</tr>
			<tr>
				<td><label>¡År</label></td>
				<td><input class="textInput" type="text" data-ng-model="addPrice" placeholder="Elad·si ·r" /></td>
			</tr>
			<tr>
				<td><label>…vj·rat</label></td>
				<!-- 				<td><div id="year-slider" slider:addYear="year" ></div></td> -->
				<td><input class="textInput" type="text" data-ng-model="addYear" placeholder="√É¬âvj·rat" /></td>
			</tr>
			<tr>
				<td><label>AjtÛk</label></td>
				<td><select data-ng-model="addDoor" data-ng-options="d.name for d in doors"></select></td>
			</tr>
			<tr>
				<td><label>Futott</label></td>
				<td><input class="textInput" type="text" data-ng-model="addMileage" placeholder="Km" /></td>
			</tr>
			<tr>
				<td><label>V·ltÛ</label></td>
				<td><select data-ng-model="addTransmission" data-ng-options="t.name for t in transmissions"></select></td>
			</tr>
			<tr>
				<td><label>Tˆmeg</label></td>
				<td><input class="textInput" type="text" data-ng-model="addWeight" placeholder="Kg" /></td>
			</tr>
			<tr>
				<td><label>FÈnykÈp</label></td>
<!-- 				<td><input type="file" data-ng-model-instant id="fileToUpload" onchange="setFiles(this)" /></td> -->
					<td>
						<div class="fileUpload">
<!-- 						 	<input id="uploadFile" placeholder="V·lassz egy kÈpet" disabled="disabled" /> -->
<!-- 							<span>FÈnykÈp kiv·laszt·sa</span> -->
<!-- 							<input type="file" data-ng-model-instant id="fileToUpload" class="fileUpload" onchange="setFiles(this)" /> -->

							<input type="text" class="file_input_textbox" readonly="readonly" value='Nincs kiv·lasztva' data-ng-model="selectedFile">
							<div class="file_input_div">
								<input type="button" value="File kiv·laszt·sa" class="file_input_button" /> 
								<input type="file" name="uploaded_file"
									class="file_input_hidden" type="file" data-ng-model-instant id="fileToUpload" onchange="setFiles(this)" />
							</div>
						</div>
					</td>
				</tr>
			</security:authorize>
		</table>
		
		
		<ul>
			<li class="functionList" data-ng-click="addBtnClk()">HirdetÈs felad·sa</li>
		</ul>
<!-- 		<div data-ng-show="progressVisible"> -->
<!-- 			<div class="percent">{{progress}}%</div> -->
<!-- 			<div class="progress-bar"> -->
<!-- 				<div class="uploaded" ng-style="{'width': progress+'%'}"></div> -->
<!-- 			</div> -->
		</div>

		<!-- 		<input type="button" data-ng-click="addBtnClk(addLicense, addType, addBrand, addModel,  -->
		<!-- 													addColor, addFuelType, addYear, addPrice, addDoor, addMileage, -->

	</form>
</div>