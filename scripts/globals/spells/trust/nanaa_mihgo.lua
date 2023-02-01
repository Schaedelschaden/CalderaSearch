-----------------------------------------
-- Trust: Nanaa Mihgo
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

local message_page_offset = 5

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
	if mob:getMainLvl() > 105 then
		mob:addMod(tpz.mod.TREASURE_HUNTER, 1)
	end

    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.ROMAA_MIHGO] = tpz.trust.message_offset.TEAMWORK_1,
    })

    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.DESPOIL)

    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.HIGHEST)
end

function onMobFight(mob, target)
    local tp = mob:getTP()

    if
        mob:isBehind(target) and
        tp >= 999 and
        os.time() > mob:getLocalVar("TICK_OFFSET")
    then
        mob:useJobAbility(44, mob) -- Sneak Attack
        mob:useMobAbility(3189)    -- King Cobra Clamp
        mob:setLocalVar("TICK_OFFSET", os.time() + 3)
    elseif mob:isBehind(target) then
        mob:useJobAbility(44, mob) -- Sneak Attack
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
