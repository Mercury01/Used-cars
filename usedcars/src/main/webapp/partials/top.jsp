<div data-ng-controller="topCtrl">
	<h3>Legut�bb felt�lt�tt</h3>
<!-- 	<ul data-ng-repeat="topInstance in topList"> -->
<!--  		<li><img src="{{topInstance.picture}}"> -->
<!-- 			<h3>{{topInstance.brand}} {{topInstance.model}}</h3> -->
<!-- 			<p> -->
<!-- 				�vj�rat: {{topInstance.year}}<br /> -->
<!-- 				�r: {{topInstance.price}} -->
<!-- 			</p></li> -->
<!-- 	</ul> -->

		<table id="listTable">
			<tr data-ng-repeat="topInstance in topList" class="listRow">
				<td><img src="/usedcars/{{topInstance.thumbnail}}" class="thumbnail"/></td>
				<td><p class="topDetails">
				�vj�rat: {{topInstance.year}}<br />
				�r: {{topInstance.price}}<br />
				</p></td>
			</tr>
		</table>
</div>
