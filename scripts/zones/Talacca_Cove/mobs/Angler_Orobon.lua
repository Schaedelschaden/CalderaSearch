-----------------------------------
-- Area: Talacca Cove
--  Mob: Angler Orobon
-----------------------------------
local ID = require("scripts/zones/Talacca_Cove/IDs")
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:addListener("EFFECT_LOSE", "SKILLCHAIN", function(mob, effect) -- Lose Lamps
        if (effect:getType() == tpz.effect.SKILLCHAIN and effect:getTier() > 0) then
            mob:setLocalVar("LampCut", os.time())
        end
    end)

    mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
    mob:addMod(tpz.mod.STR, 100)
    mob:addMod(tpz.mod.DEX, 100)
    mob:addMod(tpz.mod.VIT, 200)
    mob:addMod(tpz.mod.AGI, 100)
    mob:addMod(tpz.mod.MND, 100)
    mob:addMod(tpz.mod.INT, 100)
    mob:addMod(tpz.mod.CHR, 100)
    mob:addMod(tpz.mod.DEF, 1000)
    mob:addMod(tpz.mod.EVA, 150)
    mob:setLocalVar("LampCut", 0)
end

function onMobFight(mob, target)

    if (mob:getLocalVar("LampCut") == 0) then
        mob:AnimationSub(0)
    else
        mob:AnimationSub(1)
    end


    if ((mob:getLocalVar("LampCut") ~= 0) and os.time() - mob:getLocalVar("LampCut") > 120) then -- 2 minute Regain Lamps
        mob:setLocalVar("LampCut", 0)
    end
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("SKILLCHAIN")
end
