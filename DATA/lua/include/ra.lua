Include("scenario");

ra = {}
RAInterface = { __index = scenario }

-- our game interface for underlying scenario calls
scenario.game = ra;

-- fallback to the scenario namespace if we don't override
-- any default functionality
setmetatable(ra, RAInterface);

