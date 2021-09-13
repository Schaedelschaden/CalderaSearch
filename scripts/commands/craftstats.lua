--------------------------------------------------------------
-- func: !craftstats
-- auth: Schaedel
-- desc: Gives the player a list of their crafting stats.
--------------------------------------------------------------
require("scripts/globals/utils")
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
	local woodworking = player:getMod(tpz.mod.WOOD) -- player:getSkillLevel(tpz.skill.WOODWORKING) + 
	local smithing = player:getMod(tpz.mod.SMITH) -- (player:getSkillLevel(tpz.skill.SMITHING) / 10) + 
	local goldsmithing = player:getMod(tpz.mod.GOLDSMITH) -- (player:getSkillLevel(tpz.skill.GOLDSMITHING) / 10) + 
	local clothcraft = player:getMod(tpz.mod.CLOTH) -- (player:getSkillLevel(tpz.skill.CLOTHCRAFT) / 10) + 
	local leathercraft = player:getMod(tpz.mod.LEATHER) -- (player:getSkillLevel(tpz.skill.LEATHERCRAFT) / 10) + 
	local bonecraft = player:getMod(tpz.mod.BONE) -- (player:getSkillLevel(tpz.skill.BONECRAFT) / 10) + 
	local alchemy = player:getMod(tpz.mod.ALCHEMY) -- (player:getSkillLevel(tpz.skill.ALCHEMY) / 10) + 
	local cooking = player:getMod(tpz.mod.COOK) -- (player:getSkillLevel(tpz.skill.COOKING) / 10) + 
	
	player:PrintToPlayer(string.format("CRAFTING STATISTICS -------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  WOODWORKING: [%f]  SMITHING: [%f]  GOLDSMITHING: [%f]  CLOTHCRAFT: [%f]", woodworking, smithing, goldsmithing, clothcraft),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  LEATHERCRAFT: [%f]  BONECRAFT: [%f]  ALCHEMY: [%f]  COOKING: [%f]", leathercraft, bonecraft, alchemy, cooking),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("------------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
end