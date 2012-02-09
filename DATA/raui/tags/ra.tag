<window id="ra" x="0" y="0" width="1024" height="768" viewportwidth="1024" viewportheight="768"
	aspectalign="center" manager="RAScreen">
	<include file="lib/common.uixml"/>
	<view width="75" height="60" rright="10" rtop="10" style="layout: vertical; vpad: 10;">
		<button id="quit" label="  QUIT" rright="0" onclick="window.mgr.DoQuit()" align="left"/>
		<button id="prefs" label="  PREFS" rright="0" onclick="window.mgr.DoPrefs()" align="left"/>
	</view>
	<body x="10" y="90" rtop="125" rright="10" aspectlimit="width" center="x"/>
</window>
