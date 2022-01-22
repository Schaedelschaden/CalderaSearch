-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel HM
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

local divineMightID = {17514521, 17514529, 17514537}
local aaID = {{17514522, 17514525, 17514526, 17514527},
			  {17514530, 17514533, 17514534, 17514535},
			  {17514538, 17514541, 17514542, 17514543}}

function onMobInitialize(mob)
    mob:addMod(tpz.mod.REGAIN, 50)
end

function onMobSpawn(mob)
	for i = 1, #divineMightID do
		if (mob:getID() == divineMightID[i]) then
			mob:setDropID(0)
		end
	end

    tpz.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            {id = tpz.jsa.MIGHTY_STRIKES},
            {id = tpz.jsa.MIJIN_GAKURE},
        },
    })
	mob:setMod(tpz.mod.PARALYZERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 50) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 100) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 50) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	-- mob:setMod(tpz.mod.ATT, 1500) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 150) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 800) -- Accuracy (compare to EVA)
	-- mob:setMod(tpz.mod.MACC, 700) -- Magic ACC (Compare to MEVA)
	-- mob:setMod(tpz.mod.EVA, 900) -- Evasion (Compare to ACC)
	-- mob:setMod(tpz.mod.DEF, 750) -- Defense (Compart to ATT)
	-- mob:setMod(tpz.mod.MEVA, 650)
	mob:setMod(tpz.mod.MDEF, 300) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 35) -- Double Attack in %
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 10) -- Triple Attack in %
	mob:setMod(tpz.mod.REGEN, 250)
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.DMG, -20)
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid, mobid+7 do
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
		
		-- printf("Ark_Angel_HM.lua onMobFight BATTLEFIELD ID: [%i]", battlefieldID)
		
		for i = 1, #aaID[battlefieldArea] do
			if (battlefieldID == 293 and GetMobByID(aaID[battlefieldArea][i]):isDead()) then
				droplistCounter = droplistCounter + 1
				-- printf("Ark_Angel_HM.lua onMobFight DROP LIST COUNTER: [%i]", droplistCounter)
			end
		end
		
		if (droplistCounter >= 4) then
			-- printf("Ark_Angel_HM.lua onMobFight DROP LIST COUNTER >= 4")
			mob:setDropID(3290)
			mob:setLocalVar("DROPLIST_SET", 1)
		end
	end
end

function onMobDeath(mob, player, isKiller)
	
end