-----------------------------------
-- Area: Apollyon SE
--  Mob: Tieholtsodi
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/pathfind")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Apollyon/IDs")
local flags = tpz.path.flag.WALLHACK
local path =
{
        {149.587, -0.293, -526.395},
        {145.010, 0.000, -438.159}
}

function onMobRoam(mob)
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 2)+1
        mob:setLocalVar("point", point)
        mob:pathTo(path[point][1], path[point][2], path[point][3], flags)
        mob:setLocalVar("pause", os.time()+40)
    end
end

function onMobInitialize( mob )
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.HUNDRED_FISTS, hpp = 50},
        },
    })
	mob:setMod(tpz.mod.SLASHRES, 0)
    mob:setMod(tpz.mod.PIERCERES, 1500)
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
	mob:addMod(tpz.mod.ATT, 100) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 160) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 300) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 300) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 150) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.STR, 150)
	mob:addMod(tpz.mod.REGAIN, 200)
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 100
	params.chance = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        tpz.limbus.handleDoors(mob:getBattlefield(), true, ID.npc.APOLLYON_SE_PORTAL[2])
    end
end