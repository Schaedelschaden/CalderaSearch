-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Aggressor Antlion
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.STUNRES, 100)
	mob:setMod(tpz.mod.PARALYZERES, 100)
	mob:setMod(tpz.mod.SLOWRES, 100)
	mob:setMod(tpz.mod.BLINDRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.PETRIFYRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mob, skillID)
		if (skillID == 2517) then -- Quake Blast
			-- Mandibular Bite, Sandblast, Venom Spray
			local mobskills = {279, 275, 277}
			local pickMobSkill = random(#mobskills)
			
			mob:useMobAbility(mobskills[pickMobSkill])
		end
    end)
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller)
	
end