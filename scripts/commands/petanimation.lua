---------------------------------------------------------------------------------------------------
-- func: !petanimation
-- desc: Forces the player's pet to perform the specified animation on the target
---------------------------------------------------------------------------------------------------
require("scripts/globals/zone")

cmdprops =
{
    permission = 1,
    parameters = "ii" 
}

function error(player, msg)
    player:PrintToPlayer("!petanimation <action ID> <animation ID> <target>")
end

function onTrigger(player, actionType, animationID)
	if (player:hasPet() == true) then
		local pet = player:getPet()
		local target -- = player:getCursorTarget()
		local actionId = actionType
		local animationId = animationID
	
		if (pet == nil) then
			player:PrintToPlayer("You must have a pet.")
		end
	
		if (target == nil) then
			target = player:getCursorTarget()
			if (target == nil or not target:isMob()) then
				player:PrintToPlayer("You must target a mob.")
				return
			end
		else
			target = target:getID() -- GetMobByID(mobId)
			if (target == nil) then
				player:PrintToPlayer("Invalid mobID.")
				return
			end
		end
	
		if (actionId == nil) then
			player:PrintToPlayer("You must enter an action type.")
		end
	
		if (animationId == nil) then
			player:PrintToPlayer("You must enter an animation ID.")
		end
	
--		printf("!petanimation Command ANIMATION ID: [%i]\n", animationID)
	
		PlayPetAnimation(pet, target, actionId, animationId)
	end
	
	return 0
end