<div>
	<h3>Tal�latok</h3>

		<table id="listTable">
			<tr data-ng-repeat="searchResult in searchResultList" class="listRow">
				<td>_PIC_</td>
				<td><p>
				�vj�rat: {{searchResult.year}}<br />
				�r: {{searchResult.price}}<br />
				</p></td>
			</tr>
		</table>
		<ul>
			<li class="functionList" data-ng-click="backToTopFuncBtnClk()">Vissza</li>
		</ul>
</div>