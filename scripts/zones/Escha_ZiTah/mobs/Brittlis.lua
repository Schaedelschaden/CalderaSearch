-----------------------------------
-- Area: Escha - Zitah
--   NM: Brittlis
-----------------------------------
 -- Requires are other scripts that this LUA will reference to satisfy values
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 692, hpp = 50}, -- uses specified mob skill at HP%
        },
    })
	mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 360)
    mob:SetAutoAttackEnabled(true)
	mob:SetMobSkillAttack(1195) -- Giant Gnat "normal" attacks
	mob:setMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 70) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 300) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 210) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 100) -- Accuracy (compare to EVA)
	-- mob:addMod(tpz.mod.MACC, 200) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 150) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 100) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.FASTCAST, 35) -- Fastcast in %
	mob:setMod(tpz.mod.DMG, -15)
	-- mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 10000)
	-- mob:setMod(tpz.mod.REGAIN, 200)
end

function onMobFight(mob, target) -- When mob is engaged
end

function onMobDeath(mob, player, isKiller) -- When mob is killed
    if player:getCharVar("Escha_Shockmaw_KI") == 0 or player:getCharVar("Escha_Shockmaw_KI") == nil then
        player:setCharVar("Escha_Shockmaw_KI", 1)
    elseif player:getCharVar("Escha_Shockmaw_KI") == 1 then
        player:addKeyItem(tpz.keyItem.SHOCKMAWS_BLUBBER)
        player:setCharVar("Escha_Shockmaw_KI", 0)
    end

    local playerName  = player:getName()
	local mobName     = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end
