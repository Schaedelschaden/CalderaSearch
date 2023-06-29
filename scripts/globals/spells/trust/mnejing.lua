-----------------------------------------
-- Trust: Mnejing
-----------------------------------------
require("scripts/globals/trust")
----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    
    local Defense = mob:getMod(tpz.mod.DEF)
    
    mob:addListener("COMBAT_TICK", "MNEJING_CTICK", function(mobArg)
        local party  = mobArg:getMaster():getPartyWithTrusts()
        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if
                    member:getTrustID() == tpz.magic.spell.NASHMEIRA
                then
                    mobArg:setMod(tpz.mod.DEF, Defense + (Defense * 0.20))
                    mobArg:setMod(tpz.mod.ENMITY, 45)
                else
                    mobArg:setMod(tpz.mod.DEF, Defense)
                    mobArg:setMod(tpz.mod.ENMITY, 35)
                end
            end
        end
    end)

    mob:setMobMod(tpz.mobMod.MOBMOD_CAN_SHIELD_BLOCK, 1)
    mob:setMod(tpz.mod.SHIELDBLOCKRATE, 40)
    mob:setMod(tpz.mod.DMG, -37.5)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 8, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    
end

function onMobFight(mob)
    local target = mob:getTarget()
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        if os.time() > mob:getLocalVar("MNEJING_DISRUPTOR_DELAY") then
            mob:useMobAbility(2747)
            mob:setLocalVar("MNEJING_DISRUPTOR_DELAY", os.time() + 60)
        end
        
        if os.time() > mob:getLocalVar("MNEJING_BASH_DELAY") then
            mob:useMobAbility(1944)
            mob:setLocalVar("MNEJING_BASH_DELAY", os.time() + 50)
        end

        if os.time() > mob:getLocalVar("MNEJING_PROVOKE") then
            mob:useMobAbility(1945)           
            mob:setLocalVar("MNEJING_PROVOKE", os.time() + 30)
            --target:addEnmity(mob, 1800)
        end
        
        if os.time() > mob:getLocalVar("MNEJING_FLASH") then
            mob:useMobAbility(1947)           
            mob:setLocalVar("MNEJING_FLASH", os.time() + 35)
            --target:addStatusEffect(tpz.effect.FLASH, 200, 0, 12)
        end
        
        if os.time() > mob:getLocalVar("MNEJING_SKILL") then
            local skillMix = math.random(1, 2)
            if mob:getTP() >= 1000 and mob:getHPP() < 70 then
                mob:useMobAbility(2065) --Cannibal Blade
                mob:setTP(0)
            elseif mob:getTP() >= 2000 then
                if skillMix == 1 then
                    mob:useMobAbility(1940) --Chimera Ripper
                    mob:setTP(0)
                elseif skillMix == 2 then
                    mob:useMobAbility(1941) --String Clipper
                    mob:setTP(0)
                end
            end           
            mob:setLocalVar("MNEJING_SKILL", os.time() + 10)
        end
        
        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("MNEJING_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("MNEJING_CTICK")
end