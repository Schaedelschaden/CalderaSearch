-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Karkadann
-----------------------------------
mixins =
{
    require("scripts/mixins/families/monoceros"),
    require("scripts/mixins/abyssea_weakness")
}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.EVA, 150)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 2335 then -- Lightning Spear
            mobArg:setLocalVar("MONOCEROS_CHARGE_HORN", 0)
        elseif skillID == 2337 then -- Damsel Memento
            mobArg:setLocalVar("AURA_PARALYZE", os.time() + math.random(45, 60))
        elseif skillID == 2338 then -- Rampant Stance
            local target = mobArg:getTarget()

            mobArg:resetEnmity(target)
        end
    end)

    mob:addListener("MAGIC_STATE_EXIT", "MAGIC_USED", function(mobArg, spell)
		if spell:getID() == 197 then -- Thundaga IV
            local charge = mobArg:getLocalVar("MONOCEROS_CHARGE_HORN") * 50

            mobArg:delMod(tpz.mod.MATT, charge)
			mobArg:setLocalVar("MONOCEROS_CHARGE_HORN", 0)
		end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        -- Handle aura
        if os.time() < mob:getLocalVar("AURA_PARALYZE") then
            local allianceList = target:getAlliance()
            local playerName   = {}
            local targ

            for i, v in ipairs(allianceList) do
                local distance = mob:checkDistance(v)

                if distance <= 15 then
                    v:delStatusEffectSilent(tpz.effect.PARALYSIS)
                    v:addStatusEffectEx(tpz.effect.PARALYSIS, tpz.effect.PARALYSIS, 30, 0, 4)
                end
            end
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onSpellPrecast(mob, spell)
    local charge = mob:getLocalVar("MONOCEROS_CHARGE_HORN") * 50

    mob:addMod(tpz.mod.MATT, charge)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
    mob:removeListener("MAGIC_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
    mob:removeListener("MAGIC_USED")
end
