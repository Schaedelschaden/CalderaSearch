-----------------------------------
-- Area: Navukgo Execution Chamber
--  Mob: Immortal Flan
-----------------------------------
require("scripts/globals/battlefield")
local ID = require("scripts/zones/Navukgo_Execution_Chamber/IDs")
----------------------------------------

function onMobSpawn(mob)
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
	mob:addMod(tpz.mod.EVA, 150) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 100) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.STR, 130)
    mob:addMod(tpz.mod.DEX, 130)
    mob:addMod(tpz.mod.AGI, 130)
    mob:addMod(tpz.mod.VIT, 130)
    mob:addMod(tpz.mod.MND, 130)
    mob:addMod(tpz.mod.CHR, 130)
    mob:addMod(tpz.mod.INT, 130)
    mob:addMod(tpz.mod.FASTCAST, 130)
end

function onMobEngaged(mob, target)
    local bf = mob:getBattlefield()
    local mobOffset = (bf:getArea() - 1) * 7
    if not (bf:getLocalVar('flans_spawned') == 1) then
        local entrants = bf:getLocalVar('num_entrants')
        if entrants >= 4 then
            GetMobByID(ID.mob.IMMORTAL_FLAN2 + mobOffset):spawn()
        end
        if entrants >= 7 then
            GetMobByID(ID.mob.IMMORTAL_FLAN3 + mobOffset):spawn()
        end
        if entrants >= 10 then
            GetMobByID(ID.mob.IMMORTAL_FLAN4 + mobOffset):spawn()
        end
        if entrants >= 13 then
            GetMobByID(ID.mob.IMMORTAL_FLAN5 + mobOffset):spawn()
        end
        if entrants >= 16 then
            GetMobByID(ID.mob.IMMORTAL_FLAN6 + mobOffset):spawn()
        end
        bf:setLocalVar('flans_spawned', 1)
    end
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
end
