<panel label="NO WEAPON SELECTED" id="weapon-info" manager="WeaponInfoManager" align="center">
	<stackview x="15" y="15" rtop="20" rright="15" style="class: litebg;">
		<view>
			<text id="weapon-description" width=".9" height="20" center="true">${offline.spawntab.selection.info}</text>
		</view>
		<view>
			<text id="weapon-description" x="10" width=".45" rtop="20"/>
			<view width="177" height="352" rright="10" rtop="20" style="class: thickborder; class: litebg;">
				<image id="weapon-image" pad="1"/>
			</view>
		</view>
		<view>
			<text id="weapon-description" x="10" width=".45" rtop="20"/>
			<view width="202" height="152" rright="10" rtop="20" style="class: thickborder; class: darkbg;">
				<image id="weapon-image" pad="1"/>
			</view>
		</view>
		<view>
			<view width="177" height="352" rtop="10" style="class: thickborder; class: litebg; size-scaler: .7;" center="x">
				<image id="weapon-image" pad="1"/>
			</view>
			<text id="weapon-description" y="5" width=".9" rtop=".65" style="class: smalltext;" center="x"/>
		</view>
		<view>
			<view width="202" height="152" rtop="10" style="class: thickborder; class: darkbg;" center="x">
				<image id="weapon-image" pad="1"/>
			</view>
			<text id="weapon-description" width="200" rtop="180" center="x"/>
		</view>
	</stackview>
</panel>
