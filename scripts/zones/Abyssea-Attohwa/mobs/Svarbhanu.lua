-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Svarbhanu
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
end

function onMobFight(mob, target)
	
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 286) then -- Addle
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
    end
end

function onMobDeath(mob, player, isKiller)
	
end