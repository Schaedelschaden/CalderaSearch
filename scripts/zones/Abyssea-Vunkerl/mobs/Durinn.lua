-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Durinn
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.FASTCAST, 65)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        local spells =
        {
            177, -- Firaga IV
            182, -- Blizzaga IV
            187, -- Aeroga IV
            192, -- Stonega IV
            197, -- Thundaga IV
            202, -- Waterga IV
            204, -- Flare
            206, -- Freeze
            208, -- Tornado
            210, -- Quake
            212, -- Burst
            214, -- Flood
            356, -- Paralyga
            359, -- Silencega
        }

        if skillID == 2113 then -- Hellsnap
            local target    = mobArg:getTarget()
            local pickSpell = spells[math.random(#spells)]

            mobArg:castSpell(pickSpell, target)
        end
    end)
end

function onMobFight(mob, target)
end

function onSpellPrecast(mob, spell)
    if spell:getID() >= 204 and spell:getID() <= 215 then -- AM & AMII
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(18)
    end
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
