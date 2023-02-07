-----------------------------------------
-- Trust: AATT
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
	tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)

    mob:addListener("COMBAT_TICK", "AATT_CTICK", function(mobArg, target, wsid, tp, action) -- synergy
        local synergy = 0
        local master  = mobArg:getMaster()
        local party   = mobArg:getMaster():getPartyWithTrusts()
        local base    = mobArg:getMod(tpz.mob.MEVA)
        local ttLock  = master:getLocalVar("ttLock")

        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if
                    member:getTrustID() == tpz.magic.spell.AAHM or
                    member:getTrustID() == tpz.magic.spell.AAEV or
                    member:getTrustID() == tpz.magic.spell.AAMR or
                    member:getTrustID() == tpz.magic.spell.AAGK
                then
                    synergy = synergy + 1
                else
                    synergy = 0
                end
            end
        end

        if synergy == 1 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 60)
            master:getLocalVar("ttLock", 1)
        elseif synergy == 2 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 120)
            master:getLocalVar("ttLock", 2)
        elseif synergy == 3 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 180)
            master:getLocalVar("ttLock", 3)
        elseif synergy == 4 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 240) 
            master:getLocalVar("ttLock", 4)
        elseif synergy == 3 and evLock == 4 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("ttLock", 3)
        elseif synergy == 2 and evLock == 3 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("ttLock", 2)
        elseif synergy == 1 and evLock == 2 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("ttLock", 1)        
        end
               
        if mobArg:getMP() < (mobArg:getMaxMP() * 0.5) and mobArg:hasStatusEffect(tpz.effect.NETHER_VOID) == false then
            mobArg:useJobAbility(256, mobArg)
        end
        
        if mobArg:hasStatusEffect(tpz.effect.NETHER_VOID) then
            if (mobArg:getMainLvl() >= 62) then
                local target = mobArg:getTarget()
                mobArg:castSpell(248, target)
            else
                local target = mobArg:getTarget()
                mobArg:castSpell(247, target)
            end
        end

        
        if os.time() > mobArg:getLocalVar("magicCooldown") then
            local mLvl   = mobArg:getMainLvl()
            if mLvl >= 92 then
                local target = mobArg:getTarget()
                local spells = { 148, 153, 158, 163, 168, 173 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 89 and mLvl < 92 then
                local target = mobArg:getTarget()
                local spells = { 148, 153, 158, 163, 167, 173 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 86 and mLvl < 89 then
                local target = mobArg:getTarget()
                local spells = { 148, 152, 158, 163, 167, 173 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 83 and mLvl < 86 then
                local target = mobArg:getTarget()
                local spells = { 147, 152, 158, 163, 167, 173 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 80 and mLvl < 83 then
                local target = mobArg:getTarget()
                local spells = { 147, 152, 157, 163, 167, 173 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 77 and mLvl < 80 then
                local target = mobArg:getTarget()
                local spells = { 147, 152, 157, 163, 167, 172 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 75 and mLvl < 77 then
                local target = mobArg:getTarget()
                local spells = { 147, 152, 157, 162, 167, 172 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 74 and mLvl < 75 then
                local target = mobArg:getTarget()
                local spells = { 147, 152, 157, 162, 166, 172 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 73 and mLvl < 74 then
                local target = mobArg:getTarget()
                local spells = { 147, 151, 157, 162, 166, 172 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 72 and mLvl < 73 then
                local target = mobArg:getTarget()
                local spells = { 146, 151, 157, 162, 166, 172 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 70 and mLvl < 72 then
                local target = mobArg:getTarget()
                local spells = { 146, 151, 156, 162, 166, 172 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 68 and mLvl < 70 then
                local target = mobArg:getTarget()
                local spells = { 146, 151, 156, 162, 166, 171 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 66 and mLvl < 68 then
                local target = mobArg:getTarget()
                local spells = { 146, 151, 156, 161, 166, 171 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 64 and mLvl < 66 then
                local target = mobArg:getTarget()
                local spells = { 146, 151, 156, 161, 165, 171 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 62 and mLvl < 64 then
                local target = mobArg:getTarget()
                local spells = { 146, 150, 156, 161, 165, 171 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 59 and mLvl < 62 then
                local target = mobArg:getTarget()
                local spells = { 145, 150, 156, 161, 165, 171 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 55 and mLvl < 59 then
                local target = mobArg:getTarget()
                local spells = { 145, 150, 155, 161, 165, 171 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 51 and mLvl < 55 then
                local target = mobArg:getTarget()
                local spells = { 145, 150, 155, 161, 165, 170 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 46 and mLvl < 51 then
                local target = mobArg:getTarget()
                local spells = { 145, 150, 155, 160, 165, 170 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 42 and mLvl < 46 then
                local target = mobArg:getTarget()
                local spells = { 145, 150, 155, 160, 164, 170 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 38 and mLvl < 42 then
                local target = mobArg:getTarget()
                local spells = { 145, 149, 155, 160, 164, 170 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 34 and mLvl < 38 then
                local target = mobArg:getTarget()
                local spells = { 144, 149, 155, 160, 164, 170 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 30 and mLvl < 34 then
                local target = mobArg:getTarget()
                local spells = { 144, 149, 154, 160, 164, 170 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 26 and mLvl < 30 then
                local target = mobArg:getTarget()
                local spells = { 144, 149, 154, 160, 164, 169 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 21 and mLvl < 26 then
                local target = mobArg:getTarget()
                local spells = { 144, 149, 154, 159, 164, 169 }
                mobArg:castSpell(spells[math.random(1, 6)], target)
            elseif mLvl >= 17 and mLvl < 21 then
                local target = mobArg:getTarget()
                local spells = { 144, 149, 154, 164, 169 }
                mobArg:castSpell(spells[math.random(1, 5)], target)
            elseif mLvl >= 13 and mLvl < 17 then
                local target = mobArg:getTarget()
                local spells = { 144, 149, 154, 169 }
                mobArg:castSpell(spells[math.random(1, 4)], target)
            elseif mLvl >= 9 and mLvl < 13 then
                local target = mobArg:getTarget()
                local spells = { 144, 154, 169 }
                mobArg:castSpell(spells[math.random(1, 3)], target)
            elseif mLvl >= 5 and mLvl < 9 then
                local target = mobArg:getTarget()
                local spells = { 144, 169 }
                mobArg:castSpell(spells[math.random(1, 2)], target)
            elseif mLvl >= 1 and mLvl < 5 then
                mobArg:castSpell(144, target)
            end
            mobArg:setLocalVar("magicCooldown", os.time() + 30)
        end
    end)


	--Modifiers (All build Magic Damage Taken)

    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 50, 0, 0) --If this doesnt work, try HPP (HP %)
	mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:setMod(tpz.mod.FASTCAST, 50)
    
    
	--Spells
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ELEMENTAL_SEAL)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SLEEPGA)
    --mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.POISON, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.POISON)
    --mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.BIO, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.BIO)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, tpz.effect.NETHER_VOID, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.ASPIR)
    

        
	--Abilities
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_GTE, 900, ai.r.JA, ai.s.SPECIFIC, tpz.ja.LAST_RESORT)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, tpz.effect.LAST_RESORT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SOULEATER)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE)
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.NONE)


end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("AATT_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("AATT_CTICK")
end
