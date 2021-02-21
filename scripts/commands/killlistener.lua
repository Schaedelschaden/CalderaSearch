---------------------------------------------------------------------------------------------------
-- func: !killlistener
-- desc: Use this to kill a listener created in !test
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
	player:removeListener("TEST_LISTENER")
end