-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Tunga
-----------------------------------
mixins =
{
    require("scripts/mixins/families/chigoe"),
    require("scripts/mixins/abyssea_weakness")
}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, math.random(150, 200))
    mob:addMod(tpz.mod.ATT, math.random(250, 350))
    mob:addMod(tpz.mod.MATT, 400)
    mob:addMod(tpz.mod.EARTHATT, 100)
    mob:setMod(tpz.mod.MACC, 650)
	mob:addMod(tpz.mod.EVA, math.random(150, 200))
	mob:addMod(tpz.mod.DEF, math.random(350, 500))
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.STR, 250)
    mob:addMod(tpz.mod.DEX, 115)
    mob:addMod(tpz.mod.AGI, 115)
    mob:addMod(tpz.mod.VIT, 115)
    mob:addMod(tpz.mod.MND, 115)
    mob:addMod(tpz.mod.CHR, 115)
    mob:addMod(tpz.mod.INT, 115)
    mob:addMod(tpz.mod.HASTE_ABILITY, 1500)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:setMod(tpz.mod.REGEN, 250)
end

function onMobFight(mob, target)

    --CHAINSPELL until death.
    if mob:getHPP() <= 10 and mob:getLocalVar("has2Hrd") == 0 then
        mob:useMobAbility(692)

        mob:timer(3000, function(mobArg)
            mobArg:getStatusEffect(tpz.effect.CHAINSPELL):setDuration(0)
        end)

        mob:setLocalVar("has2Hrd", 1)
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power  = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENLIGHT, params)
end

function onMobDisengage(mob)
    mob:setLocalVar("has2Hrd", 0)
end

function onMobDespawn(mob)

end

function onMobDeath(mob, player, isKiller)
end
