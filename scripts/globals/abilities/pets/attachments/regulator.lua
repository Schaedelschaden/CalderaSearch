-----------------------------------
-- Attachment: Regulator
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:setLocalVar("regulator", pet:getLocalVar("regulator") + 1)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_REGULATOR", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(tpz.effect.DARK_MANEUVER) > 0 and automaton:getLocalVar("absorb_attri") < VanadielTime() then
            automaton:useMobAbility(3485, automaton)
        end
    end)
end

function onUnequip(pet)
    pet:setLocalVar("regulator", pet:getLocalVar("regulator") - 1)
    pet:removeListener("ATTACHMENT_REGULATOR")
end

function onManeuverGain(pet, maneuvers)
	
end

function onManeuverLose(pet, maneuvers)
	
end