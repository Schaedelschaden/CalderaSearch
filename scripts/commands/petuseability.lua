---------------------------------------------------------------------------------------------------
-- func: petuseability
-- desc: Forces the user's pet to use an ability.
---------------------------------------------------------------------------------------------------
require("scripts/globals/msg")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(player, ability)
    local pet = player:getPet()
	
	if ability == 0 or ability == nil then
		player:PrintToPlayer(string.format("You must specify an ability!\n!petuseability <ability #>"), tpz.msg.channel.SYSTEM_3)
		return 0
	end

    -- set level
    if pet then
        player:PrintToPlayer(string.format("Forcing %s to use ability %i.", pet:getName(), ability), tpz.msg.channel.SYSTEM_3)

        pet:useJobAbility(ability, pet)
    else
		player:PrintToPlayer(string.format("You must have a pet first!"), tpz.msg.channel.SYSTEM_3)
    end
end
