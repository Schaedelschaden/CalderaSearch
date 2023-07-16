-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Blazing Eruca
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

	mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)

	mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 1, 0, 0)
    mob:getStatusEffect(tpz.effect.BLAZE_SPIKES):setFlag(tpz.effectFlag.DEATH)
	
	mob:addListener("WEAPONSKILL_STATE_ENTER", "MOBSKILL_START", function(mob, skill)
		mob:setLocalVar("PHYSICAL_ABSORB_TIMER", os.time())
		mob:setMod(tpz.mod.PHYS_ABSORB, 100)
		mob:addMod(tpz.mod.REGAIN, 10)
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_END", function(mob, skill)
		mob:setMod(tpz.mod.PHYS_ABSORB, 0)
    end)
	
	mob:addListener("MAGIC_START", "MAGIC_CASTING", function(mob, spell, action)
		mob:setLocalVar("MAGIC_ABSORB_TIMER", os.time())
		mob:setMod(tpz.mod.MAGIC_ABSORB, 100)
    end)
	
	mob:addListener("MAGIC_STATE_EXIT", "MAGIC_END", function(mob, spell)
		mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
    end)
end

function onMobFight(mob, target)
	if (os.time() - mob:getLocalVar("PHYSICAL_ABSORB_TIMER") >= 4) then
		mob:setMod(tpz.mod.PHYS_ABSORB, 0)
	end
	
	if (os.time() - mob:getLocalVar("MAGIC_ABSORB_TIMER") >= 4) then
		mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
	end
end

function onMobDisengage(mob)
    mob:setLocalVar("Phys_Absorb_Counter", 0)
    mob:setLocalVar("Magic_Absorb_Counter", 0)
end

function onSpikesDamage(mob, target, damage)
	local absorbedDamage = mob:getLocalVar("Phys_Absorb_Counter") + mob:getLocalVar("Magic_Absorb_Counter")
	local dmg = 50 + (absorbedDamage / 100)

    return tpz.subEffect.BLAZE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("MOBSKILL_START")
	mob:removeListener("MOBSKILL_END")
	mob:removeListener("MAGIC_CASTING")
	mob:removeListener("MAGIC_END")

    tpz.abyssea.kiOnMobDeath(mob, player)
end
