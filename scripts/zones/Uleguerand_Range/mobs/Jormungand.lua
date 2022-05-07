-----------------------------------
-- Area: Uleguerand Range
--  HNM: Jormungand
-- MobID: 16797969
--Pos: -204 -176 133
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    mob:SetMobSkillAttack(0) -- resetting so it doesn't respawn in flight mode.
    mob:AnimationSub(0) -- subanim 0 is only used when it spawns until first flight.
	mob:setLocalVar("[rage]timer", 1200) -- 20 minutes	
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 100) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	mob:addMod(tpz.mod.ATT, 300)	
	mob:addMod(tpz.mod.MATT, 50)
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.EVA, 80)
	mob:addMod(tpz.mod.MEVA, 80)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 300)
	mob:addMod(tpz.mod.REFRESH, 50)
	mob:addMod(tpz.mod.REGAIN, 20)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 8)
end

function onMobFight(mob, target)

	if mob:AnimationSub() == 1
		then mob:setMobMod(tpz.mobMod.DRAW_IN, 0)
	elseif mob:AnimationSub() == 0
		then mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
	end

    if (mob:hasStatusEffect(tpz.effect.BLOOD_WEAPON) == false and mob:actionQueueEmpty() == true) then
        local changeTime = mob:getLocalVar("changeTime")
        local twohourTime = mob:getLocalVar("twohourTime")

        if (twohourTime == 0) then
            twohourTime = math.random(8, 14)
            mob:setLocalVar("twohourTime", twohourTime)
        end

        if (mob:AnimationSub() == 2 and mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(695)
            mob:setLocalVar("twohourTime", (mob:getBattleTime()/15)+20)
        elseif (mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1)
            mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
            mob:SetMobSkillAttack(732)
            -- and record the time this phase was started
            mob:setLocalVar("changeTime", mob:getBattleTime())
        -- subanimation 1 is flight, so check if he should land
        elseif (mob:AnimationSub() == 1 and
                mob:getBattleTime() - changeTime > 30) then
            mob:useMobAbility(1292)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        -- subanimation 2 is grounded mode, so check if he should take off
        elseif (mob:AnimationSub() == 2 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1)
            mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
            mob:SetMobSkillAttack(732)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    end
end

function onMobWeaponSkill(target, mob, skill)
    if (skill:getID() == 1296 and mob:getHPP() <= 30) then
        local roarCounter = mob:getLocalVar("roarCounter")

        roarCounter = roarCounter +1
        mob:setLocalVar("roarCounter", roarCounter)

        if (roarCounter > 2) then
            mob:setLocalVar("roarCounter", 0)
        else
            mob:useMobAbility(1296)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.WORLD_SERPENT_SLAYER)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    -- mob:setRespawnTime(math.random(72000, 86400)) -- 3 to 5 days
end