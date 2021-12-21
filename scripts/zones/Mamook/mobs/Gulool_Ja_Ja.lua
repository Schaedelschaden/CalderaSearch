-----------------------------------
-- Area: Mamook
--  Mob: Gulool Ja Ja
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
local ID = require("scripts/zones/Mamook/IDs")

-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
	mob:setMod(tpz.mod.ATT, 1200)
	mob:setMod(tpz.mod.MATT, 170)
    -- mob:setMod(tpz.mod.ACC, 500)
	mob:setMod(tpz.mod.MACC, 500)
    -- mob:setMod(tpz.mod.EVA, 1000)
	-- mob:setMod(tpz.mod.DEF, 800)
	-- mob:setMod(tpz.mod.MEVA, 200)
	-- mob:setMod(tpz.mod.MDEF, 100)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 40)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobEngaged(mob, target)
    for i = ID.mob.GULOOL_JA_JA + 1, ID.mob.GULOOL_JA_JA + 4 do
        SpawnMob(i):updateEnmity(target)
    end
end

function onMobFight(mob, target)
   	local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if Seiryu is in any stage of using a mobskill or casting a spell
    end
	
   	if (mob:getHPP() <= 35 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(731) -- Mijin Gakure
 		mob:setLocalVar("has2Hrd", 1)
	end
	
    if (mob:getBattleTime() % 60 < 2 and mob:getBattleTime() > 10) then
        if (not GetMobByID(ID.mob.GULOOL_JA_JA + 1):isSpawned()) then
            GetMobByID(ID.mob.GULOOL_JA_JA + 1):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GULOOL_JA_JA + 1):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.GULOOL_JA_JA + 2):isSpawned()) then
            GetMobByID(ID.mob.GULOOL_JA_JA + 2):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GULOOL_JA_JA + 2):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.GULOOL_JA_JA + 3):isSpawned()) then
            GetMobByID(ID.mob.GULOOL_JA_JA + 3):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GULOOL_JA_JA + 3):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.GULOOL_JA_JA + 4):isSpawned()) then
            GetMobByID(ID.mob.GULOOL_JA_JA + 4):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GULOOL_JA_JA + 4):updateEnmity(target)
        end
    end
	
    for i = ID.mob.GULOOL_JA_JA + 1, ID.mob.GULOOL_JA_JA + 4 do
        local pet = GetMobByID(i)
        if (pet:getCurrentAction() == tpz.act.ROAMING) then
            pet:updateEnmity(target)
        end
    end
end

function onMobDisengage(mob)
    for i = 1, 4 do DespawnMob(ID.mob.GULOOL_JA_JA + i) end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SHINING_SCALE_RIFLER)
    for i = 1, 4 do DespawnMob(ID.mob.GULOOL_JA_JA + i) end
end

function onMobDespawn(mob)
    for i = 1, 4 do DespawnMob(ID.mob.GULOOL_JA_JA + i) end
end