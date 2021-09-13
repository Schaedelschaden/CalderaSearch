---------------------------------------------------------------------------------------------------
-- func: !test
-- desc: Use this to test LUA functions
---------------------------------------------------------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/ability")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(player)

---------------------------------------------------------------------------------------------------

-- Test Random Number Generator
	for i = 1, 60 do
		printf("test.lua onTrigger RANDOM VALUE %i: [%i]", i, math.random(1, 999))
	end

---------------------------------------------------------------------------------------------------
	-- local itemID = 27677
	-- local test = "[Aug]SuibhnePathGenbu_"..itemID

	-- if (player:getCharVar("[Aug]SuibhnePathGenbu_27677") > 0) then
		-- printf("test.lua onTrigger [%s]", test)
		-- augments = skyAugmentsCarryOver[1]
		-- player:setCharVar("[Aug]SuibhnePathGenbu_"..augItem, 0)
	-- end
	
---------------------------------------------------------------------------------------------------

-- Test tables
	-- local test = {trade = {1663, 3}}
	-- printf("test.lua onTrigger  TEST: [%i]", test.trade[2])

---------------------------------------------------------------------------------------------------

-- Test utils.clamp
	-- printf("test.lua onTrigger CLAMP: [%i]", utils.clamp(player:getSkillLevel(tpz.skill.HEALING_MAGIC) / 12.5, 10, 40))

---------------------------------------------------------------------------------------------------

-- Force set movement speed
	-- local target = player:getCursorTarget()
	-- target:speed(80)

---------------------------------------------------------------------------------------------------

-- Force Treasure Hunter level
	-- local target = player:getCursorTarget()
	-- target:setTHlevel(9)

---------------------------------------------------------------------------------------------------

-- Test math.ceil
	-- printf("test.lua onTrigger CEILING: [%f]", math.ceil(1.3))

---------------------------------------------------------------------------------------------------

-- Get NPC ID
	-- local npc = player:getCursorTarget()
	-- local pos = npc:getPos()
	-- printf("test.lua onTrigger NPC ID: [%i]  POS X: [%f]  POS Y: [%f]  POS Z: [%f]", npc:getID(), pos.x, pos.y, pos.z)

---------------------------------------------------------------------------------------------------

	-- local target = player:getCursorTarget()
	-- printf("test.lua onTrigger HP: [%i]", target:getHP())

---------------------------------------------------------------------------------------------------

-- Test mob enmity list
	-- local target = player:getCursorTarget()
	-- local mobTargets = target:getEnmityList()
	-- local assistTargets = {}
	
	-- for i, v in pairs(mobTargets) do
		-- printf("test.lua onTrigger TARGET NAME: [%s]", v.entity)
		-- assistTargets[i] = GetPlayerByName(v.entity:getName())
	-- end

---------------------------------------------------------------------------------------------------

	-- for i = 16, 17 do
		-- printf("test.lua onTrigger  i: [%i]", i)
	-- end

---------------------------------------------------------------------------------------------------

-- Test for player having a status effect (Extreme Purgation)
	-- local statusEffect = player:getStatusEffect(42)
	
	-- printf("test.lua onTrigger EFFECT: [%s]  POWER: [%i]  TICK: [%i]  DURATION: [%i]", statusEffect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())

---------------------------------------------------------------------------------------------------

-- Get mob's TH value
	-- local target = player:getCursorTarget()
	-- printf("test.lua onTrigger CURRENT TH: [%i]", mob:getTHlevel())

---------------------------------------------------------------------------------------------------

-- Return increased value versus decreasing HPP
	-- local hpp = player:getHPP()
	-- printf("test.lua onTrigger VALUE: [%i]", 5 + ((100 - hpp) / 5))

---------------------------------------------------------------------------------------------------

-- Force an AnimationSub
	-- local target = player:getCursorTarget()
	-- target:AnimationSub(2)

---------------------------------------------------------------------------------------------------

-- Remove Charm
	-- player:uncharm()
	
---------------------------------------------------------------------------------------------------

-- Restore an NPC from tpz.status.DISAPPEAR
	-- local qm = GetNPCByID(17318485)
	-- qm:setStatus(tpz.status.NORMAL)

---------------------------------------------------------------------------------------------------

-- Code for testing arrays
	-- local spells =
	-- {
		-- {options = {148, 177, 233}}, -- Fire V, Firaga IV, Bio IV
		-- {options = {163, 192, 35}},  -- Stone V, Stonega IV, Slowga
		-- {options = {173, 202, 227}}, -- Water V, Waterga IV, Poisonga III
		-- {options = {158, 187, 359}}, -- Aero V, Aeroga IV, Silencega
		-- {options = {153, 182, 356}}, -- Blizzard V, Blizzaga IV, Paralyga
		-- {options = {168, 197, 252}}  -- Thunder V, Thundaga IV, Stun
	-- }
	-- for i = 1, #spells[int].options do
		-- printf("test.lua OnTrigger ENTRY: [%i]  SPELL: [%s]", int, spells[int].options[i])
	-- end

