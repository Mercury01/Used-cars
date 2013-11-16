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
			<td class="thumbnail">
					<img data-ng-src="/usedcars/{{topInstance.thumbnail}}" class="thumbnail" />
				</td>
			<td class="topDetails">
					<div><b><span>{{topInstance.brand}}</span> <span>{{topInstance.model}}</span></b> </div> 
					<div class="detailDiv">Évjárat: {{topInstance.year}}</div>
					<div>Ár: {{topInstance.price}}</div>
			</td>
		</tr>
	</table>
</div>
