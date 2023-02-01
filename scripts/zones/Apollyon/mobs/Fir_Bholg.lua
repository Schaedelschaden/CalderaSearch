-----------------------------------
-- Area: Apollyon SW
--  Mob: Fir Bholg
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
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
        local race = battlefield:getLocalVar("raceF1")
        if race == 1 or race == 2 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1]+2 or mobID == ID.mob.APOLLYON_SW_MOB[1]+7 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+2):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+7):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(tpz.status.NORMAL)
                else
                    tpz.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_SW_PORTAL[1])
                end
            end
        elseif race == 3 or race == 4 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1] or mobID == ID.mob.APOLLYON_SW_MOB[1]+5 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+5):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(tpz.status.NORMAL)
                else
                    tpz.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_SW_PORTAL[1])
                end
            end
        elseif race == 5 or race == 6 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1]+4 or mobID == ID.mob.APOLLYON_SW_MOB[1]+9 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+4):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+9):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(tpz.status.NORMAL)
                else
                    tpz.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_SW_PORTAL[1])
                end
            end
        elseif race == 7 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1]+3 or mobID == ID.mob.APOLLYON_SW_MOB[1]+8 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+3):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+8):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(tpz.status.NORMAL)
                else
                    tpz.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_SW_PORTAL[1])
                end
            end
        elseif race == 8 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1]+1 or mobID == ID.mob.APOLLYON_SW_MOB[1]+6 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+1):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+6):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(tpz.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(tpz.status.NORMAL)
                else
                    tpz.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_SW_PORTAL[1])
                end
            end
        end
    end
end
