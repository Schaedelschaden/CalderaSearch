---------------------------------------------------------------------------------------------------
-- func: !addallrolls
-- desc: Adds all valid COR rolls to the given target. If no target then to the current player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addallrolls {player}")
end

function onTrigger(player, target)
    local ValidRolls =
     {
        98, -- Fighter's Roll
		99, -- Monk's Roll
		100, -- Healer's Roll
		101, -- Wizard's Roll
		102, -- Warlock's Roll
		103, -- Rogue's Roll
		104, -- Gallant's Roll
		105, -- Chaos Roll
		106, -- Beast Roll
		107, -- Choral Roll
		108, -- Hunter's Roll
		109, -- Samurai Roll
		110, -- Ninja Roll
		111, -- Drachen Roll
		112, -- Evoker's Roll
		113, -- Magus' Roll
		114, -- Corsair's Roll
		115, -- Puppet's Roll
		116, -- Dancer's Roll
		117, -- Scholar's Roll
		118, -- Bolter's Roll
		119, -- Caster's Roll
		120, -- Courser's Roll
		121, -- Blitzer's Roll
		122, -- Tactician's Roll
		302, -- Allies Roll
		303, -- Miser's Roll
		304, -- Companion's Roll
		305, -- Avenger's Roll
		390, -- Naturalist's Roll
		391, -- Runeist's Roll
    }

    -- Validate target
    local targ
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    -- Add all rolls
    local save = true
    local silent = true    -- prevent packet spam
    for i = 1, #ValidRolls do
        targ:addLearnedAbility(ValidRolls[i], silent, save)
    end
    player:PrintToPlayer(string.format("%s now has all rolls.", targ:getName()))
end