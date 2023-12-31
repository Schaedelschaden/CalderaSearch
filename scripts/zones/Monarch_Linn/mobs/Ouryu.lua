-----------------------------------
-- Area: Monarch Linn
--  Mob: Ouryu
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    mob:SetMobSkillAttack(0) -- resetting so it doesn't respawn in flight mode.
    mob:AnimationSub(0) -- subanim 0 is only used when it spawns until first flight.
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 300) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	mob:addMod(tpz.mod.ATT, 400)
	mob:addMod(tpz.mod.MATT, 75)	
	mob:addMod(tpz.mod.DEF, 500)
	mob:addMod(tpz.mod.EVA, 100)
	mob:addMod(tpz.mod.REGEN, 100)
	mob:addMod(tpz.mod.REFRESH, 200)
	mob:addMod(tpz.mod.REGAIN, 100)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 15)
    mob:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, -25)
end

function onMobFight(mob, target)

    -- local bf = mob:getBattlefield()
    -- if bf:getID() == 961 and mob:getHPP() < 30 then
        -- bf:win()
        -- return
    -- end

    if (mob:hasStatusEffect(tpz.effect.INVINCIBLE) == false and mob:actionQueueEmpty() == true) then
        local changeTime = mob:getLocalVar("changeTime")
        local twohourTime = mob:getLocalVar("twohourTime")

        if (twohourTime == 0) then
            twohourTime = math.random(8, 14)
            mob:setLocalVar("twohourTime", twohourTime)
        end

        if (mob:AnimationSub() == 2 and mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(694)
            mob:setLocalVar("twohourTime", math.random((mob:getBattleTime()/15)+12, (mob:getBattleTime()/15)+16))
        elseif (mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1)
            mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
            mob:SetMobSkillAttack(731)
            --and record the time this phase was started
            mob:setLocalVar("changeTime", mob:getBattleTime())
        -- subanimation 1 is flight, so check if he should land
        elseif (mob:AnimationSub() == 1 and
                mob:getBattleTime() - changeTime > 120) then
            mob:useMobAbility(1302)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        -- subanimation 2 is grounded mode, so check if he should take off
        elseif (mob:AnimationSub() == 2 and
                mob:getBattleTime() - changeTime > 120) then
            mob:AnimationSub(1)
            mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
            mob:SetMobSkillAttack(731)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    end
end

function onMobDeath(mob, player, isKiller)

    player:addTitle(tpz.title.MIST_MELTER)

end