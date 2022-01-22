-----------------------------------
-- Area: Waughroon Shrine
-- Mob: Tartaruga Gigante
-- KSNM99
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.STUNRES, 100)
	mob:addMod(tpz.mod.ATT, 410)
	mob:addMod(tpz.mod.DEF, 800)
	mob:setMod(tpz.mod.MATT, 210)
	mob:addMod(tpz.mod.ACC, 100)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.EVA, 150)
	mob:addMod(tpz.mod.MEVA, 75)
	mob:addMod(tpz.mod.FASTCAST, 60)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 30)
	mob:addMod(tpz.mod.REGEN, 150)
	mob:addMod(tpz.mod.REGAIN, 150)
	mob:addMod(tpz.mod.REFRESH, 25)
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 100
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER, params)
end

function onMobFight(mob)
   	local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true 
    end
	
   	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(692) -- Chain Spell
		mob:setLocalVar("has2Hrd", 1)
	end
end

function onMobDeath(mob, player, isKiller)
end