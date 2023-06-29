-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Vee Ladu the Titterer
-- ID: 17183035
-- POS: -57 -1 -28
-- Note: Volte Armor HNM
-- TODO: summons up to four low-HP copies of itself when it casts utsusemi: ni
-----------------------------------
mixins = {require("scripts/mixins/job_special"),
		  require("scripts/mixins/rage")}
-----------------------------------

function onMobInitialize( mob )
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	mob:addMod(tpz.mod.PARALYZERES, 60) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 80) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	mob:addMod(tpz.mod.ATT, 500)	
	mob:addMod(tpz.mod.DEF, 700)
	mob:addMod(tpz.mod.EVA, 130)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MATT, 200)
	-- mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 500)
	mob:addMod(tpz.mod.REGAIN, 100)
	-- mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 10)
	mob:addMod(tpz.mod.FASTCAST, 60)
	mob:setMod(tpz.mod.UTSUSEMI_BONUS, 15)
end

function onMobRoam(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobFight(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
	-- mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
   	-- if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		-- mob:useMobAbility(690)
		-- mob:setLocalVar("has2Hrd", 1)
	-- end
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = math.random(65, 85)
	params.chance = 60

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, params)
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName = mobName:sub(1, 18)
	local KillCounter = player:getCharVar("KillCounter_"..shortName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    player:addSpell(1003, true, true)
end

function onMobDespawn(mob)
	mob:setRespawnTime(21600)
end