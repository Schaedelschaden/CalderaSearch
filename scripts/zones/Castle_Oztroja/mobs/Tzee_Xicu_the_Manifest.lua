-----------------------------------
-- Area: Castle Oztroja
--   NM: Tzee Xicu the Manifest
-- TODO: messages should be zone-wide
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

local assistMobs = {
					17396119, 17396123, 17396126, 17396131, -- Yagudo Assassin (NIN)
					17396118, 17396122, 17396125, 17396130, -- Yagudo Conductor (BRD)
					17396115, 17396117, 17396121, 17396128, -- Yagudo Flagellant (MNK)
					17396127, 17396133,                     -- Yagudo High Priest (WHM)
					17396116, 17396120, 17396124, 17396129, -- Yagudo Prelate (BLM)
					17396132                                -- Yagudo Templar (SAM)
					}

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
	mob:setMod(tpz.mod.ATT, 1200)
	mob:setMod(tpz.mod.MATT, 700)
    mob:setMod(tpz.mod.ACC, 600)
	mob:setMod(tpz.mod.MACC, 700)
    mob:setMod(tpz.mod.EVA, 250)
	mob:setMod(tpz.mod.DEF, 800)
	mob:setMod(tpz.mod.MEVA, 300)
	mob:setMod(tpz.mod.MDEF, 250)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:setMod(tpz.mod.CRITHITRATE, 25)
	mob:setSpellList(0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobEngaged(mob, target)
	twoHrHPP = math.random(30, 55)

    mob:showText(mob, ID.text.YAGUDO_KING_ENGAGE)
	
	avatar = SpawnMob(17396139)
	avatar:setModelId(math.random(791, 798))
	avatar:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() - 3)
	avatar:untargetable(false)
    avatar:setUnkillable(false)
	
	local modelID = avatar:getModelId()
	local skillList
	
	switch (modelID) : caseof
	{
		 [791] = function (x) skillList = 34 end, -- Carbuncle
		 [792] = function (x) skillList = 36 end, -- Fenrir
		 [793] = function (x) skillList = 38 end, -- Ifrit
		 [794] = function (x) skillList = 45 end, -- Titan
		 [795] = function (x) skillList = 40 end, -- Leviathan
		 [796] = function (x) skillList = 37 end, -- Garuda
		 [797] = function (x) skillList = 44 end, -- Shiva
		 [798] = function (x) skillList = 43 end, -- Ramuh
	}
		
	avatar:setMobMod(tpz.mobMod.SKILL_LIST, skillList)
	
	if (avatar:getCurrentAction() == tpz.act.ROAMING) then
        avatar:updateEnmity(target)
    end
	
	for i = 1, 19 do
		local link = GetMobByID(assistMobs[i])
		
		if (link:getCurrentAction() == tpz.act.ROAMING) then
            link:updateEnmity(target)
        end
	end
end

function onMobFight(mob, target)
	local HPP = mob:getHPP()
	local has2Hrd = mob:getLocalVar("has2Hrd")

	if (HPP <= twoHrHPP and has2Hrd == 0) then
		local abilityID = nil
        local modelID = avatar:getModelId()
		
		mob:useMobAbility(734)

        switch (modelID) : caseof
        {
            [791] = function (x) abilityID = 919 end, -- Carbuncle
            [792] = function (x) abilityID = 839 end, -- Fenrir
            [793] = function (x) abilityID = 913 end, -- Ifrit
            [794] = function (x) abilityID = 914 end, -- Titan
            [795] = function (x) abilityID = 915 end, -- Leviathan
            [796] = function (x) abilityID = 916 end, -- Garuda
            [797] = function (x) abilityID = 917 end, -- Shiva
            [798] = function (x) abilityID = 918 end, -- Ramuh
        }

        if (abilityID ~= nil) then
            avatar:useMobAbility(abilityID)
			mob:setLocalVar("has2Hrd", 1)
        end
	end
	
	-- for i = 1, 19 do
		-- local link = GetMobByID(assistMobs[i])
		
		-- if (link:getCurrentAction() == tpz.act.ROAMING) then
            -- link:updateEnmity(target)
        -- end
	-- end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {duration = 60})
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.DEITY_DEBUNKER)
	
    if isKiller then
        mob:showText(mob, ID.text.YAGUDO_KING_DEATH)
    end
	
	DespawnMob(17396137)
	DespawnMob(17396139)
end

function onMobDespawn(mob)
	DespawnMob(17396137)
	DespawnMob(17396139)
end