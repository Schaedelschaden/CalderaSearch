---------------------------------------------------------------------------------------------------
-- func: !test
-- desc: Use this to test LUA functions
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(player, modelId)
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