-----------------------------------------
-- Trust: Morimar
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 10, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
end

function onMobFight(mob)

    if os.time() > mob:getLocalVar("Morimar") then            
        if mob:getTP() >= 1000 then
            mob:useMobAbility(math.random(3160, 3164))
        end
        mob:setLocalVar("Morimar", os.time() + 10)
    end
 
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end