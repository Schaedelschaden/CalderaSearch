---------------------------------------------------------------------------------------------------
-- func: !raf3 <player> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4>
-- desc: Gives the Reforged Artifact +3 set with augments to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!raf3 <player>")
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
			itemId = 23375 -- Pummeler's Mask +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23442 -- Pummeler's Lorica +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23509 -- Pummeler's Mufflers +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23576 -- Pummeler's Cuisses +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23643 -- Pummeler's Calligae +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Pummeler's +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.MNK) then
			itemId = 23376 -- Anchorite's Crown +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23443 -- Anchorite's Cyclas +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23510 -- Anchorite's Gloves +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23577 -- Anchorite's Hose +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23644 -- Anchorite's Gaiters +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Anchorite +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.WHM) then
			itemId = 23377 -- Theophany Cap +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23444 -- Theophany Briault +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23511 -- Theophany Mitts +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23578 -- Theophany Pantaloons +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23645 -- Theophany Duckbills +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Theophany +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BLM) then
			itemId = 23378 -- Spaekona's Petasos +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23445 -- Spaekona's Coat +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23512 -- Spaekona's Gloves +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23579 -- Spaekona's Tonban +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23646 -- Spaekona's Sabots +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Spaekona's +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.RDM) then
			itemId = 23402 -- Atrophy Chapeau +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23469 -- Atrophy Tabard +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23536 -- Atrophy Gloves +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23603 -- Atrophy Tights +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23670 -- Atrophy Boots +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Atrophy +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.THF) then
			-- itemId = 23403 -- Pillager's Bonnet +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23470 -- Pillager's Vest +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23537 -- Pillager's Armlets +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23604 -- Pillager's Culottes +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23671 -- Pillager's Poulaines +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Pillager's +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.PLD) then
			-- itemId = 23404 -- Reverence Coronet +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23471 -- Reverence Surcoat +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23538 -- Reverence Gauntlets +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23605 -- Reverence Breeches +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23672 -- Reverence Leggings +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Reverence +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DRK) then
			-- itemId = 23405 -- Ignominy Burgeonet +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23472 -- Ignominy Cuirass +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23539 -- Ignominy Finger Gauntlets +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23606 -- Ignominy Flanchard +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23673 -- Ignominy Sollerets +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Ignominy +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BST) then
			-- itemId = 23406 -- Totemic Helm +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23473 -- Totemic Jackcoat +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23540 -- Totemic Gloves +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23607 -- Totemic Trousers +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23674 -- Totemic Gaiters +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Totemic +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BRD) then
			-- itemId = 23407 -- Brioso Roundlet +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23474 -- Brioso Justaucorps +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23541 -- Brioso Cuffs +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23608 -- Brioso Cannions +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23675 -- Brioso Slippers +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Brioso +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.RNG) then
			-- itemId = 23408 -- Orion Beret +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23475 -- Orion Jerkin +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23542 -- Orion Bracer +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23609 -- Orion Braccae +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23676 -- Orion Socks +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Orion +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SAM) then
			-- itemId = 23409 -- Wakido Kabuto +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23476 -- Wakido Domaru +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23543 -- Wakido Kote +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23610 -- Wakido Haidate +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23677 -- Wakido Sune-Ate +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Wakido +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.NIN) then
			-- itemId = 23410 -- Hachiya Hatsuburi +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23477 -- Hachiya Chainmail +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23544 -- Hachiya Tekko +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23611 -- Hachiya Hakama +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23678 -- Hachiya Kyahan +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Hachiya +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DRG) then
			-- itemId = 23411 -- Vishap Armet +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23478 -- Vishap Mail +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23545 -- Vishap Finger Gauntlets +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23612 -- Vishap Brais +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23679 -- Vishap Greaves +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Vishap +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SMN) then
			-- itemId = 23412 -- Convoker's Horn +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23479 -- Convoker's Doublet +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23546 -- Convoker's Bracers +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23613 -- Convoker's Spats +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23680 -- Convoker's Pigaches +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Convoker's +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BLU) then
			-- itemId = 23413 -- Assimilator's Keffiyeh +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23480 -- Assimilator's Jubbah +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23547 -- Assimilator's Bazubands +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23614 -- Assimilator's Shalwar +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23681 -- Assimilator's Charuqs +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Assimilator's +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.COR) then
			-- itemId = 23414 -- Laksamana's Tricorne +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23481 -- Laksamana's Frac +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23548 -- Laksamana's Gants +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23615 -- Laksamana's Trews +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23682 -- Laksamana's Bottes +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Laksamana's +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.PUP) then
			-- itemId = 23415 -- Foire Taj +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23482 -- Foire Tobe +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23549 -- Foire Dastanas +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23616 -- Foire Churidars +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23683 -- Foire Babouches +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Foire +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DNC) then
			-- itemId = 23416 -- Maxixi Tiara +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23483 -- Maxixi Casaque +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23550 -- Maxixi Bangles +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23617 -- Maxixi Tights +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23684 -- Maxixi Toe Shoes +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Maxixi +3 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SCH) then
			-- itemId = 23417 -- Academic's Mortarboard +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23484 -- Academic's Gown +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23551 -- Academic's Bracers +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23618 -- Academic's Pants +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23685 -- Academic's Loafers +3
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Academic's +3 set.", target ) )
		end
	end
end