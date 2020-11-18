---------------------------------------------------------------------------------------------------
-- func: !skilllevel
-- desc: Prints to the player what the specified skill level currently is.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!release {name}")
end

function onTrigger(player)
	local blueSkill = 0
	local blueMerits = 0
	local blueGear = 0

	blueSkill = player:getSkillLevel(tpz.skill.BLUE_MAGIC)
	blueMerits = player:getMerit(tpz.merit.BLUE)
	blueGear = player:getMod(tpz.mod.BLUE)
	
	player:PrintToPlayer(string.format("Blue Skill: [%i] includes Merits: [%i] & Gear: [%i]", blueSkill, blueMerits, blueGear))
end