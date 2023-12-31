-----------------------------------
-- Area: VeLugannon Palace
--  Mob: Zipacna
-----------------------------------
require("scripts/globals/pathfind")

local path =
{
    -202, 0, 391,
    -209, 0, 387,
    -214, 0, 381,
    -238, 0, 380,
    -256, 4, 381,
    -261, 8, 400,
    -257, 12, 417,
    -240, 16, 420,
    -257, 12, 417,
    -261, 8, 400,
    -256, 4, 381,
    -238, 0, 380,
    -214, 0, 381,
    -209, 0, 387,
    -194, 0, 388,
    -179, 0, 379,
    -134, 0, 379,
    -115, 0, 417,
    -112, 0, 454,
    -105, 0, 460,
    -80, 0, 460,
    -65, 0, 459,
    -60, 0, 452,
    -59, 0, 420,
    59, 0, 420,
    60, 0, 429,
    60, 0, 445,
    62, 0, 456,
    78, 0, 460,
    108, 0, 458,
    132, 0, 381,
    185, 0, 380,
    199, 0, 391,
    218, 0, 380,
    259, 4, 383,
    258, 12, 418,
    248, 14, 420,
    219, 16, 420,
    248, 14, 420,
    258, 12, 418,
    259, 4, 383,
    218, 0, 380,
    199, 0, 391,
    185, 0, 380,
    132, 0, 381,
    108, 0, 458,
    78, 0, 460,
    62, 0, 456,
    60, 0, 445,
    60, 0, 429,
    59, 0, 420,
    -59, 0, 420,
    -60, 0, 452,
    -65, 0, 459,
    -80, 0, 460,
    -105, 0, 460,
    -112, 0, 454,
    -115, 0, 417,
    -134, 0, 379,
    -179, 0, 379,
    -191, 0, 385,
    -195, 0, 396,
    -202, 0, 391,
    -209, 0, 387,
    -214, 0, 381,
    -238, 0, 380,
    -256, 4, 381,
    -261, 8, 400,
    -257, 12, 417,
    -240, 16, 420,
    -257, 12, 417,
    -261, 8, 400,
    -256, 4, 381,
    -238, 0, 380,
    -214, 0, 381,
    -209, 0, 387,
    -202, 0, 391,
}

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REGAIN, 500)
    onMobRoam(mob)
end

function onPath(mob)
    tpz.path.patrol(mob, path, tpz.path.flag.RUN)
end

function onMobRoam(mob)
    -- move to start position if not moving
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(tpz.path.first(path), tpz.path.flag.RUN)
    end
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REGAIN, 500)
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_Zipacna")
	local playerName = player:getName()
	local mobName = mob:getName()
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_Zipacna", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(6900, 7500)) -- 115-125 minutes
end