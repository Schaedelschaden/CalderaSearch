-----------------------------------
-- Area: Escha Ru'Aun
-- Mob: Eschan Ghrah
-----------------------------------
local ID = require("scripts/zones/Escha_RuAun/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    -- Set core Skin and mob elemental resist/weakness; other elements set to 0.
    -- Set to non aggro.
    mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
    mob:addMod(tpz.mod.ATT, 250)
    mob:addMod(tpz.mod.EVA, 175)
    mob:addMod(tpz.mod.DEF, 275)
    mob:addMod(tpz.mod.MEVA, 200)
    mob:addMod(tpz.mod.MDEF, 50)
    mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
    mob:AnimationSub(0)
    mob:setAggressive(0)
    mob:setLocalVar("roamTime", os.time())
    mob:setLocalVar("form2", math.random(2, 3))

    local skin = math.random(1161, 1168)

    mob:setModelId(skin)

    if skin == 1161 then -- Fire
        mob:setMod(tpz.mod.ICERES, 27)
        mob:setMod(tpz.mod.WATERRES, -27)
    elseif skin == 1164 then --Earth
        mob:setMod(tpz.mod.THUNDERRES, 27)
        mob:setMod(tpz.mod.WINDRES, -27)
    elseif skin == 1162 then -- Water
        mob:setMod(tpz.mod.THUNDERRES, -27)
        mob:setMod(tpz.mod.FIRERES, 27)
    elseif skin == 1163 then -- Wind
        mob:setMod(tpz.mod.ICERES, -27)
        mob:setMod(tpz.mod.EARTHRES, 27)
    elseif skin == 1166 then --Ice
        mob:setMod(tpz.mod.WINDRES, 27)
        mob:setMod(tpz.mod.FIRERES, -27)
    elseif skin == 1165 then --Lightning
        mob:setMod(tpz.mod.WATERRES, 27)
        mob:setMod(tpz.mod.EARTHRES, -27)
    elseif skin == 1167 then --Light
        mob:setMod(tpz.mod.LIGHTRES, 27)
        mob:setMod(tpz.mod.DARKRES, -27)
    elseif skin == 1168 then --Dark
        mob:setMod(tpz.mod.DARKRES, 27)
        mob:setMod(tpz.mod.LIGHTRES, -27)
    end
end

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("roamTime")

    if mob:AnimationSub() == 0 and os.time() - roamTime > 60 then
        mob:AnimationSub(mob:getLocalVar("form2"))
        mob:setLocalVar("roamTime", os.time())
        mob:setAggressive(1)
    elseif mob:AnimationSub() == mob:getLocalVar("form2") and os.time() - roamTime > 60 then
        mob:AnimationSub(0)
        mob:setAggressive(0)
        mob:setLocalVar("roamTime", os.time())
    end
end

function onMobFight(mob, target)
    local changeTime = mob:getLocalVar("changeTime")

    if mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60 then
        mob:AnimationSub(mob:getLocalVar("form2"))
        mob:setAggressive(1)
        mob:setLocalVar("changeTime", mob:getBattleTime())
    elseif mob:AnimationSub() == mob:getLocalVar("form2") and mob:getBattleTime() - changeTime > 60 then
        mob:AnimationSub(0)
        mob:setAggressive(0)
        mob:setLocalVar("changeTime", mob:getBattleTime())
    end
end

function onMobDeath(mob, player, isKiller)
    -- 5% chance for any Eschan Ghrah to spawn Warder of Fortitude
    if GetMobByID(ID.mob.WARDER_OF_FORTITUDE):isDead() and math.random(0, 100) < 5 then
        local pos = mob:getPos()

        SpawnMob(ID.mob.WARDER_OF_FORTITUDE):updateEnmity(player)
        GetMobByID(ID.mob.WARDER_OF_FORTITUDE):setPos(pos.x, pos.y, pos.z, pos.rot)
    end
end
