-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Lightning Wyvern
-- KSNM: Eye of the Storm
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.GRAVITYRES, 35)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
	mob:setMod(tpz.mod.ATT, 400)
    mob:setMod(tpz.mod.ACC, 400)
    mob:setMod(tpz.mod.EVA, 200)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 10)
end

function onMobEngaged(mob, target)
    mob:useMobAbility(815)
    mob:setMod(tpz.mod.REGAIN, 300)
end

function onMobFight(mob, target)
	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(690)
		mob:setLocalVar("has2Hrd", 1)
	end
end

function onMobDeath(mob, player, isKiller)
end
