---------------------------------------------------------------------------------------------------
-- func: !msgserver <channel #> <message>
-- desc: Messages the entire server on the channel specified. Accepts a maximum of 30 words.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "issssssssssssssssssssssssssssss"
}

function onTrigger(player, channel, str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, str13, str14, str15, str16, str17, str18, str19, str20, str21, str22, str23, str24, str25, str26, str27, str28, str29, str30, str31, str32, str33, str34, str35, str36)
---------------------------------------------------------------------------------------------------
	if ((channel == nil) or (channel < 0) or (channel == 2) or (channel > 8 and channel < 13) or (channel > 16 and channel < 26) or (channel > 33)) then
		player:PrintToPlayer(string.format("!msgserver <channel #> <message>"), tpz.msg.channel.NS_LINKSHELL2)
		player:PrintToPlayer(string.format("[6] SYSTEM 1    [1] SAY      [8] EMOTE           [30] LINKSHELL 3        [13] NS_SAY"), tpz.msg.channel.NS_LINKSHELL3)
		player:PrintToPlayer(string.format("[7] SYSTEM 2    [2] SHOUT   [33] UNITY           [16] NS_LINKSHELL 1    [14] NS_SHOUT"), tpz.msg.channel.NS_LINKSHELL3)
		player:PrintToPlayer(string.format("[29] SYSTEM 3   [3] TELL     [5] LINKSHELL 1    [28] NS_LINKSHELL 2   [15] NS_PARTY"), tpz.msg.channel.NS_LINKSHELL3)
		player:PrintToPlayer(string.format("[26] YELL        [4] PARTY   [27] LINKSHELL 2   [31] NS_LINKSHELL 3"), tpz.msg.channel.NS_LINKSHELL3)
		
		-- player:PrintToPlayer(string.format("[6]SYSTEM 1  [7]SYSTEM 2  [29]SYSTEM 3  [1]SAY  [13]NS_SAY  [2]SHOUT  [14]NS_SHOUT  [3]TELL  [4]PARTY  [8]EMOTE  [26]YELL  [33]UNITY"), tpz.msg.channel.NS_LINKSHELL3)
		-- player:PrintToPlayer(string.format("[5]LINKSHELL 1  [27]LINKSHELL 2  [30]LINKSHELL 3  [15]NS_PARTY  [16]NS_LINKSHELL 1  [27]NS_LINKSHELL 2  [31]NS_LINKSHELL 3"), tpz.msg.channel.NS_LINKSHELL3)
		return
	end
	
	local str1 = str1
	local str2 = str2
	local str3 = str3
	local str4 = str4
	local str5 = str5
	local str6 = str6
	local str7 = str7
	local str8 = str8
	local str9 = str9
	local str10 = str10
	local str11 = str11
	local str12 = str12
	local str13 = str13
	local str14 = str14
	local str15 = str15
	local str16 = str16
	local str17 = str17
	local str18 = str18
	local str19 = str19
	local str20 = str20
	local str21 = str21
	local str22 = str22
	local str23 = str23
	local str24 = str24
	local str25 = str25
	local str26 = str26
	local str27 = str27
	local str28 = str28
	local str29 = str29
	local str30 = str30
	local str31 = str31
	local str32 = str32
	local str33 = str33
	local str34 = str34
	local str35 = str35
	local str36 = str36
	
	if (str1 == nil) then
		str1 = ""
	end
	if (str2 == nil) then
		str2 = ""
	end
	if (str3 == nil) then
		str3 = ""
	end
	if (str4 == nil) then
		str4 = ""
	end
	if (str5 == nil) then
		str5 = ""
	end
	if (str6 == nil) then
		str6 = ""
	end
	if (str7 == nil) then
		str7 = ""
	end
	if (str8 == nil) then
		str8 = ""
	end
	if (str9 == nil) then
		str9 = ""
	end
	if (str10 == nil) then
		str10 = ""
	end
	if (str11 == nil) then
		str11 = ""
	end
	if (str12 == nil) then
		str12 = ""
	end
	if (str13 == nil) then
		str13 = ""
	end
	if (str14 == nil) then
		str14 = ""
	end
	if (str15 == nil) then
		str15 = ""
	end
	if (str16 == nil) then
		str16 = ""
	end
	if (str17 == nil) then
		str17 = ""
	end
	if (str18 == nil) then
		str18 = ""
	end
	if (str19 == nil) then
		str19 = ""
	end
	if (str20 == nil) then
		str20 = ""
	end
	if (str21 == nil) then
		str21 = ""
	end
	if (str22 == nil) then
		str22 = ""
	end
	if (str23 == nil) then
		str23 = ""
	end
	if (str24 == nil) then
		str24 = ""
	end
	if (str25 == nil) then
		str25 = ""
	end
	if (str26 == nil) then
		str26 = ""
	end
	if (str27 == nil) then
		str27 = ""
	end
	if (str28 == nil) then
		str28 = ""
	end
	if (str29 == nil) then
		str29 = ""
	end
	if (str30 == nil) then
		str30 = ""
	end
	if (str31 == nil) then
		str31 = ""
	end
	if (str32 == nil) then
		str32 = ""
	end
	if (str33 == nil) then
		str33 = ""
	end
	if (str34 == nil) then
		str34 = ""
	end
	if (str35 == nil) then
		str35 = ""
	end
	if (str36 == nil) then
		str36 = ""
	end

	local message = string.format("%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s", str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, str13, str14, str15, str16, str17, str18, str19, str20, str21, str22, str23, str24, str25, str26, str27, str28, str29, str30, str31, str32, str33, str34, str35, str36)
	local playerName = player:getName()
	SendServerMsg(playerName, channel, message)
	
	return
end