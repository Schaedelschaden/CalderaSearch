-----------------------------------------
-- Trust: Monberaux
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

local message_page_offset = 120

function onMagicCastingCheck(caster, target, spell)
    if caster:getGil() < 25000 then
        local rand = math.random(1, 4)
        if rand == 1 then
            caster:PrintToPlayer(string.format("Monberaux: How do you not have 25k? have you killed nothing?"),tpz.msg.channel.NS_PARTY)
        elseif rand == 2 then
            caster:PrintToPlayer(string.format("Monberaux: I think Pheliont dropped 50k by accident in the library, go get half and try again..."),tpz.msg.channel.NS_PARTY)
        elseif rand == 3 then
            caster:PrintToPlayer(string.format("Monberaux: I think the tavern in South Sandy is hiring dancers if you need more money."),tpz.msg.channel.NS_PARTY)
        elseif rand == 4 then
            caster:PrintToPlayer(string.format("Monberaux: You think healthcare is free? This is Vanadiel not Canada."),tpz.msg.channel.NS_PARTY)
        end
        return 1
    else
        return tpz.trust.canCast(caster, spell)
    end
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    local master = mob:getMaster()
    local gil    = master:getGil()
    if gil > 25000 then
        master:delGil(25000)
        master:PrintToPlayer(string.format("Monberaux: Thank you for the 25k donation! My full services are at your disposal."),tpz.msg.channel.NS_PARTY)
        mob:addMod(tpz.mod.SLEEPRES, 100)
    end
end

function onMobFight(mob)
    mob:setMod(tpz.mod.LULLABYRES, 100)
    if
        os.time() > mob:getLocalVar("MOB_FIGHT_DELAY")
    then
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
            act == tpz.act.MAGIC_FINISH
        then
            isBusy = true
        end

        if isBusy == false and mob:actionQueueEmpty() == true then

            local master  = mob:getMaster()
            local party   = master:getPartyWithTrusts()
            local mLvl    = mob:getMainLvl()
            local target  = master:getTarget()
            local insured = master:getLocalVar("insuranceAccepted")
            
            for i, v in ipairs(party) do
                -- HEALING BLOCK
                if v:getHP() <= v:getMaxHP() - 700 then
                    mob:useMobAbility(4237, v) --mix max pot
                elseif v:getHP() <= v:getMaxHP() - 500 and v:getHP() > v:getMaxHP() - 700 then
                    mob:useMobAbility(4236, v) -- max pot
                elseif v:getHP() <= v:getMaxHP() - 250 and v:getHP() > v:getMaxHP() - 500 then
                    mob:useMobAbility(4235, v) -- hyper pot
                elseif v:getHP() <= v:getMaxHP() - 150 and v:getHP() > v:getMaxHP() - 250 then
                    mob:useMobAbility(4234, v) -- x-pot
                elseif v:getHP() <= v:getMaxHP() - 50 and v:getHP() > v:getMaxHP() - 150 then
                    mob:useMobAbility(4232, v) -- pot
                end
                
                --
                if v:hasStatusEffect(tpz.effect.SLEEP) or v:hasStatusEffect(tpz.effect.LULLABY) then
                    mob:useMobAbility(4232, v) -- pot
                end
                
                -- MP RESTORATION
                if v:getMP() <= v:getMaxMP() - 160 then
                    mob:useMobAbility(4254, v) -- dry ether
                end
                
                -- LVL 2 EXPANSION (ERASE / PARALYSIS / POISON)
                if master:getCharVar("MonberauxLvl") >= 2 then
                    if v:hasStatusEffectByFlag(tpz.effectFlag.ERASABLE) then
                        mob:useMobAbility(4245, v) --panacea
                    elseif v:hasStatusEffect(tpz.effect.PARALYSIS)  then
                        mob:useMobAbility(4247, v) --PARA B GONE
                    end
                end
                
                -- LVL 3 EXPANSION (POISON / SILENCE / CURSE / DOOM REMOVAL)
                if master:getCharVar("MonberauxLvl") >= 3 then
                    if v:hasStatusEffect(tpz.effect.SILENCE) then
                        mob:useMobAbility(4241, v) --echo drops
                    end
                    if v:hasStatusEffect(tpz.effect.DOOM) then
                        mob:useMobAbility(4246, v) --antidote
                    end
                    
                    if v:hasStatusEffect(tpz.effect.CURSE_I) then
                        mob:useMobAbility(4246, v) --antidote
                    end
                    
                    if v:hasStatusEffect(tpz.effect.CURSE_II) then 
                        mob:useMobAbility(4246, v) --antidote
                    end
                    
                    if v:hasStatusEffect(tpz.effect.PLAGUE) then
                        mob:useMobAbility(4246, v) --antidote
                    end
                    
                    if v:hasStatusEffect(tpz.effect.POISON) then
                        mob:useMobAbility(4246, v) --antidote
                    end
                end
            end
            
            -- LVL 4 EXPANSION (REGEN / PROTECT / SHELL / FULL STAT BOOST / MATT BOOST / MDEF BOOST)
            if master:getCharVar("MonberauxLvl") >= 4 then
                if not master:hasStatusEffect(tpz.effect.REGEN) then
                    mob:useMobAbility(4257, master) --life water
                end
                
                if not master:hasStatusEffect(tpz.effect.PROTECT) then
                    mob:useMobAbility(4255, master) --guard drink
                end
                
                if not master:hasStatusEffect(tpz.effect.STR_BOOST) then
                    mob:useMobAbility(4261, master) --samson drink
                end
                
                if not master:hasStatusEffect(tpz.effect.MAGIC_ATK_BOOST) then
                    mob:useMobAbility(4258, master) --elemental power 
                end
                
                if not master:hasStatusEffect(tpz.effect.MAGIC_DEF_BOOST) then
                    mob:useMobAbility(4259, master) --Dragon shield
                end
            end
            mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
        end
    end
    
    local master = mob:getMaster()
    if master:getCharVar("MonberauxLvl") >= 5 then
        if os.time() > mob:getLocalVar("DARK_POTION_CD") then
            local target  = mob:getTarget()
            mob:useMobAbility(4260) -- dark potion
            mob:setLocalVar("DARK_POTION_CD", os.time() + 30)
        end
    end    
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
