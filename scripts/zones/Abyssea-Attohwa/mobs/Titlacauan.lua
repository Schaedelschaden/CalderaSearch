-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Titlacauan
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	
	
end

function onMobFight(mob, target)
	
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 245) then -- Drain
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
    end
end

function onMobDeath(mob, player, isKiller)
	
end