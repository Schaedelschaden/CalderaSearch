-----------------------------------
-- Area: Full Moon Fountain
--  Mob: Fenrir Prime
-- Involved in Quest: the Moonlit Path
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 839, hpp = 25}, -- uses howling moon at 25%
        },
    })
	mob:setMobMod(tpz.mobMod.TP_USE_CHANCE, 92)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.BINDRES, 60)
    mob:setMod(tpz.mod.SLOWRES, 100)
	mob:setMod(tpz.mod.STORETP, 50)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
	mob:setMod(tpz.mod.CRITHITRATE, 25)
	mob:setMod(tpz.mod.PHYS_ABSORB, 5)
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.REGEN, 1000)
	mob:setMod(tpz.mod.MAGIC_ABSORB, 5)
end

function onMobFight(mob, target)
   	local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if Ifrit is in any stage of using a mobskill or casting a spell
    end
	
   	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(688)
		mob:setLocalVar("has2Hrd", 1)
	end
	
	
	if (mob:getHPP() <= 10) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 30)
		mob:setMod(tpz.mod.QUAD_ATTACK, 15)
	end
end

function onMobDeath(mob, player, isKiller)
end
