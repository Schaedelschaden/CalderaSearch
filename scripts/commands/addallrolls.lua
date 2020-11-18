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
        82, -- Fighter's Roll
		83, -- Monk's Roll
		84, -- Healer's Roll
		85, -- Wizard's Roll
		86, -- Warlock's Roll
		87, -- Rogue's Roll
		88, -- Gallant's Roll
		89, -- Chaos Roll
		90, -- Beast Roll
		91, -- Choral Roll
		92, -- Hunter's Roll
		93, -- Samurai Roll
		94, -- Ninja Roll
		95, -- Drachen Roll
		96, -- Evoker's Roll
		97, -- Magus' Roll
		98, -- Corsair's Roll
		99, -- Puppet's Roll
		100, -- Dancer's Roll
		101, -- Scholar's Roll
		102, -- Bolter's Roll
		103, -- Caster's Roll
		104, -- Courser's Roll
		105, -- Blitzer's Roll
		106, -- Tactician's Roll
		286, -- Allies Roll
		287, -- Miser's Roll
		288, -- Companion's Roll
		289, -- Avenger's Roll
		374, -- Naturalist's Roll
		375, -- Runeist's Roll
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