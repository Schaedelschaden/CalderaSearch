-----------------------------------
-- Ability: Overdrive
-- Augments the fighting ability of your automaton to its maximum level.
-- Obtained: Puppetmaster Level 1
-- Recast Time: 1:00:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:getObjType() == tpz.objType.MOB then
        return 0, 0
    elseif not player:getPet() then
        return tpz.msg.basic.REQUIRES_A_PET, 0
    elseif not player:getPetID() or not (player:getPetID() >= 69 and player:getPetID() <= 72) then
        return tpz.msg.basic.NO_EFFECT_ON_PET, 0
    else
        return 0, 0
    end
end

function onUseAbility(player,target,ability)
    if player:getObjType() == tpz.objType.MOB then
        return tpz.msg.basic.USES
    else    
        player:addStatusEffect(tpz.effect.OVERDRIVE, 0, 0, 180)
	
        return tpz.effect.OVERDRIVE
    end
end