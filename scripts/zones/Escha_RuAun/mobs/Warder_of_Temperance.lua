-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--   NM: Jailer of Temperance
-----------------------------------
require("scripts/zones/Grand_Palace_of_HuXzoi/globals")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobSpawn(mob)
    -- Set AnimationSub to 0, put it in pot form
    -- Change it's damage resists. Pot for take

    -- Change animation to pot
    mob:AnimationSub(0)
    -- Set the damage resists
    mob:setMod(tpz.mod.HTHRES, 1000)
    mob:setMod(tpz.mod.SLASHRES, 0)
    mob:setMod(tpz.mod.PIERCERES, 0)
    mob:setMod(tpz.mod.IMPACTRES, 1000)
	mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 250)
	mob:addMod(tpz.mod.EVA, 175)
	mob:addMod(tpz.mod.DEF, 275)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
    -- Set the magic resists. It always takes no damage from direct magic
    for n =1, #tpz.magic.resistMod, 1 do
        mob:setMod(tpz.magic.resistMod[n], 0)
    end
    for n =1, #tpz.magic.defenseMod, 1 do
        mob:setMod(tpz.magic.defenseMod[n], 1000)
    end
end

function onMobFight(mob)
    -- Forms: 0 = Pot (Blunt/H2H only) 1 = Pot (Blunt/H2H only) 2 = Poles (Piercing Only) 3 = Rings (Slashing only)
	local PotAbilities = {1463, 1465} -- Reactor Cool, Optic Induration
	local PolesAbilities = {1463, 1466, 1467} -- Reactor Cool, Static Filament, Decayed Filament
	local RingsAbilities = {1463, 1468, 1469} -- Reactor Cool, Reactor Overload, Reactor Overheat
	
    local randomTime = math.random(30, 180)
    local changeTime = mob:getLocalVar("changeTime")
	local twoHours = mob:getLocalVar("2hrs")
	local isBusy = false
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START
	   or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if mob is in any stage of using a mobskill or casting a spell
    end

    -- If we're in a pot form, but going to change to either Rings/Poles
    if ((mob:AnimationSub() == 0 or mob:AnimationSub() == 1) and mob:getBattleTime() - changeTime > randomTime) then
        local aniChange = math.random(2, 3)
        mob:AnimationSub(aniChange)

        -- We changed to Poles. Make it only take piercing.
        if (aniChange == 2) then
            mob:setMod(tpz.mod.HTHRES, 0)
            mob:setMod(tpz.mod.SLASHRES, 0)
            mob:setMod(tpz.mod.PIERCERES, 1000)
            mob:setMod(tpz.mod.IMPACTRES, 0)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        else -- We changed to Rings. Make it only take slashing.
            mob:setMod(tpz.mod.HTHRES, 0)
            mob:setMod(tpz.mod.SLASHRES, 1000)
            mob:setMod(tpz.mod.PIERCERES, 0)
            mob:setMod(tpz.mod.IMPACTRES, 0)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    -- We're in poles, but changing
    elseif (mob:AnimationSub() == 2 and mob:getBattleTime() - changeTime > randomTime) then
        local aniChange = math.random(0, 1)

        -- Changing to Pot, only take Blunt damage
        if (aniChange == 0) then
            mob:AnimationSub(0)
            mob:setMod(tpz.mod.HTHRES, 1000)
            mob:setMod(tpz.mod.SLASHRES, 0)
            mob:setMod(tpz.mod.PIERCERES, 0)
            mob:setMod(tpz.mod.IMPACTRES, 1000)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        else -- Going to Rings, only take slashing
            mob:AnimationSub(3)
            mob:setMod(tpz.mod.HTHRES, 0)
            mob:setMod(tpz.mod.SLASHRES, 1000)
            mob:setMod(tpz.mod.PIERCERES, 0)
            mob:setMod(tpz.mod.IMPACTRES, 0)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    -- We're in rings, but going to change to pot or poles
    elseif (mob:AnimationSub() == 3 and mob:getBattleTime() - changeTime > randomTime) then
        local aniChange = math.random(0, 2)
        mob:AnimationSub(aniChange)

        -- We're changing to pot form, only take blunt damage.
        if (aniChange == 0 or aniChange == 1) then
            mob:setMod(tpz.mod.HTHRES, 1000)
            mob:setMod(tpz.mod.SLASHRES, 0)
            mob:setMod(tpz.mod.PIERCERES, 0)
            mob:setMod(tpz.mod.IMPACTRES, 1000)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        else -- Changing to poles, only take piercing
            mob:setMod(tpz.mod.HTHRES, 0)
            mob:setMod(tpz.mod.SLASHRES, 0)
            mob:setMod(tpz.mod.PIERCERES, 1000)
            mob:setMod(tpz.mod.IMPACTRES, 0)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    end
	
	if (mob:getHPP() <= 80 and twoHours == 0) then
		mob:useMobAbility(730)
		mob:setLocalVar("2hrs", 1)
	elseif (mob:getHPP() <= 60 and twoHours == 1) then
		mob:useMobAbility(730)
		mob:setLocalVar("2hrs", 2)
	elseif (mob:getHPP() <= 40 and twoHours == 2) then
		mob:useMobAbility(730)
		mob:setLocalVar("2hrs", 3)
	elseif (mob:getHPP() <= 20 and twoHours == 3) then
		mob:useMobAbility(730)
		mob:setLocalVar("2hrs", 4)
	end
	
	if (isBusy == false and mob:hasStatusEffect(tpz.effect.MEIKYO_SHISUI)) then		
		-- Forms: 0 = Pot (Blunt/H2H only) 1 = Pot (Blunt/H2H only) 2 = Poles (Piercing Only) 3 = Rings (Slashing only)
		if (mob:AnimationSub() == 0 or mob:AnimationSub() == 1) then
			mob:useMobAbility(PotAbilities[math.random(#PotAbilities)])
			mob:useMobAbility(PotAbilities[math.random(#PotAbilities)])
			mob:useMobAbility(PotAbilities[math.random(#PotAbilities)])
			mob:delStatusEffect(tpz.effect.MEIKYO_SHISUI)
		elseif (mob:AnimationSub() == 2) then
			mob:useMobAbility(PolesAbilities[math.random(#PolesAbilities)])
			mob:useMobAbility(PolesAbilities[math.random(#PolesAbilities)])
			mob:useMobAbility(PolesAbilities[math.random(#PolesAbilities)])
			mob:delStatusEffect(tpz.effect.MEIKYO_SHISUI)
		elseif (mob:AnimationSub() == 3) then
			mob:useMobAbility(RingsAbilities[math.random(#RingsAbilities)])
			mob:useMobAbility(RingsAbilities[math.random(#RingsAbilities)])
			mob:useMobAbility(RingsAbilities[math.random(#RingsAbilities)])
			mob:delStatusEffect(tpz.effect.MEIKYO_SHISUI)
		end
	end
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_JailOfTemp")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_JailOfTemp", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    local ph = mob:getLocalVar("ph")
	mob:setLocalVar("2hrs", 0)
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(ph, false)
    GetMobByID(ph):setRespawnTime(GetMobRespawnTime(ph))
    mob:setLocalVar("pop", os.time() + 900) -- 15 mins
    GRAND_PALACE_OF_HUXZOI.pickTemperancePH()
end