<div id="top-div">
	<h3>Legut�bb felt�lt�tt</h3>
<!-- 	<ul data-ng-repeat="topInstance in topList"> -->
<!--  		<li><img src="{{topInstance.picture}}"> -->
<!-- 			<h3>{{topInstance.brand}} {{topInstance.model}}</h3> -->
<!-- 			<p> -->
<!-- 				�vj�rat: {{topInstance.year}}<br /> -->
<!-- 				�r: {{topInstance.price}} -->
<!-- 			</p></li> -->
<!-- 	</ul> -->

		<table>
			<tr data-ng-repeat="topInstance in topList">
				<td><p>
				�vj�rat: {{topInstance.year}}<br />
				�r: {{topInstance.price}}
				</p></td>
			</tr>
		</table>
</div>
