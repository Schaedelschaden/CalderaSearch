-----------------------------------
-- Area: West Sarutabaruta
--   NM: Tom Tit Tat
-- MobID: 17248468
-----------------------------------
mixins =
{
	require("scripts/mixins/rage")
}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
    mob:addMod(tpz.mod.PARALYZERES, 70)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 70)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 250)
	mob:addMod(tpz.mod.EVA, 175)
	mob:addMod(tpz.mod.DEF, 375)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.STR, 120)
    mob:addMod(tpz.mod.DEX, 160)
    mob:addMod(tpz.mod.AGI, 140)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
    mob:addMod(tpz.mod.COUNTER, 30)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, 20)
    mob:setLocalVar("WS_HIT", 0)
    mob:setLocalVar("MAG_HIT", 0)
    mob:addStatusEffectEx(tpz.effect.BLOOD_WEAPON, tpz.effect.BLOOD_WEAPON, 1, 0, 0)
    mob:addStatusEffectEx(tpz.effect.MIGHTY_STRIKES, tpz.effect.MIGHTY_STRIKES, 1, 0, 0)
    mob:addStatusEffectEx(tpz.effect.HUNDRED_FISTS, tpz.effect.HUNDRED_FISTS, 1, 0, 0)
    
    mob:addListener("WEAPONSKILL_TAKE", "WEAPONSKILL_TAKEN", function(target, user, wsid, tp, action)
        if target:hasStatusEffect(tpz.effect.MIGHTY_STRIKES) then
            target:setLocalVar("WS_HIT", 1)
            target:setLocalVar("MAG_HIT", 0)
        end
    end)

    mob:addListener("MAGIC_TAKE", "MAGIC_TAKEN", function(target, caster, spell)
        if target:hasStatusEffect(tpz.effect.BLOOD_WEAPON) then
            target:setLocalVar("MAG_HIT", 1)
            target:setLocalVar("WS_HIT", 0)
        end
    end)
    
    mob:addListener("ABILITY_TAKE", "ABILITY_TAKEN", function(target, user, ability, action)
        local rnd = math.random()

		if rnd < 0.05 then
            target:delStatusEffectSilent(tpz.effect.HUNDRED_FISTS)
            target:weaknessTrigger(2)

            target:timer(30000, function(mobArg)
                mobArg:addStatusEffectEx(tpz.effect.HUNDRED_FISTS, tpz.effect.HUNDRED_FISTS, 1, 0, 0)
            end)
		else
		end
    end)
    
    mob:addListener("TAKE_DAMAGE", "DAMAGE_TAKEN", function(mobArg, amount, attacker, attackType, damageType)
        if mobArg:getLocalVar("WS_HIT") == 1 and amount >= 17500 and mobArg:hasStatusEffect(tpz.effect.MIGHTY_STRIKES) then
            mobArg:delStatusEffectSilent(tpz.effect.MIGHTY_STRIKES)
            mobArg:weaknessTrigger(0)

            mobArg:timer(30000, function(mobArg1)
                mobArg1:addStatusEffectEx(tpz.effect.MIGHTY_STRIKES, tpz.effect.MIGHTY_STRIKES, 1, 0, 0)
                --mobArg1:setLocalVar("WS_HIT", 0)
            end)
        elseif mobArg:getLocalVar("MAG_HIT") == 1 and amount >= 22500 and mobArg:hasStatusEffect(tpz.effect.BLOOD_WEAPON) then
            mobArg:delStatusEffectSilent(tpz.effect.BLOOD_WEAPON)
            mobArg:weaknessTrigger(1)
            mobArg:timer(30000, function(mobArg1)
                mobArg1:addStatusEffectEx(tpz.effect.BLOOD_WEAPON, tpz.effect.BLOOD_WEAPON, 1, 0, 0)
                --mobArg1:setLocalVar("WS_HIT", 0)
            end)
        end
        
        mobArg:setLocalVar("WS_HIT", 0)
        mobArg:setLocalVar("WS_HIT", 0)
    end)
    
end

function onMobFight(mob, target)
    -- mob:addMod(tpz.mod.MAIN_DMG_RATING, 20)
end

function onMobDespawn(mob)
    mob:removeListener("WEAPONSKILL_TAKEN")
    mob:removeListener("MAGIC_TAKEN")
    mob:removeListener("ABILITY_TAKEN")
    mob:removeListener("DAMAGE_TAKEN")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("WEAPONSKILL_TAKEN")
    mob:removeListener("MAGIC_TAKEN")
    mob:removeListener("ABILITY_TAKEN")
    mob:removeListener("DAMAGE_TAKEN")
    tpz.hunts.checkHunt(mob, player, 250)
end
