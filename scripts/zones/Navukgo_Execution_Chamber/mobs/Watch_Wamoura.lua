-----------------------------------
-- Area: Navukgo Execution Chamber
--  Mob: Watch Wamoura
-----------------------------------
local ID = require("scripts/zones/Navukgo_Execution_Chamber/IDs")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:AnimationSub(0)
    mob:setLocalVar("hate", 1)
    mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 500) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
	mob:addMod(tpz.mod.EVA, 50) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 70) -- Magic Evasion (Compare to MACC)
	-- mob:addMod(tpz.mod.MDEF, 90) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.STR, 130)
    mob:addMod(tpz.mod.DEX, 130)
    mob:addMod(tpz.mod.AGI, 130)
    mob:addMod(tpz.mod.VIT, 130)
    mob:addMod(tpz.mod.MND, 130)
    mob:addMod(tpz.mod.CHR, 130)
    mob:addMod(tpz.mod.INT, 130)
    --printf("SUB 0")
end

function onMobFight(mob, target)
    local hateCount = mob:getLocalVar("hate")

    if mob:AnimationSub() == 0 then
        mob:timer(60000, function(mobArg)
            mobArg:AnimationSub(1)
            --printf("SUB 1")
            mobArg:setLocalVar("hate", 0)
        end)
    end

    if mob:AnimationSub() == 1 then
        mob:timer(60000, function(mobArg)
            local mobTarget = mobArg:getTarget()

            mobArg:AnimationSub(0)
            --printf("SUB 0")
            mobArg:resetEnmity(mobTarget)
            --printf("RESET 1")
            mobArg:setLocalVar("hate", 1)
        end)
    end

    if mob:AnimationSub() == 1 then -- Takes melee damage
        if hateCount >= 1 then
            mob:timer(5000, function(mobArg)
                local mobTarget = mobArg:getTarget()

                mobArg:resetEnmity(mobTarget)
                --printf("RESET LOOP")
                mobArg:setLocalVar("hate", hateCount)
            end)
        end

        mob:delStatusEffect(tpz.effect.BLAZE_SPIKES)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
    elseif mob:AnimationSub() == 0 then -- takes magic damage
        mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 200, 3, 0)
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
