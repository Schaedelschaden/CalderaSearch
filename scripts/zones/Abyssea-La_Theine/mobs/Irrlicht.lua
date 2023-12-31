-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Irrlicht
-----------------------------------
require("scripts/globals/spell_data")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMod(tpz.mod.BINDRES, 100)
    mob:setMod(tpz.mod.GRAVITYRES, 100)
    mob:setMod(tpz.mod.SLEEPRES, 100)
    mob:setMod(tpz.mod.REFRESH, 20)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)

    mob:addListener("MAGIC_USE", "SLEEPGA_ENMITY_RESET", function(mobArg, target, spell, action)
        if spell:getID() == tpz.magic.spell.SLEEPGA_II then
            mobArg:resetEnmity(target)
        end
    end)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.BIND, {chance = 100})
end

function onMobDisengage(mob)
    mob:removeListener("SLEEPGA_ENMITY_RESET")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("SLEEPGA_ENMITY_RESET")
end
