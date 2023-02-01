-----------------------------------
-- Area: Apollyon NE
--  Mob: Thiazi
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SLASHRES, 750)
    mob:setMod(tpz.mod.PIERCERES, 1250)
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
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local mobID = mob:getID()
        local battlefield = mob:getBattlefield()
        local randomF2 = battlefield:getLocalVar("randomF2")
        if randomF2 == mobID then
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[2][1]):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[2][1]):setStatus(tpz.status.NORMAL)
        elseif randomF2+1 == mobID then
            battlefield:setLocalVar("portalTriggerF3", ID.mob.APOLLYON_NE_MOB[3])
            battlefield:setLocalVar("itemF3", ID.mob.APOLLYON_NE_MOB[3]+math.random(1,4))
            local players = battlefield:getPlayers()
            if #players > 6 then
                for i = 5, 9 do
                    GetMobByID(ID.mob.APOLLYON_NE_MOB[3]+i):spawn()
                end
                battlefield:setLocalVar("portalTriggerF3", ID.mob.APOLLYON_NE_MOB[3]+(math.random(0,1)*5))
                battlefield:setLocalVar("itemF3", ID.mob.APOLLYON_NE_MOB[3]+math.random(1,4)+(math.random(0,1)*5))
            end
            if #players > 12 then
                for i = 10, 14 do
                    GetMobByID(ID.mob.APOLLYON_NE_MOB[3]+i):spawn()
                end
                battlefield:setLocalVar("portalTriggerF3", ID.mob.APOLLYON_NE_MOB[3]+(math.random(0,2)*5))
                battlefield:setLocalVar("itemF3", ID.mob.APOLLYON_NE_MOB[3]+math.random(1,4)+(math.random(0,2)*5))
            end
            tpz.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NE_PORTAL[2])
        end
    end
end
