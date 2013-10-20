<div>
	<h3>Találatok</h3>

		<table id="listTable">
			<tr data-ng-repeat="searchResult in searchResultList" class="listRow">
				<td>_PIC_</td>
				<td><p>
				Évjárat: {{searchResult.year}}<br />
				Ár: {{searchResult.price}}<br />
				</p></td>
			</tr>
		</table>
		<ul>
			<li class="functionList" data-ng-click="backToTopFuncBtnClk()">Vissza</li>
		</ul>
</div>