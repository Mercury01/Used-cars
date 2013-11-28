<div data-ng-controller="topCtrl" data-ng-init="initTop()">
	<h3 class="title">Legut�bb felt�lt�tt</h3>
<!-- 	<table class="listTable" id="searchListTable"> -->

<!-- 	</table> -->
	<table class="listTable">
		<tr data-ng-repeat="topInstance in topList" class="listRow" ng-click="getDetail(topInstance)">
			<td class="thumbnail">
				<!-- 				<img ng-init="getImage(topInstance)" data-ng-src="/usedcars/{{thumbnail}}" class="thumbnail" /> --> <!-- 			<img ng-init="getImage(topInstance)" data-ng-src="/usedcars/{{thumbnail}}" class="thumbnail" /> -->
				<img ng-src="/usedcars/{{topInstance.thumbnail}}" class="thumbnail" />
			</td>
			<td class="details">
				<div>
					<b><span>{{topInstance.brand}}</span> <span>{{topInstance.model}}</span></b>
				</div>
				<div class="detailDiv">�vj�rat: {{topInstance.year}}</div>
				<div>�r: {{topInstance.price}}</div>
			</td>
		</tr>
	</table>
</div>

		
