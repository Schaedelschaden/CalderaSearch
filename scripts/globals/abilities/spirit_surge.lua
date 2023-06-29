-----------------------------------
-- Ability: Spirit Surge
-- Adds your wyvern's strength to your own.
-- Obtained: Dragoon Level 1
-- Recast Time: 1:00:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    -- The wyvern must be present in order to use Spirit Surge
    if player:getPet() == nil then
        return tpz.msg.basic.REQUIRES_A_PET,0
    else
        return 0,0
    end
end

function onUseAbility(player, target, ability)
    local pet = player:getPet()
    -- Spirit Surge increases dragoon's MAX HP increases by 25% of wyvern MaxHP
    -- bg wiki says 25% ffxiclopedia says 15%, going with 25 for now
    local mhp_boost = pet:getMaxHP() * 0.25
    -- Dragoon gets all of wyverns TP when using Spirit Surge
    local petTP    = pet:getTP()
    local strBoost = 0

    player:addTP(petTP) --add pet TP to dragoon
    pet:delTP(petTP) -- remove TP from pet

    -- Spirit Surge increases dragoon's Strength
    if player:getMainJob() == tpz.job.DRG then
        strBoost = 1 + player:getMainLvl() / 5 -- Use Mainjob Lvl
    else
        strBoost = 1 + player:getSubLvl() / 5  -- Use Subjob Lvl
    end

    local duration = 60

    player:despawnPet()
    -- All Jump recast times are reset
    player:resetRecast(158) -- Jump
    player:resetRecast(159) -- High Jump
    player:resetRecast(160) -- Super Jump
	player:resetRecast(166) -- Spirit Jump
    player:resetRecast(167) -- Soul Jump

    player:addStatusEffect(tpz.effect.SPIRIT_SURGE, mhp_boost, 0, duration, 0, strBoost)
end
