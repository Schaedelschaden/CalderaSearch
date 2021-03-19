---------------------------------------------------------------------------------------------------
-- func: !test
-- desc: Use this to test LUA functions
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(player, int)
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
	local actor = player:getCursorTarget()
	local actionID = 344
	local value = 1000
--	local message = 101 -- From scripts/globals/msg.lua
	
	-- for i = id1, id2 do
	-- player:messageCombat(actor, i, value, message)
	-- end
	
	player:messageCombat(actor, actionID, value, int)
	

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