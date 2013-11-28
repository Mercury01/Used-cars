<div>
	<h3 class="title">Tal�latok</h3>
		<table class="listTable">
			<tr data-ng-repeat="searchResult in searchResultList" class="listRow" ng-click="getDetail(searchResult)">
				<td class="thumbnail">
					<img data-ng-src="/usedcars/{{searchResult.thumbnail}}" class="thumbnail"/>
				</td>
				<td class="details">
					<div><b><span>{{searchResult.brand}}</span> <span>{{searchResult.model}}</span></b> </div> 
					<div class="detailDiv">�vj�rat: {{searchResult.year}}</div>
					<div>�r: {{searchResult.price}}</div>
			</td>
			</tr>
		</table>
		<ul>
			<li class="functionList" data-ng-click="backToTopFuncBtnClk()">Vissza</li>
		</ul>
</div>