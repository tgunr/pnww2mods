<window id="ra" x="0" y="0" width="1024" height="768" viewportwidth="1024" viewportheight="768"
	aspectalign="center" manager="RAScreen">
	<include file="lib/common.uixml"/>
	<button id="lobby-button" label="LOBBY" x="10" rtop="10" onclick="window.mgr.DoLobby()" style="class: button.small;"/>
	<button id="quit-button" label="QUIT" rright="10" rtop="10" onclick="window.mgr.DoQuit()" style="class: button.small;"/>
	<button id="prefs-button" label="PREFS" rright="150" rtop="10" onclick="window.mgr.DoPrefs()" style="class: button.small;"/>
	<body x="10" y="90" rtop="125" rright="10" aspectlimit="width" center="x"/>
</window>
