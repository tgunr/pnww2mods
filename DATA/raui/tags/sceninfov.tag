<view id="scenario-info" manager="ScenarioInfoManager">
	<body x="5" height=".48" rright="5" rtop="5" style="class: bordered;"/>
	<view x="5" height=".48" y="5" rright="5" rtop="5" style="class: bordered; layout: flow;">
		<caption label="SELECTED MAP" height="20" style="class: bordered;"/>
		<caption height="15" width=".5" label="Map Name:" style="class: bordered;"/>
		<caption height="15" width=".5" id="scenario-name" label="Aces High" style="class: bordered;"/>
		<caption height="15" width=".5" label="Map Type:" style="class: bordered;"/>
		<caption height="15" width=".5" id="scenario-type" label="Deathmatch" style="class: bordered;"/>
		<caption height="15" label="Map Description:" style="class: bordered;"/>
		<text id="scenario-description"/>
	</view>
	<!--
	<view id="map" class="mapview" acceptsfocus="no" minscale=".01" maxscale=".1" scale=".05"
		x="5" height=".48" y="5" rright="5" sx="0" sy="0">
		<layer type="texture" id="default-64-tex" minscale="0" maxscale="64" enabled="true" orign="-26x210" rowcolsize="1x1" cellsize="64x64"/>
		<layer type="icon" id="icons" minscale="1" maxscale="8" enabled="true"/>
		<layer type="icon" id="rendered" minscale="0" maxscale="1" enabled="true"/>
		<layer type="scenario" id="scenmap" minscale="0" maxscale="2" enabled="true"/>
		<layer type="players" minscale="0" maxscale="20" />
	</view>
	-->	
</view>
