-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- Mob: Ullikummi
-- Pos: 740.0909, -99.4242, -580.0308, 205, 178
-- Force spawned using Diorite (ID: 2388)
-----------------------------------
-- Ullikummi exclusively uses Heavy Strike on a regular basis.
require("scripts/globals/status")

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 10)
end

function onMobFight(mob, target)
	local isBusy = false
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH then -- or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START
        isBusy = true -- Set to true if Ullikummi is in any stage of using a mobskill or casting a spell
    end
	
	if (mob:getBattleTime() > 30 and mob:getBattleTime() % 15 == 0 and isBusy == false) then
		mob:useMobAbility(675)
	end
end

function onMobWeaponSkill(target, mob, skill)
	
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_Ullikummi")
	local playerName = player:getName()
	local mobName = mob:getName()
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_Ullikummi", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
	
end