-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Tiamat
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    mob:SetMobSkillAttack(0) -- resetting so it doesn't respawn in flight mode.
    mob:AnimationSub(0) -- subanim 0 is only used when it spawns until first flight.
	mob:setLocalVar("[rage]timer", 1800) -- 30 minutes
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 100) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	mob:addMod(tpz.mod.ATT, 700)	
	mob:addMod(tpz.mod.DEF, 1000)
	mob:addMod(tpz.mod.EVA, 80)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 500)
	mob:addMod(tpz.mod.REFRESH, 200)
	mob:addMod(tpz.mod.REGAIN, 100)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
end

function onMobFight(mob, target)

	if mob:AnimationSub() == 1
		then mob:setMobMod(tpz.mobMod.DRAW_IN, 0)
	elseif mob:AnimationSub() == 0
		then mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
	end

    -- Gains a large attack boost when health is under 25% which cannot be Dispelled.
    if (mob:getHP() < ((mob:getMaxHP() / 10) * 2.5)) then
        if (mob:hasStatusEffect(tpz.effect.ATTACK_BOOST) == false) then
            mob:addStatusEffect(tpz.effect.ATTACK_BOOST, 75, 0, 0)
            mob:getStatusEffect(tpz.effect.ATTACK_BOOST):setFlag(tpz.effectFlag.DEATH)
        end
    end

    if (mob:hasStatusEffect(tpz.effect.MIGHTY_STRIKES) == false and mob:actionQueueEmpty() == true) then
        local changeTime = mob:getLocalVar("changeTime")
        local twohourTime = mob:getLocalVar("twohourTime")
        local changeHP = mob:getLocalVar("changeHP")

        if (twohourTime == 0) then
            twohourTime = math.random(8, 14)
            mob:setLocalVar("twohourTime", twohourTime)
        end

        if (mob:AnimationSub() == 2 and mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(688)
            mob:setLocalVar("twohourTime", math.random((mob:getBattleTime()/15)+4, (mob:getBattleTime()/15)+8))
        elseif (mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1)
            mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
            mob:SetMobSkillAttack(730)
            --and record the time and HP this phase was started
            mob:setLocalVar("changeTime", mob:getBattleTime())
            mob:setLocalVar("changeHP", mob:getHP()/100)
        -- subanimation 1 is flight, so check if she should land
        elseif (mob:AnimationSub() == 1 and (mob:getHP()/100 <= changeHP - 10 or
                mob:getBattleTime() - changeTime > 120)) then
            mob:useMobAbility(1282)
            mob:setLocalVar("changeTime", mob:getBattleTime())
            mob:setLocalVar("changeHP", mob:getHP()/100)
        -- subanimation 2 is grounded mode, so check if she should take off
        elseif (mob:AnimationSub() == 2 and (mob:getHP()/100 <= changeHP - 10 or
                mob:getBattleTime() - changeTime > 120)) then
            mob:AnimationSub(1)
            mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
            mob:SetMobSkillAttack(730)
            mob:setLocalVar("changeTime", mob:getBattleTime())
            mob:setLocalVar("changeHP", mob:getHP()/100)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.TIAMAT_TROUNCER)
	
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
