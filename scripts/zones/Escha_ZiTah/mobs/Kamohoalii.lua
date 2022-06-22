-----------------------------------
-- Area: Escha - Zitah
--   NM: Kamohoalii
-----------------------------------
 -- Requires are other scripts that this LUA will reference to satisfy values
-- mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:addListener("EFFECT_LOSE", "SKILLCHAIN", function(mob, effect) -- Lose Lamps
        if (effect:getType() == tpz.effect.SKILLCHAIN and effect:getTier() > 0) then
            mob:setLocalVar("LampCut", os.time())
        end
    end)
	
	mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 360)
	mob:setMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 70) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	-- mob:setMod(tpz.mod.ATT, 900) -- Attack Stat (Compare to DEF)
	-- mob:setMod(tpz.mod.MATT, 150) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 800) -- Accuracy (compare to EVA)
	-- mob:setMod(tpz.mod.MACC, 900) -- Magic ACC (Compare to MEVA)
	-- mob:setMod(tpz.mod.EVA, 700) -- Evasion (Compare to ACC)
	-- mob:setMod(tpz.mod.DEF, 900) -- Defense (Compart to ATT)
	-- mob:setMod(tpz.mod.MEVA, 800) -- Magic Evasion (Compare to MACC)
	-- mob:setMod(tpz.mod.MDEF, 400) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.FASTCAST, 35) -- Fastcast in %
	mob:setMod(tpz.mod.DMG, -15)
	-- mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
	mob:setMod(tpz.mod.REGAIN, 30)
	mob:AnimationSub(0)
	mob:setLocalVar("LampCut", 0)
end

function onMobFight(mob, target) -- When mob is engaged
	-- mob:AnimationSub(0) -- Lanterns uncut
	-- mob:AnimationSub(1) -- Lanterns cut
	
	if (mob:getLocalVar("LampCut") == 0) then
		mob:AnimationSub(0)
	else
		mob:AnimationSub(1)
	end

	
	if ((mob:getLocalVar("LampCut") ~= 0) and os.time() - mob:getLocalVar("LampCut") > 120) then -- 2 minute Regain Lamps
		mob:setLocalVar("LampCut", 0)
	end
end

function onMobDeath(mob, player, isKiller) -- When mob is killed
	mob:removeListener("SKILLCHAIN")
end