-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Mielikki
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	mob:addMod(tpz.mod.FIRERES, -50)
	mob:addMod(tpz.mod.ICERES, -50)
	mob:addMod(tpz.mod.THUNDERRES, 50)
	mob:addMod(tpz.mod.SILENCERES, 100)
	mob:addMod(tpz.mod.GRAVITYRES, 100)
	mob:addMod(tpz.mod.STUNRES, 90)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, math.random(150, 200))
    mob:addMod(tpz.mod.ATT, math.random(250, 350))
    mob:addMod(tpz.mod.MATT, 200)
	mob:addMod(tpz.mod.EVA, math.random(150, 200))
	mob:addMod(tpz.mod.DEF, math.random(350, 500))
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.STR, 115)
    mob:addMod(tpz.mod.DEX, 115)
    mob:addMod(tpz.mod.AGI, 115)
    mob:addMod(tpz.mod.VIT, 115)
    mob:addMod(tpz.mod.MND, 115)
    mob:addMod(tpz.mod.CHR, 115)
    mob:addMod(tpz.mod.INT, 115)
	mob:addStatusEffect(tpz.effect.STONESKIN, 10000, 0, 600, 0, 0, 4)
end

function onMobFight(mob, target)
	
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 286) then -- Addle
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
    end
end

function onMobDeath(mob, player, isKiller)
	
end