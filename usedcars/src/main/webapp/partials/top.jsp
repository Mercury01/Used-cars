<div id="top-div">
	<h3>Legutóbb feltöltött</h3>
<!-- 	<ul data-ng-repeat="topInstance in topList"> -->
<!--  		<li><img src="{{topInstance.picture}}"> -->
<!-- 			<h3>{{topInstance.brand}} {{topInstance.model}}</h3> -->
<!-- 			<p> -->
<!-- 				Évjárat: {{topInstance.year}}<br /> -->
<!-- 				Ár: {{topInstance.price}} -->
<!-- 			</p></li> -->
<!-- 	</ul> -->

		<table>
			<tr data-ng-repeat="topInstance in topList">
				<td><p>
				Évjárat: {{topInstance.year}}<br />
				Ár: {{topInstance.price}}
				</p></td>
			</tr>
		</table>
</div>
