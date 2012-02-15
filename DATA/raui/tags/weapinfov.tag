<panel label="NO WEAPON SELECTED" id="weapon-info" manager="WeaponInfoManager" align="center">
	<stackview x="15" y="15" rtop="20" rright="15" style="class: litebg;">
		<view>
			<text id="weapon-description" width=".9" height="20" center="true">${offline.spawntab.selection.info}</text>
		</view>
		<view>
			<-- ui trooper -->
			<text id="weapon-description" x="10" width=".45" rtop="20"/>
			<view width="177" height="352" rright="10" rtop="20" style="class: thickborder; class: litebg;">
				<image id="weapon-image" pad="1"/>
			</view>
		</view>
		<view>
			<-- ui vehicle -->
			<text id="weapon-description" x="10" width=".45" rtop="20"/>
			<view width="202" height="152" rright="10" rtop="20" style="class: thickborder; class: darkbg;">
				<image id="weapon-image" pad="1"/>
			</view>
		</view>
		<view>
			<-- in game trooper -->
			<image id="weapon-image" width="175" height="350" rtop="10" center="x" style="size-scaler: .7;"/>
			<text id="weapon-description" y="5" width=".9" rtop=".65" style="font-size: -2;" center="x"/>
		</view>
		<view>
			<-- in game vehicle -->
			<image id="weapon-image" width="200" height="150" rtop="10" center="x"/>
			<text id="weapon-description" pad="20" rtop="200" center="x"/>
		</view>
	</stackview>
</panel>
