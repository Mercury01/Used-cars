<div>
	<h3 class="title">Találatok</h3>
		<table id="listTable">
			<tr data-ng-repeat="searchResult in searchResultList" class="listRow">
				<td class="thumbnail">
					<img data-ng-src="/usedcars/{{searchResult.thumbnail}}" class="thumbnail" />
				</td>
				<td class="details">
					<div><b><span>{{searchResult.brand}}</span> <span>{{searchResult.model}}</span></b> </div> 
					<div class="detailDiv">Évjárat: {{searchResult.year}}</div>
					<div>Ár: {{searchResult.price}}</div>
			</td>
			</tr>
		</table>
		<ul>
			<li class="functionList" data-ng-click="backToTopFuncBtnClk()">Vissza</li>
		</ul>
</div>