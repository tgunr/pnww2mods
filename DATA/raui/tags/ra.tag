<window id="ra" x="0" y="0" width="1024" height="768" viewportwidth="1024" viewportheight="768"
	aspectalign="center" manager="RAScreen">
	<include file="lib/common.uixml"/>
	<button id="smallbutton" label="LOBBY" x="10" rtop="10" onclick="window.mgr.DoLobby()"/>
	<button id="smallbutton" label="QUIT" rright="10" rtop="10" onclick="window.mgr.DoQuit()"/>
	<button id="smallbutton" label="PREFS" rright="150" rtop="10" onclick="window.mgr.DoPrefs()"/>
	<body x="10" y="90" rtop="125" rright="10" aspectlimit="width" center="x"/>
</window>
