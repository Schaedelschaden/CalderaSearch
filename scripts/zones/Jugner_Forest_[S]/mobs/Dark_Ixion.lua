-----------------------------------
-- Area: Jugner Forest (S)
--  Mob: Dark Ixion
--  ID: 17113468
--  !pos -191.510 -0.280 91.963 82
-----------------------------------
mixins = {require("scripts/mixins/families/dark_ixion")}
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/pathfind")
-----------------------------------

local path = 
{
	-156, 0, 88,
	-151, 0, 75,
	-106, -1, 71,
	-73, 0, 36,
	-32, -1, 32,
	4, 0, 10,
	23, 0, -14,
	46, -1, -53,
	95, 1, -81,
	159, 0, -41,
	136, -1, -15,
	93, 2, 21,
	36, 8, 19,
	24, 7, 25,
	10, 7, 59,
	-10, 7, 61,
	-47, 2, 60,
	-61, 2, 75,
	-60, 2, 87,
	-70, 2, 99,
	-104, 6, 99,
	-139, 5, 100,
	-166, 2, 100,
	-179, 2, 111,
	-179, 2, 125,
	-190, 2, 139,
	-210, 4, 141,
	-289, 10, 139,
	-299, 10, 126,
	-297, 7, 102,
	-300, 2, 80,
	-299, 7, 49,
	-301, 7, 30,
	-300, 2, 5,
	-300, 2, -9,
	-293, 3, -15,
	-283, 2, -17,
	-268, 2, -20,
	-258, 2, -34,
	-260, 4, -50,
	-257, 7, -92,
	-248, 7, -99,
	-226, 7, -103,
	-220, 7, -110,
	-221, 7, -130,
	-220, 2, -161,
	-159, 0, -161,
	-103, 0, -175,
	-65, -1, -210,
	-30, 0, -215,
	-16, 0, -228,
	-11, -1, -251,
	-20, 0, -300,
	-71, 0, -346,
	-79, 1, -378,
	-82, 1, -424,
	-89, -2, -438,
	-79, -8, -479,
	-80, -7, -506,
	-83, -8, -516,
	-78, -7, -537,
	-71, -8, -569,
	-42, -8, -566,
	-24, -7, -522,
	-29, -10, -493,
	-31, -9, -475,
	-29, -7, -463,
	-34, -2, -451,
	-11, 0, -397,
	-5, 1, -382,
	-7, 1, -358,
	41, 0, -358,
	42, 0, -242,
	9, 0, -227,
	-22, 0, -186,
	-50, 0, -184,
	-88, -1, -148,
	-137, -1, -141,
	-151, 0, -118,
	-197, 1, -101,
	-207, 0, -82,
	-220, 1, -77,
	-223, -3, -61,
	-235, 0, -39,
	-240, 0, -1,
	-273, 0, 25,
	-266, -1, 66,
	-221, 1, 79,
	-206, 0, 77
}

function onPath(mob)
    tpz.path.patrol(mob, path, tpz.path.flag.RUN)
--	printf("dark_ixion.lua onPath EAST RONFAURE PATHING")
end

function onMobRoam(mob)
    -- Move to start position if not moving
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(tpz.path.first(path), tpz.path.flag.NONE)
    end
end

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
	
	onMobRoam(mob)
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