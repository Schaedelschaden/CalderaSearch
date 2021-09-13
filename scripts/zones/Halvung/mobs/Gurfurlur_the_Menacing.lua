-----------------------------------
-- Area: Halvung
--  Mob: Gurfurlur the Menacing
-- !pos -59.000 -23.000 3.000 62
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 80)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 70)
	mob:setMod(tpz.mod.ATT, 2000)
	mob:setMod(tpz.mod.MATT, 200)
    mob:addMod(tpz.mod.ACC, 100)
	-- mob:setMod(tpz.mod.MACC, 500)
	-- mob:setMod(tpz.mod.DEF, 1300)
	-- mob:setMod(tpz.mod.MDEF, 1000)
	-- mob:setMod(tpz.mod.EVA, 850)
	-- mob:setMod(tpz.mod.MEVA, 650)
	mob:setMod(tpz.mod.CRITHITRATE, 25)
	mob:setMod(tpz.mod.CRIT_DMG_INCREASE, -10)
	mob:setMod(tpz.mod.COUNTER, 50)
end

function onMobEngaged(mob, target)
    for i = ID.mob.GURFURLUR_THE_MENACING + 1, ID.mob.GURFURLUR_THE_MENACING + 4 do
        SpawnMob(i):updateEnmity(target)
    end
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.CRITHITRATE, 25)
	mob:setMod(tpz.mod.CRIT_DMG_INCREASE, -10)
   	local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if mob is in any stage of using a mobskill or casting a spell
    end
   	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(690) -- Hundred Fists
		mob:setLocalVar("has2Hrd", 1)
	end
    if mob:getBattleTime() % 60 < 2 and mob:getBattleTime() > 10 then
        if not GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 1):isSpawned() then
            GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 1):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GURFURLUR_THE_MENACING + 1):updateEnmity(target)
        elseif not GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 2):isSpawned() then
            GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 2):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GURFURLUR_THE_MENACING + 2):updateEnmity(target)
        elseif not GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 3):isSpawned() then
            GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 3):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GURFURLUR_THE_MENACING + 3):updateEnmity(target)
        elseif not GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 4):isSpawned() then
            GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 4):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GURFURLUR_THE_MENACING + 4):updateEnmity(target)
        end
    end

    for i = ID.mob.GURFURLUR_THE_MENACING + 1, ID.mob.GURFURLUR_THE_MENACING + 4 do
        local pet = GetMobByID(i)

        if pet:getCurrentAction() == tpz.act.ROAMING then
            pet:updateEnmity(target)
        end
    end
end

function onMobDisengage(mob)
    for i = 1, 4 do DespawnMob(ID.mob.GURFURLUR_THE_MENACING + i) end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.TROLL_SUBJUGATOR)
    for i = 1, 4 do DespawnMob(ID.mob.GURFURLUR_THE_MENACING + i) end
end

function onMobDespawn(mob)
    for i = 1, 4 do DespawnMob(ID.mob.GURFURLUR_THE_MENACING + i) end
end
