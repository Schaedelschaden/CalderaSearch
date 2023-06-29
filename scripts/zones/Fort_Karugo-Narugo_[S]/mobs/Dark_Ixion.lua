-----------------------------------
-- Area: Fort Karugo Narugo (S)
--  Mob: Dark Ixion
--  ID: 17170649
--  !pos -237.169 -60.711 -237.419 96
-----------------------------------
mixins = {require("scripts/mixins/families/dark_ixion")}
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/pathfind")
-----------------------------------

function onMobSpawn(mob)
	SetServerVariable("Dark_Ixion_Alive", 1)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
    mob:setMod(tpz.mod.FRONTAL_DMG_REDUCTION, 75)
    mob:setMod(tpz.mod.SIDE_DMG_REDUCTION, 25)
    mob:setMod(tpz.mod.DMGMAGIC, -25)
    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.FASTCAST, 40)
    mob:setMod(tpz.mod.BINDRES, 90)
    mob:setMod(tpz.mod.SLOWRES, 35)
    mob:setMod(tpz.mod.STUNRES, 85)
    mob:setMod(tpz.mod.PETRIFYRES, 50)
    mob:setMod(tpz.mod.SILENCERES, 85)
    mob:setMod(tpz.mod.SLEEPRES, 85)
    mob:setMod(tpz.mod.LULLABYRES, 85)
    mob:addMod(tpz.mod.ATT, 1800)
    mob:addMod(tpz.mod.MATT, 500)
    mob:addMod(tpz.mod.ACC, 1100)
    mob:addMod(tpz.mod.MACC, 1100)
    mob:addMod(tpz.mod.EVA, 1050)
    mob:addMod(tpz.mod.DEF, 1000)
    mob:addMod(tpz.mod.MEVA, math.random(930, 1170))
    mob:addMod(tpz.mod.MDEF, 300)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 100)
    mob:setMod(tpz.mod.REGAIN, 200)
    mob:addMod(tpz.mod.CRITHITRATE, 25)
    mob:addMod(tpz.mod.CRIT_HIT_EVASION, math.random(15, 25))

	-- onMobRoam(mob)
end

function onMobEngaged(mob, target)
--	mob:setMod(tpz.mod.MOVE, 90)
end

function onMobFight(mob, target)
    local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	local chargedSkill = math.random(100)
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true 
    end
	
	if (mob:getBattleTime() % 15 == 0 and mob:getLocalVar("Charging") == 0 and isBusy == false and target:isBehind(mob, 120) == false) then
		if (chargedSkill > 75) then
			local selectCharged = math.random(2)
			
			if selectCharged == 1 then
				mob:useMobAbility(2334) -- Wrath of Zeus
			else
				mob:useMobAbility(2335) -- Lightning Spear
			end
			
			mob:setLocalVar("Charging", 1)
		end
	end
	
	
	if (mob:getBattleTime() % 7 == 0 and isBusy == false and target:isBehind(mob, 45) == true) then
		mob:useMobAbility(2336) -- Acheron Kick
	end
	
	-- 2hrs (Blood Weapon & Chainspell)
	if (mob:getHPP() <= 90 and isBusy == false and has2Hrd < 1) then
		mob:useMobAbility(695)
		mob:setLocalVar("has2Hrd", 1)
	elseif (mob:getHPP() <= 70 and isBusy == false and has2Hrd < 2) then
		mob:useMobAbility(692)
		mob:setLocalVar("has2Hrd", 2)
	elseif (mob:getHPP() <= 50 and isBusy == false and has2Hrd < 3) then
		mob:useMobAbility(695)
		mob:setLocalVar("has2Hrd", 3)
	elseif (mob:getHPP() <= 30 and isBusy == false and has2Hrd < 4) then
		mob:useMobAbility(692)
		mob:setLocalVar("has2Hrd", 4)
	end
	
	if (mob:getHPP() <= 20) then
		mob:setMod(tpz.mod.CRITHITRATE, 100)
		mob:setMod(tpz.mod.QUAD_ATTACK, 15)
	end
end

function onMobDeath(mob, player, isKiller)
	-- Respawn timer is handled in mixin
    player:addTitle(tpz.title.IXION_HORNBREAKER)
end