-----------------------------------
-- Trust: Ullegore
-----------------------------------
require("scripts/globals/trust")
-----------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    -- HP 30% MP 300% per BG 5kish pool
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 30, 0, 0)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 300, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:addStatusEffect(tpz.effect.MANA_WALL, 50, 0, 0)

    -- Cycle Comet evey minute
    -- Tends to favor T5 nukes over comet and wont cast it
    mob:addListener("COMBAT_TICK", "ULLEGORE_CTICK", function(mobArg)
        local comet = mobArg:getLocalVar("comet")
        local target = mobArg:getTarget()
        if comet == 0 then
            mobArg:castSpell(219, target)
            mobArg:setLocalVar("comet", 1)
            mobArg:timer(60000, function(mobArg1)
                mobArg1:setLocalVar("comet", 0)
            end)
        end
        if mobArg:getTP() == 3000 and mobArg:getMP() < mobArg:getMaxMP() / 2 then
            local master = mobArg:getMaster()
            local restore = mobArg:getMaxMP() * 0.15
            mobArg:injectActionPacket(6, 19)
            mobArg:addMP(mobArg:getMaxMP() * 0.15)
            mobArg:setTP(0)
            local signature = math.random(1, 100)
            if signature >= 50 then
                master:PrintToPlayer("Ullegore: Give me more power!", tpz.msg.channel.NS_PARTY)
            end
            mobArg:timer(1000, function(mobArg2)
                master:PrintToPlayer("Ullegore uses Mana Rage!", tpz.msg.channel.NS_SAY)
            end)
            mobArg:timer(4000, function(mobArg3)
                master:PrintToPlayer(string.format("Ullegore absorbs %i MP from hell.", restore), tpz.msg.channel.NS_SAY)
            end)
        end
        
        if os.time() > mobArg:getLocalVar("debuff") then
            if not target:hasStatusEffect(tpz.effect.BURN) then
                mobArg:castSpell(235, target)
            end
            
            if not target:hasStatusEffect(tpz.effect.CHOKE) then
                mobArg:castSpell(237, target)
            end
            
            if not target:hasStatusEffect(tpz.effect.SHOCK) then
                mobArg:castSpell(239, target)
            end
            
            if not target:hasStatusEffect(tpz.effect.BIO) then
                mobArg:castSpell(231, target)
            end
            
            if not target:hasStatusEffect(tpz.effect.POISON) then
                mobArg:castSpell(221, target)
            end
            
            if not target:hasStatusEffect(tpz.effect.POISON) then
                mobArg:castSpell(221, target)
            end            
            mobArg:setLocalVar("debuff", os.time() + 1)
        end
        
        
        if mobArg:getMainLvl() <= 99 then
            mobArg:setSpellList(428)
            mobArg:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
            mobArg:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.RANDOM, tpz.magic.spellFamily.NONE, 45)
        else
            mobArg:setSpellList(0)
            if os.time() > mobArg:getLocalVar("AM") then
                mobArg:castSpell(math.random(204, 215), target)
                mobArg:setLocalVar("AM", os.time() + 5)               
            end
        end 
        
    end)

    -- boost scaled by level
    local power = mob:getMainLvl() * 2
    mob:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST, power * 2, 0, 0) -- Memento Mori
    mob:addMod(tpz.mod.MATT, power)
    mob:addMod(tpz.mod.MAGIC_DAMAGE, power)
    mob:addMod(tpz.mod.REFRESH, 20)
    mob:addMod(tpz.mod.MACC, power)
    mob:addMod(tpz.mod.FASTCAST, 50)

    -- disable melee to promote nuking
    mob:SetAutoAttackEnabled(false)
    mob:addMod(tpz.mod.REGAIN, 75) --TP feed for Mana Rage


end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("ULLEGORE_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("ULLEGORE_CTICK")
end
