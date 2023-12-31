---------------------------------------------------------------------------------------------------
-- func: mobcastspell
-- desc: Forces the target monster to cast a spell.
---------------------------------------------------------------------------------------------------
require("scripts/globals/msg")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(player, spell)
    local target = player:getCursorTarget()
	
	if (spell == 0 or spell == nil) then
		player:PrintToPlayer(string.format("You must specify a monster spell!\n!mobcastspell <spell #>"), tpz.msg.channel.SYSTEM_3)
		return 0
	end

    -- set level
    if target and (target:isMob() or target:getObjType() == tpz.objType.TRUST) then
        player:PrintToPlayer(string.format("Forcing %s to cast spell %i.", target:getName(), spell), tpz.msg.channel.SYSTEM_3)
        local targ = target:getTarget()

        target:castSpell(spell, targ)
    else
		player:PrintToPlayer(string.format("You must target a monster first!"), tpz.msg.channel.SYSTEM_3)
    end
end