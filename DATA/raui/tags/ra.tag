<window id="ra" x="0" y="0" width="1024" height="768" viewportwidth="1024" viewportheight="768"
	aspectalign="center" manager="RAScreen">
	<include file="lib/common.uixml"/>
	<button id="back" label="LOBBY    " x="10" rtop="10" onclick="window.mgr.DoLobby()" align="right"/>
	<button id="quit" label="  QUIT" rright="10" rtop="10" onclick="window.mgr.DoQuit()" align="left"/>
	<button id="prefs" label="  PREFS" rright="10" rtop="30" onclick="window.mgr.DoPrefs()" align="left"/>
	<body x="10" y="90" rtop="125" rright="10" aspectlimit="width" center="x"/>
</window>
