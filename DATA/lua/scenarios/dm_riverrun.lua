
-- run our base gameplay script
game.RunScript("scenarios/base/deathmatch.lua");

-- after content is initialized, you can override stuff in state.content if needed

-- set tutorial state here
state.name = "scenario.dm_riverrun";
state.contentScript = "scenarios/content/dm_riverrun.lua";

-- now let's load our content
-- game.RunScript(state.contentScript);

-- set our initial tutorial state
tutorial.SetState(state);

