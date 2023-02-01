-----------------------------------
-- Trust: AAMR
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

    mob:addListener("COMBAT_TICK", "AAMR_CTICK", function(mobArg, target, wsid, tp, action) -- synergy
        local synergy = 0
        local master  = mobArg:getMaster()
        local party   = mobArg:getMaster():getPartyWithTrusts()
        local base    = mobArg:getMod(tpz.mob.MEVA)
        local mrLock  = master:getLocalVar("mrLock")

        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if member:getTrustID() == tpz.magic.spell.AAHM or member:getTrustID() == tpz.magic.spell.AAEV or member:getTrustID() == tpz.magic.spell.AAGK or member:getTrustID() == tpz.magic.spell.AATT then
                    synergy = synergy + 1
                else
                    synergy = 0
                end
            end
            if member:getObjType() ~= tpz.objType.NONE then
                if mobArg:isBehind(member) then
                    mobArg:useJobAbility(76, mobArg)
                end
            end
        end

        if synergy == 1 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 60)
            master:getLocalVar("mrLock", 1)
        elseif synergy == 2 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 120)
            master:getLocalVar("mrLock", 2)
        elseif synergy == 3 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 180)
            master:getLocalVar("mrLock", 3)
        elseif synergy == 4 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 240) 
            master:getLocalVar("mrLock", 4)
        elseif synergy == 3 and evLock == 4 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("mrLock", 3)
        elseif synergy == 2 and evLock == 3 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("mrLock", 2)
        elseif synergy == 1 and evLock == 2 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("mrLock", 1)        
        end
        
        local target = mobArg:getTarget()
        local master = mobArg:getMaster()

        if mobArg:isBehind(target) then
            mobArg:useJobAbility(44, mobArg)
        end

    end)

    mob:addMod(tpz.mod.GILFINDER, 1)
    mob:addMod(tpz.mod.TREASURE_HUNTER, 1)

    if mob:getMainLvl() > 105 then
		mob:addMod(tpz.mod.TREASURE_HUNTER, 1)
	end

    mob:addMod(tpz.mod.TRIPLE_ATTACK, 7)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0) --supposed to be 20% may need to switch to HPP
	mob:setHP(mob:getMaxHP())
    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.HIGHEST)

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("AAMR_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("AAMR_CTICK")
end
