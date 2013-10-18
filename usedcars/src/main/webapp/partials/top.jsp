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

		<table id="topTable">
			<tr data-ng-repeat="topInstance in topList" class="topRow">
				<td><p class="topParagraph">
				Évjárat: {{topInstance.year}}<br />
				Ár: {{topInstance.price}}<br />{{topInstance}}
				</p></td>
			</tr>
		</table>
</div>
