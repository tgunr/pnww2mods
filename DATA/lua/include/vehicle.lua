
-- imported game libs

game.LoadLib("vehicle");
game.LoadLib("wwii");
game.LoadLib("player");

-- define additional constants here
-- they aren't defined in code

-- vehicle categories
vehicle.VEH_CATEGORY_NONE = 0;
vehicle.VEH_CATEGORY_AIR = 1;
vehicle.VEH_CATEGORY_GROUND = 2;
vehicle.VEH_CATEGORY_SEA = 3;
vehicle.VEH_CATEGORY_INFANTRY = 4;
vehicle.VEH_CATEGORY_MUNITIONS = 5;
vehicle.VEH_MAXCATEGORY = 6;
	
-- vehicle classes
vehicle.VEH_CLASS_NONE = 0;
vehicle.VEH_CLASS_BOMBER = 1;
vehicle.VEH_CLASS_FIGHTER = 2;
vehicle.VEH_CLASS_GM = 3;
vehicle.VEH_CLASS_TANK = 4;
vehicle.VEH_CLASS_ARTILLERY = 5;
vehicle.VEH_CLASS_TRUCK = 6;
vehicle.VEH_CLASS_GUN = 7;
vehicle.VEH_CLASS_CREW = 8;
vehicle.VEH_CLASS_TROOP = 9;
vehicle.VEH_CLASS_AIRBOMB = 10;
vehicle.VEH_CLASS_HEAVYINFANTRY = 11;
vehicle.VEH_CLASS_RIVERINE = 12;
vehicle.VEH_CLASS_SEA = 13;
vehicle.VEH_CLASS_PARA = 14;
vehicle.VEH_MAXCLASS = 15;

-- wildcard
vehicle.VEH_ANY = 0;

vehicle.vehClassToCategory = function(c)
	if(c == 0) then return vehicle.VEH_CATEGORY_NONE;
	elseif(c == 1) then return vehicle.VEH_CATEGORY_AIR;
	elseif(c == 2) then return vehicle.VEH_CATEGORY_AIR;
	elseif(c == 3) then return vehicle.VEH_CATEGORY_NONE;
	elseif(c == 4) then return vehicle.VEH_CATEGORY_GROUND;
	elseif(c == 5) then return vehicle.VEH_CATEGORY_GROUND;
	elseif(c == 6) then return vehicle.VEH_CATEGORY_GROUND;
	elseif(c == 7) then return vehicle.VEH_CATEGORY_GROUND;
	elseif(c == 8) then return vehicle.VEH_CATEGORY_INFANTRY;
	elseif(c == 9) then return vehicle.VEH_CATEGORY_INFANTRY;
	elseif(c == 10) then return vehicle.VEH_CATEGORY_MUNITIONS;
	elseif(c == 11) then return vehicle.VEH_CATEGORY_INFANTRY;
	elseif(c == 12) then return vehicle.VEH_CATEGORY_SEA;
	elseif(c == 13) then return vehicle.VEH_CATEGORY_SEA;
	elseif(c == 14) then return vehicle.VEH_CATEGORY_INFANTRY;
	end
end

vehicle.vehSpecByID = function(id)
	return vehicle.vehTypeGetById(id).WeaponSpec;
end

vehicle.vehTypeGetByRequires = function(req)
	if(req == nil) then
		return nil
	end
	
	local spec = {};
	
	-- set some defaults
	spec.type = 1;
	spec.country = player.playerGetPlayer():GetCountry();
	
	-- refine the defaults
	spec.type 		= (req.wDefault) and req.wDefault or spec.type;
	spec.country 	= (spec.country > 0) and spec.country or wwii.WWII_ENGLAND;
	
	-- check the requires table
	spec.country 	= (req.wCountry > 0) and req.wCountry or spec.country;
	spec.category 	= (req.wCategory > 0) and req.wCategory or vehicle.VEH_CATEGORY_INFANTRY;
	spec.class 		= (req.wClass > 0) and req.wClass or vehicle.VEH_CLASS_TROOP;
	spec.type 		= (req.wType > 0) and req.wType or spec.type;
	
	-- create a spec
	local wspec 	= vehicle.weapCreateSpec(spec.country, spec.category, spec.class, spec.type);
	
	-- return the vehicle type
	return vehicle.vehTypeGetBySpec(wspec);
end

