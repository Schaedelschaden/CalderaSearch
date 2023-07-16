-----------------------------------------
-- Trust: Maximilian
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
    mob:addMod(tpz.mod.ACC, 500)
    mob:addMod(tpz.mod.GILFINDER, 5)
    mob:addMod(tpz.mod.TREASURE_HUNTER, 1)    
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 5)
    mob:addMod(tpz.mod.STORETP, 55)
    mob:addStatusEffect(tpz.effect.SUBTLE_BLOW_PLUS, 10, 0, 0)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 30)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("WSDELAY") then
        if mob:getTP() >= 1500 then
            local WS = { 32, 40, 41 }
            mob:useWeaponskill(WS[math.random(1, 3)], target)
            mob:setLocalVar("WSDELAY", os.time() + 3)
        end
    end
end


function onMobDespawn(mob)
end

function onMobDeath(mob)
end
