---------------------------------------------------------------------------------------------------
-- func: !test
-- desc: Use this to test LUA functions
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
---------------------------------------------------------------------------------------------------

-- Code for determining the linkpearl's signature

local item = player:getItem(515)

if (player:hasItem(515) and (item:getSignature() == "CalderaServer")) then
	player:PrintToPlayer("Player has the server linkpearl!")
end

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