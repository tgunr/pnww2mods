<view id="boolpref" manager="BoolPref">
	<caption id="label" label="Test" x="0" rtop="0"/>
	<view id="options" width="150"  rright="0" rtop="0">
		<radiobutton id="option-off" label="${widgets.prefs.disabled}" x="0" width=".5" onclick="this.mgr.OnClick(false)"/>
		<radiobutton id="option-on" label="${widgets.prefs.enabled}" width=".5" rright="0" onclick="this.mgr.OnClick(true)"/>/>
	</view>
</view>

