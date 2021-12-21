-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Goji
-----------------------------------
-- mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 50)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 50)
	mob:setMod(tpz.mod.PETRIFYRES, 100)
	mob:addMod(tpz.mod.ATT, 200)
	mob:addMod(tpz.mod.MATT, 125)
    mob:addMod(tpz.mod.ACC, 190)
	mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.EVA, 137)
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.MEVA, 200)
	-- mob:addMod(tpz.mod.MDEF, 100)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	mob:SetMobSkillAttack(1172)
	
	mob:setLocalVar("changeHP", 600000)
end


function onMobEngaged(mob, target)

end

function onMobFight(mob, target)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	-- mob:SetAutoAttackEnabled(true)
	local changeHP = mob:getLocalVar("changeHP")
	
	if (mob:AnimationSub() == 0 and (mob:getHP() <= changeHP - 50000)) then
		mob:AnimationSub(1)
		mob:setLocalVar("changeHP", mob:getHP())
	elseif (mob:AnimationSub() == 1 and (mob:getHP() <= changeHP - 50000)) then
		mob:AnimationSub(0)
		mob:setLocalVar("changeHP", mob:getHP())
	end
	
	if (mob:AnimationSub() == 0) then
		mob:SetMobSkillAttack(1172) -- Mob Skill List 1172 has Bloody Claw
	else
		mob:SetMobSkillAttack(1173) -- Mob Skill List 1173 has Dark Mist & Dark Orb
	end
end

function onMobDisengaged(mob, target)
	mob:AnimationSub(0)
	mob:setLocalVar("changeHP", 600000)
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
	
end