-----------------------------------
-- Area: Sealion's Den
--  Mob: Tenzen
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs")
-----------------------------------


function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
  	mob:addMod(tpz.mod.ACC, 100)
	mob:setMod(tpz.mod.MACC, 850)
	mob:addMod(tpz.mod.MATT, 90)
	mob:addMod(tpz.mod.EVA, 20)
	mob:setMod(tpz.mod.REGEN, 250)
	mob:setMod(tpz.mod.STORETP, 75)
	mob:setMod(tpz.mod.REGAIN, 20)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:setMod(tpz.mod.COUNTER, 20)
	mob:setMod(tpz.mod.CONSERVE_TP, 100)
    mob:setMod(tpz.mob.ALL_WSDMG_ALL_HITS, 30)
end

function onMobEngaged(mob, target)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)

    -- three tarus fight with tenzen
    -- local mobId = mob:getID()
    -- local offset = mobId - ID.mob.WARRIORS_PATH_OFFSET
    -- if (offset >= 0 and offset <= 8) then
        -- for i = mobId + 1, mobId + 3 do
            -- GetMobByID(i):updateEnmity(target)
        -- end
    -- end
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller)
	
end