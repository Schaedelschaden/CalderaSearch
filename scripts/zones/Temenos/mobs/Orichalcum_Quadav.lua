-----------------------------------
-- Area: Temenos
--  Mob: Orichalcum Quadav
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
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
    if GetMobByID(ID.mob.TEMENOS_C_MOB[3]+12):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+13):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+14):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+15):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+16):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+17):isDead()
    then
        mob:setMod(tpz.mod.SLASHRES, 1400)
        mob:setMod(tpz.mod.PIERCERES, 1400)
        mob:setMod(tpz.mod.IMPACTRES, 1400)
        mob:setMod(tpz.mod.HTHRES, 1400)
    else
        mob:setMod(tpz.mod.SLASHRES, 300)
        mob:setMod(tpz.mod.PIERCERES, 300)
        mob:setMod(tpz.mod.IMPACTRES, 300)
        mob:setMod(tpz.mod.HTHRES, 300)
    end
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]+2):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if GetMobByID(ID.mob.TEMENOS_C_MOB[3]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):isDead() and
            GetMobByID(ID.mob.TEMENOS_C_MOB[3]+2):isDead()
        then
            GetNPCByID(ID.npc.TEMENOS_C_CRATE[3]):setStatus(tpz.status.NORMAL)
        end
    end
end