---------------------------------------------------------------------------------------------------
	-- local mobName = player:getCursorTarget():getName()
	-- local fixedMobName = string.gsub(mobName, "_", "")
	-- local test = "KillCounter_" ..fixedMobName
	-- printf("test.lua onTrigger %s", test)
---------------------------------------------------------------------------------------------------
	-- local targ = player:getCursorTarget()
	
	-- targ:speed(40)
---------------------------------------------------------------------------------------------------
	-- local vines = 17879394
	-- local wall = 17879397

	-- GetNPCByID(vines):setAnimation(tpz.anim.CLOSE_DOOR)
	-- GetNPCByID(wall):openDoor(120)
--	GetNPCByID(npc):setStatus(tpz.status.NORMAL)
--	GetNPCByID(npc):setPos(239.4632, 18.7437, -42.0869, 203, 269)

---------------------------------------------------------------------------------------------------

	-- local target = player:getCursorTarget()
	-- local pet = player:getPet()
	-- local petCE = target:getCE(pet)
	-- local petVE = target:getVE(pet)
	
	-- printf("test.lua onTrigger PET CE: [%i]  VE: [%i]", petCE, petVE)

---------------------------------------------------------------------------------------------------
-- local missionZM = {0, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 23, 24, 26, 27, 28, 30}

	-- for i = 1, #missionZM do
-- --		player:completeMission(3, 0)
-- --		player:delMission(3, missionZM[i])
		-- player:addMission(3, missionZM[i] + 1)
		-- player:completeMission(3, missionZM[i])
	-- end
	
	-- player:addMission(3, 31) -- RoZ: Awakening

---------------------------------------------------------------------------------------------------

-- Outputs the current os.time
--	printf("Time: [%i]", os.time())

---------------------------------------------------------------------------------------------------
-- Checks the targets Physical Damage Type Resistances

	-- validate mobId
    -- local targ
    -- if (mobId == nil) then
        -- targ = player:getCursorTarget()
        -- if (targ == nil or not targ:isMob()) then
            -- error(player,"You must target a mob.")
            -- return
        -- end
    -- else
        -- targ = GetMobByID(mobId)
        -- if (targ == nil) then
            -- error(player,"Invalid mobID.")
            -- return
        -- end
    -- end
	
	-- local H2HRes = targ:getMod(tpz.mod.HTHRES)
	-- local BluntRES = targ:getMod(tpz.mod.IMPACTRES)
	-- local PierceRES = targ:getMod(tpz.mod.PIERCERES)
	-- local SlashRES = targ:getMod(tpz.mod.SLASHRES)
	
	-- player:PrintToPlayer(string.format("H2H RES: [%i]  Blunt RES: [%i]  Pierce RES: [%i]  Slash RES: [%i]", H2HRes, BluntRES, PierceRES, SlashRES),tpz.msg.channel.SYSTEM_3)

---------------------------------------------------------------------------------------------------

	-- local ilvl = player:getItemLevel()
	-- printf("test.lua onTrigger Item Level: [%i]", ilvl)

---------------------------------------------------------------------------------------------------

-- Code for testing arrays
	-- local test =
	-- {
		-- {mod = {"tpz.mod.PARALYZERES", "tpz.mod.BINDRES"}},
		-- {mod = {"tpz.mod.SILENCERES", "tpz.mod.GRAVITYRES"}},
		-- {mod = {"tpz.mod.PETRIFYRES", "tpz.mod.SLOWRES"}},
		-- {mod = {"tpz.mod.STUN"}},
		-- {mod = {"tpz.mod.POISONRES", "tpz.mod.VIRUSRES"}},
		-- {mod = {"tpz.mod.AMNESIARES"}},
		-- {mod = {"tpz.mod.SLEEPRES", "tpz.mod.BLINDRES", "tpz.mod.CURSERES"}},
		-- {mod = {"tpz.mod.CHARMRES", "tpz.mod.LULLABYRES", "tpz.mod.DEATHRES"}}
	-- }
	-- for i = 1, #test[int].mod do
		-- printf("test.lua OnTrigger ENTRY: [%i]  MOD: [%s]", int, test[int].mod[i])
	-- end

---------------------------------------------------------------------------------------------------

-- Code for testing combat messages
	-- targ:messageCombat(actor, actionID, value, message)
	-- local actor = player:getCursorTarget()
	-- local actionID = 344
	-- local value = 1000
