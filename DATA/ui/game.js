
function gameLoadCPS()
{
	allcps = game.cps;
	
	used 	= new Array();
	regex 	= eval("/(bridge|flak)/i");
	
	for(i = 0; i < allcps.length; i++)
	{
		cp = allcps[i];
		
		if(cp.stratclass == "cp" && !cp.name.match(regex))
			used[used.length] = cp;
	}
	
	return used.sort(gameSortCPS);
}

function gameSortCPS(a, b)
{
	if(a.name.toLowerCase() > b.name.toLowerCase())
		return 1;
	else if(a.name.toLowerCase() < b.name.toLowerCase())
		return -1;
	
	return 0;
}

function DoOK(message)
{
	var popup = game.load("ok");
	popup.initPopup(message);
}

function DoConfirm(message)
{
	var popup = game.load("confirm");
	popup.initPopup(message);
}

function DoEdit(key, title, val)
{
	var editor = game.findview("edit");
	
	if(editor == null)
		editor = game.load("edit");
	
	editor.initEditor(key, title, val);
}

game.globals		= new Object();
game.globals.cps 	= gameLoadCPS();
