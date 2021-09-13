-----------------------------------
-- Area: King Ranperre's Tomb
--   NM: Hahava
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Petrify
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	mob:addMod(tpz.mod.MATT, 80)	
	mob:addMod(tpz.mod.DEF, 500)
	mob:addMod(tpz.mod.EVA, 120)
	-- mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 200)
	mob:addMod(tpz.mod.REFRESH, 50)
	mob:addMod(tpz.mod.REGAIN, 100)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
	
	mob:AnimationSub(math.random(1, 2))
end

function onMobFight(mob, target)
	-- Yaksha Stance
    if (mob:AnimationSub() == 1) then
		mob:setMod(tpz.mod.DMGPHYS, -50)
		mob:setMod(tpz.mod.DMGMAGIC, 0)
	-- Raksha Stance
	elseif (mob:AnimationSub() == 2) then
		mob:setMod(tpz.mod.DMGPHYS, 0)
		mob:setMod(tpz.mod.DMGMAGIC, -50)
	end
end

function onMobDeath(mob, player, isKiller)
	
end