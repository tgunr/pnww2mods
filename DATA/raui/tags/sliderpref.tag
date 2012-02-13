<view id="sliderpref" manager="SliderPref">
	<caption id="label" label="Test" x="0" rtop="0"/>
	<view id="options" width="200"  rright="0" rtop="0">
		<caption label="${widgets.prefs.less}" x="0" width="40" rtop="0" acceptmouseclick="false"/>
		<slider id="slider" width="120"  rtop="0" minvalue="0" maxvalue="1" center="x" onclick="this.mgr.OnClick(this.value)"/>
		<caption label="${widgets.prefs.more}" width="40" rtop="0" rright="10" align="right" acceptmouseclick="false"/>
	</view>
</view>