--	local message = 101 -- From scripts/globals/msg.lua
	
	-- for i = id1, id2 do
	-- player:messageCombat(actor, i, value, message)
	-- end
	
--	player:messageCombat(actor, actionID, value, int)
	

---------------------------------------------------------------------------------------------------

-- Code for checking if player is behind the target
	-- local targ = player:getCursorTarget()
	
	-- if (player:isBehind(targ, 45) == true) then
		-- printf("test.lua onTrigger PLAYER IS BEHIND TARGET")
	-- else
		-- printf("test.lua onTrigger NOT BEHIND TARGET")
	-- end

---------------------------------------------------------------------------------------------------

-- Code for testing print to area
	-- local targ = player:getCursorTarget()
	-- targ:PrintToArea("horn begins charging for an attack!",tpz.msg.channel.EMOTION, tpz.msg.area.SAY, "Dark Ixion's")

---------------------------------------------------------------------------------------------------

-- Code for checking current Vana'diel Hour and Minutes

--	printf("test.lua CURRENT HOUR: [%s]  CURRENT MINUTE: [%s]  COMBINED: [%s]", VanadielHour(), VanadielMinute(), (VanadielHour() * 60) + VanadielMinute())
---------------------------------------------------------------------------------------------------
	-- local npc = player:getCursorTarget()
	-- npc:setModelId(modelId)
---------------------------------------------------------------------------------------------------
	-- Code for testing listeners
	-- player:addListener("ABILITY_USE", "TEST_LISTENER", function(player, ability)
		-- printf("test.lua Ability Listener SETUP")
		-- -- local enmityList = mob:getEnmityList()
		-- -- local PlayerName = {}
	   
		-- -- for i,v in ipairs(enmityList) do
			-- -- PlayerName[i] = v.entity:getName()
			
			-- if (player:getCurrentAction() == tpz.act.JOBABILITY_FINISH) then -- Player uses ability
				-- printf("test.lua Ability Listener TRIGGERED")
			-- end
		-- -- end
    -- end)
---------------------------------------------------------------------------------------------------

-- Code for testing a pet's HP ratio

	-- local pet = player:getPet()
	-- local petMaxHP = pet:getMaxHP()
	-- local petHP = pet:getHP()
	
	-- player:PrintToPlayer(string.format("Pet HP as a ratio: [%f]", utils.clamp((petHP/petMaxHP) * 100, 50, 100)), tpz.msg.channel.NS_LINKSHELL3)
	
---------------------------------------------------------------------------------------------------

-- Code for determining the linkpearl's signature

-- local item = player:getItem(515)

-- if (player:hasItem(515) and (item:getSignature() == "CalderaServer")) then
	-- player:PrintToPlayer("Player has the server linkpearl!")
-- end

---------------------------------------------------------------------------------------------------

-- Code for messaging the entire server

--	printf("Player Name: [%s]  Message: [%s]\n", playerName, message)

	-- local message = "Normal chat in Say from the player"
	-- local channel = 0
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Say from the player"
	-- local channel = 0
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Shout from the player"
	-- local channel = 1
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in an unknown channel from the player"
	-- local channel = 2
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Tell from the player"
	-- local channel = 3
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Party from the player"
	-- local channel = 4
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 1 from the player"
	-- local channel = 5
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "System Message 1"
	-- local channel = 6
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "System Message 2"
	-- local channel = 7
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Emote from the player"
	-- local channel = 8
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Say from no speaker"
	-- local channel = 13
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Shout from no speaker"
	-- local channel = 14
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Party from no speaker"
	-- local channel = 15
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 1 from no speaker"
	-- local channel = 16
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Yell from the player"
	-- local channel = 26
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 2 from the player"
	-- local channel = 27
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 2 from no speaker"
	-- local channel = 28
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "System Message 3"
	-- local channel = 29
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 3 from the player"
	-- local channel = 30
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 3 (1) from no speaker"
	-- local channel = 31
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 3 (2) from no speaker"
	-- local channel = 32
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Unity from the player"
	-- local channel = 33
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)


---------------------------------------------------------------------------------------------------

-- Code for cleaning monster names of underscores

	-- local target = player:getCursorTarget()
	-- local mobName = target:getName()
	-- local testName = string.gsub(mobName, "_", " ")
	-- player:PrintToPlayer(string.format("Mob name: [%s]  Test name: [%s]", mobName, testName), tpz.msg.channel.NS_LINKSHELL3)

---------------------------------------------------------------------------------------------------

-- Divide a number and determine if there is a remainder

	-- local value = 1
	-- local test = value % 8
	
	-- player:PrintToPlayer(string.format("A Value of %i divided by [8] has a Remainder of [%i]!", value, test))
	
	-- if (test == 0) then
		-- player:PrintToPlayer(string.format("The Value is evenly divisible by 8!"))
	-- end
end