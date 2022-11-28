-----------------------------------
-- Area: Escha - Zitah
--   NM: Fleetstalker
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 360)
    mob:SetAutoAttackEnabled(true)
	mob:SetMobSkillAttack(1196) -- Yztarg "normal" attacks
	-- mob:setMod(tpz.mod.PARALYZERES, 30)
    -- mob:setMod(tpz.mod.STUNRES, 70)
    -- mob:setMod(tpz.mod.BINDRES, 30)
    -- mob:setMod(tpz.mod.SLOWRES, 30)
    -- mob:setMod(tpz.mod.SILENCERES, 30)
    -- mob:setMod(tpz.mod.SLEEPRES, 30)
    -- mob:setMod(tpz.mod.LULLABYRES, 30)
    -- mob:setMod(tpz.mod.PETRIFYRES, 30)
    -- mob:setMod(tpz.mod.POISONRES, 30)
    mob:addMod(tpz.mod.STR, 75)
    mob:addMod(tpz.mod.DEX, 75)
    mob:addMod(tpz.mod.VIT, 75)
    mob:addMod(tpz.mod.AGI, 75)
    mob:addMod(tpz.mod.INT, 75)
    mob:addMod(tpz.mod.MND, 75)
    mob:addMod(tpz.mod.CHR, 75)
	mob:addMod(tpz.mod.ATT, 300)
	mob:addMod(tpz.mod.MATT, 250)
    mob:addMod(tpz.mod.ACC, 125)
	-- mob:addMod(tpz.mod.MACC, 300)
	mob:addMod(tpz.mod.EVA, 100)
	mob:addMod(tpz.mod.MEVA, 250)
	mob:setMod(tpz.mod.DMG, -15)
	-- mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 5000) -- 50% every 400 ms
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    local playerName  = player:getName()
	local mobName     = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end
