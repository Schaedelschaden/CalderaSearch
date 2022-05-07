-----------------------------------
-- Area: Beadeaux [S]
--  Mob: Bres
-- ID: 17154357
-- !pos 180 40 13 92
-- Note: Volte Armor HNM
-----------------------------------
local ID = require("scripts/zones/Beadeaux_[S]/IDs")
mixins =
{
	require("scripts/mixins/job_special"),
	require("scripts/mixins/rage")
}
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize( mob )
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
	mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	mob:addMod(tpz.mod.ATT, 500)	
	mob:addMod(tpz.mod.DEF, 700)
	mob:addMod(tpz.mod.EVA, 130)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 500)
	-- mob:addMod(tpz.mod.REGAIN, 100)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 20)
	mob:addMod(tpz.mod.COUNTER, 30)
	mob:addMod(tpz.mod.COUNTER_DMG, 150)
	mob:setDelay(2250)
end

function onMobFight(mob)
	-- mob:setDelay(2250)
    local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()

   	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(690)
		mob:setLocalVar("has2Hrd", 1)
	end
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 100
	params.chance = 75

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDARK, params)
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
	mob:setRespawnTime(72000)
end