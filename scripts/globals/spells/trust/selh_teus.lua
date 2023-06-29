-----------------------------------------
-- Trust: Selh'teus
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
    mob:addMod(tpz.mod.REGAIN, 50)
    mob:addMod(tpz.mod.SLEEPRES, 80)
end

function onMobFight(mob)
    local isBusy = false
    local act    = mob:getCurrentAction()

    if
        act == tpz.act.WEAPONSKILL_START or
        act == tpz.act.WEAPONSKILL_FINISH or
        act == tpz.act.MOBABILITY_START or
        act == tpz.act.MOBABILITY_USING or
        act == tpz.act.MOBABILITY_FINISH or
        act == tpz.act.MAGIC_START or
        act == tpz.act.MAGIC_CASTING or
        act == tpz.act.MAGIC_START
    then
        isBusy = true
    end
    
    
    if isBusy == false and mob:actionQueueEmpty() == true then
        local form = mob:getModelId()
        local party = mob:getMaster():getPartyWithTrusts()
        for _, member in pairs(party) do 
            if mob:getTP() >= 1000 then
                if os.time() > mob:getLocalVar("REJUV") then
                    if member:getHPP() < 66 and mob:getTP() >= 1000 then
                        mob:useMobAbility(1509) -- Rejuvination
                        mob:setLocalVar("REJUV", os.time() + 30)
                    end
                    if member:getMP() < member:getMaxMP() * 0.05 and mob:getTP() >= 1000 then
                        mob:useMobAbility(1509) -- Rejuvination
                        mob:setLocalVar("REJUV", os.time() + 30)
                    end
                    
                end
            end 
            if member:hasStatusEffect(tpz.effect.SLEEP_I) or member:hasStatusEffect(tpz.effect.SLEEP_II) then
                mob:useMobAbility(1509) -- Rejuvination
                mob:setLocalVar("REJUV", os.time() + 30)
            end
        end
    end
    
    local shuffle = math.random(1, 2)
    if os.time() > mob:getLocalVar("MS_CD") then
        if mob:getTP() >= 1500 then
            if shuffle == 1 then
                mob:useMobAbility(1508) -- luminous lance
            elseif shuffle == 2 then
                mob:useMobAbility(1510) -- Revelation
            end
            mob:setLocalVar("MS_CD", os.time() + 25)
        end
    end
    mob:setMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
