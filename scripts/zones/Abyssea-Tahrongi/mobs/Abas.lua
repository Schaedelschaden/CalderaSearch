-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Abas
-----------------------------------

function onMobSpawn(mob)
	mob:addListener("WEAPONSKILL_STATE_EXIT", "TOXIC_SPIT_USED", function(mob, skillID)
		if (skillID == 515) then
			mob:addMod(tpz.mod.MATT, 300)
			mob:addMod(tpz.mod.MACC, 250)
			mob:setLocalVar("TOXIC_SPIT_USED", 1)
		end
    end)
	
	mob:addListener("MAGIC_STATE_EXIT", "MAGIC_USED", function(mob, spell, action)
		if (mob:getLocalVar("TOXIC_SPIT_USED") == 1) then
			mob:delMod(tpz.mod.MATT, 300)
			mob:delMod(tpz.mod.MACC, 250)
			mob:setLocalVar("TOXIC_SPIT_USED", 0)
		end
    end)
end

function onMobFight(mob)
	
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 214) then -- Flood
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(10)
    end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("TOXIC_SPIT_USED")
	mob:removeListener("MAGIC_USED")
end