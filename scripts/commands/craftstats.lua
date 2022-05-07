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
	local fishing = player:getMod(tpz.mod.FISH) + ((player:getSkillLevel(tpz.skill.FISHING) - 10) / 32)
	local woodworking = player:getMod(tpz.mod.WOOD) + ((player:getSkillLevel(tpz.skill.WOODWORKING) - 10) / 32)
	local smithing = player:getMod(tpz.mod.SMITH) + ((player:getSkillLevel(tpz.skill.SMITHING) - 10) / 32)
	local goldsmithing = player:getMod(tpz.mod.GOLDSMITH) + ((player:getSkillLevel(tpz.skill.GOLDSMITHING) - 10) / 32)
	local clothcraft = player:getMod(tpz.mod.CLOTH) + ((player:getSkillLevel(tpz.skill.CLOTHCRAFT) - 10) / 32)
	local leathercraft = player:getMod(tpz.mod.LEATHER) + ((player:getSkillLevel(tpz.skill.LEATHERCRAFT) - 10) / 32)
	local bonecraft = player:getMod(tpz.mod.BONE) + ((player:getSkillLevel(tpz.skill.BONECRAFT) - 10) / 32)
	local alchemy = player:getMod(tpz.mod.ALCHEMY) + ((player:getSkillLevel(tpz.skill.ALCHEMY) - 10) / 32)
	local cooking = player:getMod(tpz.mod.COOK) + ((player:getSkillLevel(tpz.skill.COOKING) - 10) / 32)
	
	player:PrintToPlayer(string.format("CRAFTING STATISTICS -------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  FISHING: [%i]  WOODWORKING: [%i]  SMITHING: [%i]  GOLDSMITHING: [%i]  CLOTHCRAFT: [%i]", fishing, woodworking, smithing, goldsmithing, clothcraft), tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  LEATHERCRAFT: [%i]  BONECRAFT: [%i]  ALCHEMY: [%i]  COOKING: [%i]", leathercraft, bonecraft, alchemy, cooking), tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("------------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
end