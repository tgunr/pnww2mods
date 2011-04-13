
-- run our base gameplay script
game.RunScript("scenarios/base/deathmatch.lua");

-- after content is initialized, you can override stuff in state.content if needed

-- set tutorial state here
state.name = "scenario.dm_manhay";
state.contentScript = "scenarios/content/dm_manhay.lua";

-- now let's load our content
-- game.RunScript(state.contentScript);

-- set our initial tutorial state
tutorial.SetState(state);

