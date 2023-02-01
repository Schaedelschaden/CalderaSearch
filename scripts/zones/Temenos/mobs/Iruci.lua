-----------------------------------
-- Area: Temenos Central Floor
--  Mob: Iruci
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
    if GetMobByID(ID.mob.TEMENOS_C_MOB[1]+3):isDead() then
        mob:addStatusEffect(tpz.effect.REGAIN, 7, 3, 0)
        mob:addStatusEffect(tpz.effect.REGEN, 50, 3, 0)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if GetMobByID(ID.mob.TEMENOS_C_MOB[1]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[1]+1):isDead() and
            GetMobByID(ID.mob.TEMENOS_C_MOB[1]+3):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[1]+4):isDead() and
            GetMobByID(ID.mob.TEMENOS_C_MOB[1]+5):isDead()
        then
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            GetNPCByID(ID.npc.TEMENOS_C_CRATE[1]):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.TEMENOS_C_CRATE[1]):setStatus(tpz.status.NORMAL)
        end
    end
end
