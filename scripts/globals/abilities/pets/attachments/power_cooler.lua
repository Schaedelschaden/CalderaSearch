-----------------------------------
-- Attachment: Power Cooler
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)	
	pet:addListener("MAGIC_START", "AUTO_POWER_COOLER_START", function(pet, spell, action)
		local master = pet:getMaster()
		local startMP = pet:getMP()
        pet:setLocalVar("power_cooler_start_mp", startMP)
--		printf("power_cooler.lua Magic Start Listener PET MP: [%i]", startMP)
    end)
	
    pet:addListener("MAGIC_STATE_EXIT", "AUTO_POWER_COOLER_END", function(pet, spell)
		local master = pet:getMaster()
		local startMP = pet:getLocalVar("power_cooler_start_mp")
		local endMP = pet:getMP()
		local returnMP = startMP - endMP
        local maneuvers = master:countEffect(tpz.effect.ICE_MANEUVER)
        if maneuvers == 0 then
			returnMP = returnMP * 0.1
			pet:setMP(endMP + returnMP)
		elseif maneuvers == 1 then
            returnMP = returnMP * 0.2
			pet:setMP(endMP + returnMP)
        elseif maneuvers == 2 then
            returnMP = returnMP * 0.35
			pet:setMP(endMP + returnMP)
        elseif maneuvers == 3 then
            returnMP = returnMP * 0.5
			pet:setMP(endMP + returnMP)
        else
            return
        end
--		printf("power_cooler.lua Magic End Listener PET MP: [%i]  RETURN MP: [%i]", endMP, returnMP)
    end)
end

function onUnequip(pet)
    pet:removeListener("AUTO_POWER_COOLER_START")
    pet:removeListener("AUTO_POWER_COOLER_END")
end

function onManeuverGain(pet, maneuvers)
	
end

function onManeuverLose(pet, maneuvers)
	
end