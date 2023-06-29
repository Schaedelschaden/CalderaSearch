-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Dvalinn
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.SILENCERES, 100)
    mob:addMod(tpz.mod.STUNRES, 85)
    mob:addMod(tpz.mod.UDMGMAGIC, -75)

    mob:addListener("WEAPONSKILL_STATE_ENTER", "MOBSKILL_START", function(mobArg, skillID)
		mobArg:setMod(tpz.mod.PHYS_ABSORB, 100)
        mobArg:setMod(tpz.mod.MAGIC_ABSORB, 0)
    end)

    mob:addListener("MAGIC_START", "MAGIC_START", function(mobArg, spell, action)
        mobArg:setMod(tpz.mod.PHYS_ABSORB, 0)
		mobArg:setMod(tpz.mod.MAGIC_ABSORB, 100)
    end)

    mob:addListener("TAKE_DAMAGE", "TAKE_DMG", function(mobArg, amount, attacker, attackType, damageType)
        -- if
            -- amount < 0 and -- Absorbed physical attack
            -- (attackType == tpz.attackType.PHYSICAL or
             -- attackType == tpz.attackType.RANGED) and
            -- mobArg:actionQueueEmpty() == true
        -- then
            -- mobArg:useMobAbility()
        -- elseif
            -- amount < 0 and -- Absorbed magical attack
            -- (attackType == tpz.attackType.MAGICAL or
             -- attackType == tpz.attackType.BREATH) and
            -- mobArg:actionQueueEmpty() == true
        -- then
            -- mobArg:castSpell()
        -- end

        if
            amount < 0 and
            mobArg:actionQueueEmpty() == true
        then
            local pickOne = math.random(1, 100)

            if pickOne <= 50 then
                mobArg:useMobAbility()
            else
                mobArg:castSpell()
            end
        end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local isBusy = false
        local act    = mob:getCurrentAction()

        if
            act == tpz.act.MOBABILITY_START or
            act == tpz.act.MOBABILITY_USING or
            act == tpz.act.MOBABILITY_FINISH or
            act == tpz.act.MAGIC_START or
            act == tpz.act.MAGIC_CASTING or
            act == tpz.act.MAGIC_START
        then
            isBusy = true
        end

        if
            isBusy == false and
            (mob:getMod(tpz.mod.PHYS_ABSORB) > 0 or
             mob:getMod(tpz.mod.MAGIC_ABSORB) > 0)
        then
            mob:setMod(tpz.mod.PHYS_ABSORB, 0)
            mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
    end
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_START")
    mob:removeListener("MAGIC_START")
    mob:removeListener("TAKE_DMG")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_START")
    mob:removeListener("MAGIC_START")
    mob:removeListener("TAKE_DMG")
end
