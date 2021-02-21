---------------------------------------------------------------------------------------------------
-- func: !raf1 <player> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4>
-- desc: Gives the Reforged Artifact +1 set with augments to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!raf1 <player>")
end

function onTrigger(player, target, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val)
    local itemId = 0
	local amount = 1
	
	if (target == nil or itemId == nil) then
        error(player, "You must enter a valid player name.")
        return
    end

    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "No target specified. Please target a player." ) )
        return
    end

    -- Load needed text ids for target's current zone
    local ID = zones[targ:getZoneID()]

    -- Attempt to give the target the items
    if (targ:getFreeSlotsCount() < 5) then
        targ:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "'%s' does not have enough free space for that set! Please clear 5 inventory slots and try again.", target ) )
    else
		if (targ:getMainJob() == tpz.job.WAR) then
			itemId = 27684 -- Pummeler's Mask +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27828 -- Pummeler's Lorica +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27964 -- Pummeler's Mufflers +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28111 -- Pummeler's Cuisses +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28244 -- Pummeler's Calligae +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Pummeler's +1 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.MNK) then
			itemId = 27685 -- Anchorite's Crown +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27829 -- Anchorite's Cyclas +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27965 -- Anchorite's Gloves +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28112 -- Anchorite's Hose +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28245 -- Anchorite's Gaiters +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Anchorite +1 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.WHM) then
			itemId = 27686 -- Theophany Cap +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27830 -- Theophany Briault +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27966 -- Theophany Mitts +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28113 -- Theophany Pantaloons +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28246 -- Theophany Duckbills +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Theophany +1 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BLM) then
			itemId = 27687 -- Spaekona's Petasos +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27831 -- Spaekona's Coat +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27967 -- Spaekona's Gloves +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28114 -- Spaekona's Tonban +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28247 -- Spaekona's Sabots +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Spaekona's +1 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.RDM) then
			itemId = 23402 -- Atrophy Chapeau +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23469 -- Atrophy Tabard +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23536 -- Atrophy Gloves +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23603 -- Atrophy Tights +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23670 -- Atrophy Boots +1
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Atrophy +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.THF) then
			-- itemId = 23403 -- Pillager's Bonnet +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23470 -- Pillager's Vest +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23537 -- Pillager's Armlets +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23604 -- Pillager's Culottes +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23671 -- Pillager's Poulaines +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Pillager's +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.PLD) then
			-- itemId = 23404 -- Reverence Coronet +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23471 -- Reverence Surcoat +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23538 -- Reverence Gauntlets +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23605 -- Reverence Breeches +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23672 -- Reverence Leggings +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Reverence +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DRK) then
			-- itemId = 23405 -- Ignominy Burgeonet +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23472 -- Ignominy Cuirass +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23539 -- Ignominy Finger Gauntlets +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23606 -- Ignominy Flanchard +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23673 -- Ignominy Sollerets +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Ignominy +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BST) then
			-- itemId = 23406 -- Totemic Helm +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23473 -- Totemic Jackcoat +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23540 -- Totemic Gloves +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23607 -- Totemic Trousers +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23674 -- Totemic Gaiters +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Totemic +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BRD) then
			-- itemId = 23407 -- Brioso Roundlet +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23474 -- Brioso Justaucorps +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23541 -- Brioso Cuffs +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23608 -- Brioso Cannions +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23675 -- Brioso Slippers +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Brioso +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.RNG) then
			-- itemId = 23408 -- Orion Beret +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23475 -- Orion Jerkin +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23542 -- Orion Bracer +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23609 -- Orion Braccae +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23676 -- Orion Socks +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Orion +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SAM) then
			-- itemId = 23409 -- Wakido Kabuto +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23476 -- Wakido Domaru +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23543 -- Wakido Kote +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23610 -- Wakido Haidate +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23677 -- Wakido Sune-Ate +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Wakido +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.NIN) then
			-- itemId = 23410 -- Hachiya Hatsuburi +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23477 -- Hachiya Chainmail +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23544 -- Hachiya Tekko +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23611 -- Hachiya Hakama +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23678 -- Hachiya Kyahan +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Hachiya +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DRG) then
			-- itemId = 23411 -- Vishap Armet +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23478 -- Vishap Mail +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23545 -- Vishap Finger Gauntlets +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23612 -- Vishap Brais +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23679 -- Vishap Greaves +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Vishap +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SMN) then
			-- itemId = 23412 -- Convoker's Horn +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23479 -- Convoker's Doublet +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23546 -- Convoker's Bracers +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23613 -- Convoker's Spats +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23680 -- Convoker's Pigaches +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Convoker's +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BLU) then
			-- itemId = 23413 -- Assimilator's Keffiyeh +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23480 -- Assimilator's Jubbah +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23547 -- Assimilator's Bazubands +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23614 -- Assimilator's Shalwar +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23681 -- Assimilator's Charuqs +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Assimilator's +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.COR) then
			-- itemId = 23414 -- Laksamana's Tricorne +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23481 -- Laksamana's Frac +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23548 -- Laksamana's Gants +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23615 -- Laksamana's Trews +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23682 -- Laksamana's Bottes +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Laksamana's +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.PUP) then
			-- itemId = 23415 -- Foire Taj +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23482 -- Foire Tobe +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23549 -- Foire Dastanas +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23616 -- Foire Churidars +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23683 -- Foire Babouches +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Foire +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DNC) then
			-- itemId = 23416 -- Maxixi Tiara +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23483 -- Maxixi Casaque +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23550 -- Maxixi Bangles +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23617 -- Maxixi Tights +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23684 -- Maxixi Toe Shoes +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Maxixi +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SCH) then
			-- itemId = 23417 -- Academic's Mortarboard +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23484 -- Academic's Gown +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23551 -- Academic's Bracers +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23618 -- Academic's Pants +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23685 -- Academic's Loafers +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Academic's +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.GEO) then
			-- itemId = 23418 -- Geomancy Galero +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23485 -- Geomancy Tunic +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23552 -- Geomancy Mitaines +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23619 -- Geomancy Pants +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23686 -- Geomancy Sandals +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Geomancy +1 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.RUN) then
			-- itemId = 23419 -- Runeist Bandeau +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23486 -- Runeist Coat +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23553 -- Runeist Mitons +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23620 -- Runeist Trousers +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23687 -- Runeist Boots +1
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Runeist +1 set.", target ) )
		end
	end
end