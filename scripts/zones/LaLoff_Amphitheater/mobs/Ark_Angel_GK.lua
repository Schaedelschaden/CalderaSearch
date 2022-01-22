-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel GK
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

local divineMightID = {17514527, 17514535, 17514543}
local aaID = {{17514521, 17514522, 17514525, 17514526},
			  {17514529, 17514530, 17514533, 17514534},
			  {17514537, 17514538, 17514541, 17514542}}

function onMobSpawn(mob)
	for i = 1, #divineMightID do
		if (mob:getID() == divineMightID[i]) then
			mob:setDropID(0)
		end
	end

    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.CALL_WYVERN, hpp = 100, cooldown = 60}, -- "Call Wyvern is used at the time of monster engage. Call Wyvern is used ~1 minute subsequent to Wyvern's death."
            {id = tpz.jsa.MEIKYO_SHISUI, hpp = math.random(90, 95), cooldown = 90}, -- "Meikyo Shisui is used very frequently."
        },
    })
	mob:setMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 40) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 100) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 50) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	-- mob:setMod(tpz.mod.ATT, 1000) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 1100) -- Accuracy (compare to EVA)
	-- mob:setMod(tpz.mod.MACC, 400) -- Magic ACC (Compare to MEVA)
	-- mob:setMod(tpz.mod.EVA, 1000) -- Evasion (Compare to ACC)
	-- mob:setMod(tpz.mod.DEF, 1000) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 650)-- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 250) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 50) -- Double Attack in %
	mob:setMod(tpz.mod.COUNTER, 50) -- Counter Attack
	mob:setMod(tpz.mod.COUNTER_DMG, 50) -- Counter Damage
	mob:setMod(tpz.mod.REGEN, 250)
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.DMG, -20)
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid-6, mobid+1 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobFight(mob, target)
	if (mob:getLocalVar("DROPLIST_SET") == 0) then
		local battlefield = target:getBattlefield()
		local battlefieldID = battlefield:getID()
		local battlefieldArea = battlefield:getArea()
		local droplistCounter = 0
		
		-- printf("Ark_Angel_GK.lua onMobFight BATTLEFIELD ID: [%i]", battlefieldID)
		
		for i = 1, #aaID[battlefieldArea] do
			if (battlefieldID == 293 and GetMobByID(aaID[battlefieldArea][i]):isDead()) then
				droplistCounter = droplistCounter + 1
				-- printf("Ark_Angel_GK.lua onMobFight DROP LIST COUNTER: [%i]", droplistCounter)
			end
		end
		
		if (droplistCounter >= 4) then
			-- printf("Ark_Angel_GK.lua onMobFight DROP LIST COUNTER >= 4")
			mob:setDropID(3290)
			mob:setLocalVar("DROPLIST_SET", 1)
		end
	end
end

function onMobDeath(mob, player, isKiller)
	
end