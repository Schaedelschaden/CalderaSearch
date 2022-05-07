-----------------------------------
-- Area: Outer Horutoto Ruins (194)
--  Mob: Voidwrought
-- Mob ID1: 17572219 !pos -260 0 740 194
-- Mob ID2: 17572220 !pos -380 0 740 194
-- Mob ID3: 17572221 !pos -480 0 760 194
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")

-----------------------------------

function onMobSpawn(mob)
	mob:SetAutoAttackEnabled(true)
	mob:SetMobSkillAttack(1181) -- Ironclad "normal" attacks
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.PETRIFYRES, 100)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
	mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
	mob:addMod(tpz.mod.ATT, 200)
	mob:addMod(tpz.mod.MATT, 80)
    -- mob:setMod(tpz.mod.ACC, 500)
	mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.EVA, 120)
	mob:addMod(tpz.mod.DEF, 500)
	-- mob:setMod(tpz.mod.MEVA, 200)
	-- mob:setMod(tpz.mod.MDEF, 100)
	mob:addMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end