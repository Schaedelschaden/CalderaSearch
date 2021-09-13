-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Lacovie
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:setLocalVar("INVINCIBLE", 0)
	
	mob:addListener("EFFECT_GAIN", "INVINCIBLE_GAIN", function(mob, effect)
		if (effect:getType() == tpz.effect.INVINCIBLE) then
			mob:addStatusEffectEx(tpz.effect.MANAFONT, 0, 1, 0, 35)
		end
    end)
	
	mob:addListener("EFFECT_LOSE", "INVINCIBLE_LOSE", function(mob, effect)
		if (effect:getType() == tpz.effect.INVINCIBLE) then
			mob:delStatusEffectSilent(tpz.effect.MANAFONT)
		end
    end)
end

function onMobFight(mob, target)
	local hpp = mob:getHPP()
	local invincible = mob:getLocalVar("INVINCIBLE")
	
	if (hpp <= 85 and invincible == 0) then
		mob:useMobAbility(694)
		mob:setLocalVar("INVINCIBLE", 1)
	elseif (hpp <= 70 and invincible == 1) then
		mob:useMobAbility(694)
		mob:setLocalVar("INVINCIBLE", 2)
	elseif (hpp <= 55 and invincible == 2) then
		mob:useMobAbility(694)
		mob:setLocalVar("INVINCIBLE", 3)
	elseif (hpp <= 40 and invincible == 3) then
		mob:useMobAbility(694)
		mob:setLocalVar("INVINCIBLE", 4)
		
		if (math.random(1, 100) <= 50) then
			mob:resetEnmity(target)
		end
	elseif (hpp <= 25 and invincible == 4) then
		mob:useMobAbility(694)
		mob:setLocalVar("INVINCIBLE", 5)
		mob:resetEnmity(target)
	elseif (hpp <= 10 and invincible == 5) then
		mob:useMobAbility(694)
		mob:setLocalVar("INVINCIBLE", 6)
		mob:resetEnmity(target)
	end
end

function onAdditionalEffect(mob, target, damage)
	local hpp = mob:getHPP()
	local params = {}
		params.chance = 100
		params.power = 65 + ((100 - hpp) * 1.4)
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE, params)
end

function onSpellPrecast(mob, spell)
    if (mob:hasStatusEffect(tpz.effect.INVINCIBLE)) then
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
    end
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	mob:removeListener("INVINCIBLE_GAIN")
	mob:removeListener("INVINCIBLE_LOSE")
end