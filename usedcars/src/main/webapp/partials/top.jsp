<div data-ng-controller="topCtrl">
	<h3 class="title">Legutóbb feltöltött</h3>
<!-- 	<ul data-ng-repeat="topInstance in topList"> -->
<!--  		<li><img src="{{topInstance.picture}}"> -->
<!-- 			<h3>{{topInstance.brand}} {{topInstance.model}}</h3> -->
<!-- 			<p> -->
<!-- 				Évjárat: {{topInstance.year}}<br /> -->
<!-- 				Ár: {{topInstance.price}} -->
<!-- 			</p></li> -->
<!-- 	</ul> -->

	<table id="listTable">
		<tr data-ng-repeat="topInstance in topList" class="listRow">
			<td class="thumbnail"><p>
					<img src="/usedcars/{{topInstance.thumbnail}}" class="thumbnail" />
				<p></td>
			<td><p class="topDetails">
					Évjárat: {{topInstance.year}}<br /> Ár: {{topInstance.price}}<br />
				</p></td>
		</tr>
	</table>
</div>
