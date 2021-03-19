-----------------------------------
-- Area: Arrapago Reef
--   NM: Medusa
-- !pos -458 -20 458
-- TODO: resists, attack/def boosts
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 738, hpp = 60}, -- uses EES once between at 60% HPP.
        },
    })
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
	mob:setMod(tpz.mod.ATT, 1200)
	mob:setMod(tpz.mod.MATT, 400)
    mob:setMod(tpz.mod.ACC, 900)
	mob:setMod(tpz.mod.RACC, 1500)
	mob:setMod(tpz.mod.MACC, 500)
    mob:setMod(tpz.mod.EVA, 300)
	mob:setMod(tpz.mod.DEF, 800)
	mob:setMod(tpz.mod.MEVA, 300)
	mob:setMod(tpz.mod.MDEF, 300)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:setMod(tpz.mod.TRIPLE_SHOT_RATE, 25)
end

function onMobEngaged(mob, target)
    target:showText(mob, ID.text.MEDUSA_ENGAGE)
    for i = ID.mob.MEDUSA + 1, ID.mob.MEDUSA + 4 do
        SpawnMob(i):updateEnmity(target)
    end
end

function onMobFight(mob, target)
    if (mob:getBattleTime() % 60 < 2 and mob:getBattleTime() > 10) then
        if (not GetMobByID(ID.mob.MEDUSA + 1):isSpawned()) then
            GetMobByID(ID.mob.MEDUSA + 1):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.MEDUSA + 1):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.MEDUSA + 2):isSpawned()) then
            GetMobByID(ID.mob.MEDUSA + 2):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.MEDUSA + 2):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.MEDUSA + 3):isSpawned()) then
            GetMobByID(ID.mob.MEDUSA + 3):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.MEDUSA + 3):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.MEDUSA + 4):isSpawned()) then
            GetMobByID(ID.mob.MEDUSA + 4):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.MEDUSA + 4):updateEnmity(target)
        end
    end
    for i = ID.mob.MEDUSA + 1, ID.mob.MEDUSA + 4 do
        local pet = GetMobByID(i)
        if (pet:getCurrentAction() == tpz.act.ROAMING) then
            pet:updateEnmity(target)
        end
    end
end

function onMobDisengage(mob)
    for i = 1, 4 do DespawnMob(ID.mob.MEDUSA + i) end
end

function onMobDeath(mob, player, isKiller)
    player:showText(mob, ID.text.MEDUSA_DEATH)
    player:addTitle(tpz.title.GORGONSTONE_SUNDERER)
    for i = 1, 4 do DespawnMob(ID.mob.MEDUSA + i) end
end

function onMobDespawn(mob)
    for i = 1, 4 do DespawnMob(ID.mob.MEDUSA + i) end
end
