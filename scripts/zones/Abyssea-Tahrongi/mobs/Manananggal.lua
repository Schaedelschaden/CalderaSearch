-----------------------------------
-- Area: Abyssea - Tahrongi
--   NM: Manananggal
-----------------------------------
mixins = {require("scripts/mixins/families/qutrub")}
require("scripts/globals/pathfind")
-----------------------------------

local path =
{
	336, -7, -473,
	318, -8, -479,
	319, -7, -506,
	314.828, -7.541, -528.662,
	308.319, -1.693, -541.992,
	294.534, 5.204, -552.923,
	246.458, 7.996, -562.497,
	239.060, 14.969, -590.756,
	228.043, 14.395, -611.959,
	224.440, 14.363, -622.936,
	218.914, 14.268, -626.474,
	202.003, 15.635, -633.768,
	182.268, 19.187, -643.213,
	157.867, 24.195, -647.931,
	158.297, 24.000, -678.469,
	198.157, 16.000, -676.716,
	199.952, 16.000, -638.161,
	212.139, 14.487, -628.474,
	224.447, 14.245, -624.545,
	228.863, 14.576, -610.365,
	249.494, 16.062, -602.753,
	290.390, 9.792, -576.929,
	317.301, -0.102, -555.230,
	323.069, -7.829, -525.417,
	334.0714, -8.788, -496.932,
	355.683, -7.985, -482.370,
	367.402, -8.353, -468.092,
	360.689, -7.638, -451.258,
}

function onPath(mob)
    tpz.path.patrol(mob, path, tpz.path.flag.RUN)
end

function onMobRoam(mob)
    -- Move to start position if not moving
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(tpz.path.first(path), tpz.path.flag.NONE)
    end
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 35)
	mob:speed(70)
	mob:AnimationSub(1)
	
	onMobRoam(mob)
end

function onMobFight(mob, target)
	-- mob:AnimationSub(1) -- Knife sheathed
	-- mob:AnimationSub(6) -- Knife unsheathed
	local hpp = mob:getHPP()
	local animationChange = mob:getLocalVar("ANIMATION_CHANGE")
	
	if (hpp <= 90 and animationChange == 0) then
		mob:AnimationSub(6) -- Knife unsheathed
		mob:setLocalVar("ANIMATION_CHANGE", 1)
	elseif (hpp <= 80 and animationChange == 1) then
		mob:AnimationSub(1) -- Knife sheathed
		mob:useMobAbility(695)
		mob:setLocalVar("ANIMATION_CHANGE", 2)
	elseif (hpp <= 70 and animationChange == 2) then
		mob:AnimationSub(6) -- Knife unsheathed
		mob:setLocalVar("ANIMATION_CHANGE", 3)
	elseif (hpp <= 60 and animationChange == 3) then
		mob:AnimationSub(1) -- Knife sheathed
		mob:useMobAbility(695)
		mob:setLocalVar("ANIMATION_CHANGE", 4)
	elseif (hpp <= 50 and animationChange == 4) then
		mob:AnimationSub(6) -- Knife unsheathed
		mob:setLocalVar("ANIMATION_CHANGE", 5)
	elseif (hpp <= 40 and animationChange == 5) then
		mob:AnimationSub(1) -- Knife sheathed
		mob:useMobAbility(695)
		mob:setLocalVar("ANIMATION_CHANGE", 6)
	elseif (hpp <= 30 and animationChange == 6) then
		mob:AnimationSub(6) -- Knife unsheathed
		mob:setLocalVar("ANIMATION_CHANGE", 7)
	elseif (hpp <= 15 and animationChange == 7) then
		mob:useMobAbility(695)
		mob:setLocalVar("ANIMATION_CHANGE", 8)
	end
	
	if (mob:AnimationSub() == 1) then
		mob:speed(50)
		mob:setMod(tpz.mod.DELAY, 160)
		mob:setMod(tpz.mod.MAIN_DMG_RATING, -50)
		mob:setMod(tpz.mod.CRIT_DMG_INCREASE, 0)
	elseif (mob:AnimationSub() == 6) then
		
		mob:setMod(tpz.mod.DELAY, -8000)
		mob:setMod(tpz.mod.MAIN_DMG_RATING, 475)
		mob:setMod(tpz.mod.CRIT_DMG_INCREASE, 105)
	end
end

function onMobDisengage(mob)
	mob:setLocalVar("ANIMATION_CHANGE", 0)
end

function onMobDeath(mob, player, isKiller)
	
end