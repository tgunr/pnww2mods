
-- imported game libs
game.runscript("include/ui.lua");

-- test scripts

ui.uiPlaySound("sounds/bell.wav", 1, 1);
ui.chatprint("Hello, Im the test lua script.");
ui.conprint("Hello, Im the test lua script.");
ui.runjs("doForward();");
