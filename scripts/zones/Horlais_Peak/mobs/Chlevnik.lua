-----------------------------------
-- Area: Horlais Peak
-- Mob: Chlevnik
-- KSNM99
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 80) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.STUNRES, 100)
	mob:addMod(tpz.mod.MAIN_DMG_RATING, 100)
	mob:addMod(tpz.mod.ATT, 900)
	mob:addMod(tpz.mod.ACC, 100)
	mob:addMod(tpz.mod.MATT, 200)
	mob:addMod(tpz.mod.DEF, 700)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
	mob:addMod(tpz.mod.EVA, 100)
	mob:addMod(tpz.mod.MEVA, 100)
	mob:addMod(tpz.mod.REGAIN, 150)
	mob:addMod(tpz.mod.REGEN, 100)
	mob:addMod(tpz.mod.REFRESH, 25)
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 100
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENTHUNDER, params)
end

function onMobFight(mob)
   	local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true 
    end
	
   	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(695) -- Hundred Fists
		mob:setLocalVar("has2Hrd", 1)
	end
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280) -- AoE Meteor Animation
        spell:setMPCost(1)
    end
end

function onMobDeath(mob, player, isKiller)
end