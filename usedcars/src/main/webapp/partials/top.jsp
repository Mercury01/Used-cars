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

		<table id="topTable">
			<tr data-ng-repeat="topInstance in topList" class="topRow">
				<td><p class="topParagraph">
				�vj�rat: {{topInstance.year}}<br />
				�r: {{topInstance.price}}<br />{{topInstance}}
				</p></td>
			</tr>
		</table>
</div>
