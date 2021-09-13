-----------------------------------
-- Area: Abyssea - Tahrongi
--   NM: Mictlantecuhtli
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.UDMGPHYS, 25)
	mob:setMod(tpz.mod.UDMGRANGE, 25)
	mob:setMod(tpz.mod.UDMGMAGIC, -50)
	mob:setMod(tpz.mod.DARK_AFFINITY_DMG, 100)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:setMod(tpz.mod.FASTCAST, 35)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 65)
	mob:setMod(tpz.mod.CRITHITRATE, 65)
	mob:speed(100)
	
	mob:addListener("WEAPONSKILL_STATE_ENTER", "MICTLANTECUHTLI_MOBSKILL_START", function(mob, skill)
        mob:setLocalVar("MICTLANTECUHTLI_PHYSICAL_ABSORB", 0)
		mob:setMod(tpz.mod.PHYS_ABSORB, 0)
		mob:setMod(tpz.mod.MAGIC_ABSORB, 100)
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "MICTLANTECUHTLI_MOBSKILL_END", function(mob, skill)
		mob:setMod(tpz.mod.PHYS_ABSORB, 100)
		mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
    end)
	
	mob:addListener("MAGIC_START", "MICTLANTECUHTLI_MAGIC_CASTING", function(mob, spell, action)
		mob:setLocalVar("MICTLANTECUHTLI_MAGIC_ABSORB", 0)
		mob:setMod(tpz.mod.PHYS_ABSORB, 0)
		mob:setMod(tpz.mod.MAGIC_ABSORB, 100)
    end)
	
	mob:addListener("MAGIC_STATE_EXIT", "MICTLANTECUHTLI_MAGIC_END", function(mob, spell)
		mob:setMod(tpz.mod.PHYS_ABSORB, 100)
		mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
    end)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("MICTLANTECUHTLI_MOBSKILL_START")
	mob:removeListener("MICTLANTECUHTLI_MOBSKILL_END")
	mob:removeListener("MICTLANTECUHTLI_MAGIC_CASTING")
	mob:removeListener("MICTLANTECUHTLI_MAGIC_END")
end