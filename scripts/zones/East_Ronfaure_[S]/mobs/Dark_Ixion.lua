-----------------------------------
-- Area: East Ronfaure (S)
--  Mob: Dark Ixion
--  ID: 17109367
--  !pos 236 -20 -323 81
-----------------------------------
mixins = {require("scripts/mixins/families/dark_ixion")}
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/pathfind")
-----------------------------------

local path = 
{
	195, -17, -331,
	204, -9, -377,
	159, -10, -401,
	161, 0, -477,
	109, 0, -519,
	158, 0, -521,
	124, 0, -500,
	187, 0, -441,
	246, 4, -459,
	297, 4, -454,
	313, 0, -519,
	274, 0, -517,
	356, -0, -520,
	331, -5, -417,
	378, -10, -405,
	401, -9, -366,
	438, -9, -393,
	500, -5, -363,
	494, -15, -266,
	461, -15, -248,
	457, -15, -219,
	387, -15, -220,
	374, -15, -257,
	382, -20, -312,
	360, -19, -347,
	297, -16, -357,
	293, 5, -451,
	235, -0, -432,
	198, -10, -353,
	223, -22, -303
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
    -- Behavior is handled in the mixin
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
			-- mob:setLocalVar("Chargetime", os.time() + 3)
			-- mob:PrintToArea("horn begins charging for an attack!",tpz.msg.channel.EMOTION, tpz.msg.area.SAY, "Dark Ixion's")
			local selectCharged = math.random(2)
			
			if selectCharged == 1 then
				mob:useMobAbility(2334) -- Wrath of Zeus
			else
				mob:useMobAbility(2335) -- Lightning Spear
			end
			
			mob:setLocalVar("Charging", 1)
		end
	end
	
	-- if (os.time() > mob:getLocalVar("Chargetime")) then
		-- local selectCharged = math.random(2)
			
		-- if selectCharged == 1 then
			-- mob:useMobAbility(2334) -- Wrath of Zeus
		-- else
			-- mob:useMobAbility(2335) -- Lightning Spear
		-- end
		
		-- mob:setLocalVar("Chargetime", os.time() + 600)
		-- mob:setLocalVar("Charging", 0)
	-- end
	
	if (mob:getBattleTime() % 7 == 0 and isBusy == false and target:isBehind(mob, 45) == true) then
		printf("Dark_ixion.lua East Ronfaure [S] onMobFight TARGET (%s) IS BEHIND MOB", target:getName())
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