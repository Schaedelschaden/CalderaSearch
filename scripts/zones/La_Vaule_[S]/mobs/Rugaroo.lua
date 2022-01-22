-----------------------------------
-- Area: La Vaule [S]
--  Mob: Rugaroo
-- ID: 17125665
-- POS: 18 0 -260
-- Note: Volte Armor HNM
-----------------------------------
local ID = require("scripts/zones/La_Vaule_[S]/IDs")
mixins = {require("scripts/mixins/families/gnole"),
		  require("scripts/mixins/job_special"),
		  require("scripts/mixins/rage")}
-----------------------------------

function onMobInitialize( mob )
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
	mob:AnimationSub(1)
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
	mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 80) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.BLINDRES, 50) -- Resistance to Poison	
	mob:addMod(tpz.mod.ATT, 300)	
	mob:addMod(tpz.mod.DEF, 700)
	mob:addMod(tpz.mod.EVA, 130)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MATT, 200)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 500)
	mob:addMod(tpz.mod.REGAIN, 100)
	-- mob:addMod(tpz.mod.DOUBLE_ATTACK, 5)
	-- mob:addMod(tpz.mod.TRIPLE_ATTACK, 10)
	mob:addMod(tpz.mod.FASTCAST, 60)
	mob:setMod(tpz.mod.COUNTER, 15)
	mob:setDelay(3000)
end

function onMobFight(mob)
	mob:setDelay(3000)
    -- local isBusy = false
	-- local has2Hrd = mob:getLocalVar("has2Hrd")
	-- local act = mob:getCurrentAction()

   	-- if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		-- mob:useMobAbility(695)
		-- mob:setLocalVar("has2Hrd", 1)
	-- end
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = math.random(90, 110)
	params.chance = 50

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENLIGHT, params)
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end