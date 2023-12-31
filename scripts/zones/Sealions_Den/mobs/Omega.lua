-----------------------------------
-- Area: Sealions Den
--  Mob: Omega
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs")
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
	mob:addMod(tpz.mod.ACC, 100)
	mob:setMod(tpz.mod.MACC, 850)
	mob:addMod(tpz.mod.EVA, 150)
--	mob:addMod(tpz.mod.MEVA, 150)
--	mob:addMod(tpz.mod.MDEF, 150)
	mob:addMod(tpz.mod.STORETP, 50)
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.REGEN, 250)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
end

function onMobFight(mob, target)
    -- Gains regain at under 25% HP
    if mob:getHPP() < 25 and not mob:hasStatusEffect(tpz.effect.REGAIN) then
        mob:addStatusEffect(tpz.effect.REGAIN, 5, 3, 0)
        mob:getStatusEffect(tpz.effect.REGAIN):setFlag(tpz.effectFlag.DEATH)
    end
end

function onAdditionalEffect(mob, target, damage)
	local params = {}
		params.duration = math.random(5,8)

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, params)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.OMEGA_OSTRACIZER)
    player:startEvent(11)
end

function onEventFinish(player, csid, option)
    if csid == 11 then
        local inst = player:getBattlefield():getArea()

        if inst >= 1 and inst <= 3 then
            -- players are healed in between fights, but their TP is set to 0
            player:setHP(player:getMaxHP())
            player:setMP(player:getMaxMP())
            player:setTP(0)
            player:setLocalVar("[OTBF]cs", 2)

            -- move player to instance
            if inst == 1 then
                player:setPos(-779, -103, -80)
            elseif inst == 2 then
                player:setPos(-140, -23, -440)
            elseif inst == 3 then
                player:setPos(499, 56, -802)
            end
        end
    end
end