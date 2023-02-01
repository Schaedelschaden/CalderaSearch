-----------------------------------
-- Area: Temenos E T
--  Mob: Light Elemental
-----------------------------------
local ID = require("scripts/zones/Temenos/IDs")

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

function onMobEngaged(mob, target)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2]+1 then
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):updateEnmity(target)
    elseif mobID == ID.mob.TEMENOS_C_MOB[2]+2 then
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        switch (mob:getID()): caseof
        {
            [ID.mob.TEMENOS_C_MOB[2]+1] = function()
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):isDead() then
                    GetNPCByID(ID.npc.TEMENOS_C_CRATE[2]):setStatus(tpz.status.NORMAL)
                end
            end,
            [ID.mob.TEMENOS_C_MOB[2]+2] = function()
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):isDead() then
                    GetNPCByID(ID.npc.TEMENOS_C_CRATE[2]):setStatus(tpz.status.NORMAL)
                end
            end,
        }
    end
end
