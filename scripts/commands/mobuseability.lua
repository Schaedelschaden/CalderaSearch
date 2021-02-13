---------------------------------------------------------------------------------------------------
-- func: mobuseability
-- desc: Forces the target monster to use an ability.
---------------------------------------------------------------------------------------------------
require("scripts/globals/msg")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(player, ability)
    local target = player:getCursorTarget()
	
	if (ability == 0 or ability == nil) then
		player:PrintToPlayer(string.format("You must specify a monster ability!\n!mobusability <ability #>"), tpz.msg.channel.SYSTEM_3)
		return 0
	end

    -- set level
    if target and target:isMob() then
        player:PrintToPlayer(string.format("Forcing %s to use ability %i.", target:getName(), ability), tpz.msg.channel.SYSTEM_3)

        target:useMobAbility(ability)
    else
		player:PrintToPlayer(string.format("You must target a monster first!"), tpz.msg.channel.SYSTEM_3)
    end
end