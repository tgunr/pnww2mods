<panel label="PLAYER INFO" id="player-info" manager="PlayerInfoManager" align="center">
	<body x="15" height=".46" rright="15" rtop="20"/>
	<view x="15" height=".46" y="15" rright="15" style="layout: v; vpad: 1;">
		<caption id="player-header" height="15" label="YOUR SCORE - #17099 obj_doggreen" style="class: litebg;"/>
		
		<view height="15" style="layout: h; class: litebg; vpad: 5;">
			<caption id="player-callsign" width=".75" label="ramp"/>
			<caption id="player-rank" width=".25" label="rank 1"/>
		</view>
		
		<view height="15" style="layout: h; class: litebg; vpad: 5;">
			<caption width=".75" label="kills:"/>
			<caption id="player-kills" width=".25" label="0"/>
		</view>
		
		<view height="15" style="layout: h; class: litebg;">
			<caption width=".75" label="kills streak:"/>
			<caption id="player-killstreak" width=".25" label="0"/>
		</view>
		
		<view height="15" style="layout: h; class: litebg;">
			<caption width=".75" label="deaths:"/>
			<caption id="player-deaths" width=".25" label="0"/>
		</view>
		
		<view height="15" style="layout: h; class: litebg; vpad: 5;">
			<caption width=".75"/>
			<caption width=".25" label="Points"/>
		</view>
		
		<view height="15" style="layout: h; class: litebg; vpad: 10;">
			<caption width=".75" label="objective points:"/>
			<caption id="player-obj-points" width=".25" label="0"/>
		</view>
		
		<view height="15" style="layout: h; class: litebg;">
			<caption width=".75" label="bonus points:"/>
			<caption id="player-bon-points" width=".25" label="0"/>
		</view>
		
		<view height="15" style="layout: h; class: litebg; vpad: 10;">
			<caption width=".75" label="score:"/>
			<caption id="player-score" width=".25" label="0"/>
		</view>
		
		<view height="15" style="layout: h; class: litebg; vpad: 10;">
			<caption width=".5" label="last achievement:"/>
			<caption id="player-ding" width=".5" label="0" align="right"/>
		</view>
		
	</view>
</panel>
