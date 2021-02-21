---------------------------------------------------------------------------------------------------
-- func: !raf2 <player> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4>
-- desc: Gives the Reforged Artifact +2 set with augments to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!raf2 <player>")
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
			itemId = 23040 -- Pummeler's Mask +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23107 -- Pummeler's Lorica +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23174 -- Pummeler's Mufflers +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23241 -- Pummeler's Cuisses +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23308 -- Pummeler's Calligae +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Pummeler's +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.MNK) then
			itemId = 23041 -- Anchorite's Crown +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23108 -- Anchorite's Cyclas +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23175 -- Anchorite's Gloves +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23242 -- Anchorite's Hose +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23309 -- Anchorite's Gaiters +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Anchorite +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.WHM) then
			itemId = 23042 -- Theophany Cap +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23109 -- Theophany Briault +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23176 -- Theophany Mitts +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23243 -- Theophany Pantaloons +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23310 -- Theophany Duckbills +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Theophany +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BLM) then
			itemId = 23043 -- Spaekona's Petasos +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23110 -- Spaekona's Coat +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23177 -- Spaekona's Gloves +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23244 -- Spaekona's Tonban +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23311 -- Spaekona's Sabots +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Spaekona's +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.RDM) then
			itemId = 23402 -- Atrophy Chapeau +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23469 -- Atrophy Tabard +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23536 -- Atrophy Gloves +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23603 -- Atrophy Tights +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23670 -- Atrophy Boots +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Atrophy +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.THF) then
			-- itemId = 23403 -- Pillager's Bonnet +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23470 -- Pillager's Vest +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23537 -- Pillager's Armlets +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23604 -- Pillager's Culottes +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23671 -- Pillager's Poulaines +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Pillager's +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.PLD) then
			-- itemId = 23404 -- Reverence Coronet +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23471 -- Reverence Surcoat +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23538 -- Reverence Gauntlets +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23605 -- Reverence Breeches +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23672 -- Reverence Leggings +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Reverence +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DRK) then
			-- itemId = 23405 -- Ignominy Burgeonet +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23472 -- Ignominy Cuirass +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23539 -- Ignominy Finger Gauntlets +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23606 -- Ignominy Flanchard +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23673 -- Ignominy Sollerets +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Ignominy +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BST) then
			-- itemId = 23406 -- Totemic Helm +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23473 -- Totemic Jackcoat +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23540 -- Totemic Gloves +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23607 -- Totemic Trousers +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23674 -- Totemic Gaiters +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Totemic +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BRD) then
			-- itemId = 23407 -- Brioso Roundlet +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23474 -- Brioso Justaucorps +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23541 -- Brioso Cuffs +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23608 -- Brioso Cannions +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23675 -- Brioso Slippers +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Brioso +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.RNG) then
			-- itemId = 23408 -- Orion Beret +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23475 -- Orion Jerkin +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23542 -- Orion Bracer +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23609 -- Orion Braccae +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23676 -- Orion Socks +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Orion +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SAM) then
			-- itemId = 23409 -- Wakido Kabuto +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23476 -- Wakido Domaru +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23543 -- Wakido Kote +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23610 -- Wakido Haidate +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23677 -- Wakido Sune-Ate +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Wakido +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.NIN) then
			-- itemId = 23410 -- Hachiya Hatsuburi +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23477 -- Hachiya Chainmail +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23544 -- Hachiya Tekko +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23611 -- Hachiya Hakama +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23678 -- Hachiya Kyahan +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Hachiya +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DRG) then
			-- itemId = 23411 -- Vishap Armet +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23478 -- Vishap Mail +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23545 -- Vishap Finger Gauntlets +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23612 -- Vishap Brais +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23679 -- Vishap Greaves +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Vishap +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SMN) then
			-- itemId = 23412 -- Convoker's Horn +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23479 -- Convoker's Doublet +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23546 -- Convoker's Bracers +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23613 -- Convoker's Spats +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23680 -- Convoker's Pigaches +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Convoker's +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BLU) then
			-- itemId = 23413 -- Assimilator's Keffiyeh +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23480 -- Assimilator's Jubbah +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23547 -- Assimilator's Bazubands +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23614 -- Assimilator's Shalwar +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23681 -- Assimilator's Charuqs +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Assimilator's +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.COR) then
			-- itemId = 23414 -- Laksamana's Tricorne +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23481 -- Laksamana's Frac +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23548 -- Laksamana's Gants +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23615 -- Laksamana's Trews +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23682 -- Laksamana's Bottes +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Laksamana's +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.PUP) then
			-- itemId = 23415 -- Foire Taj +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23482 -- Foire Tobe +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23549 -- Foire Dastanas +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23616 -- Foire Churidars +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23683 -- Foire Babouches +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Foire +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DNC) then
			-- itemId = 23416 -- Maxixi Tiara +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23483 -- Maxixi Casaque +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23550 -- Maxixi Bangles +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23617 -- Maxixi Tights +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23684 -- Maxixi Toe Shoes +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Maxixi +2 set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SCH) then
			-- itemId = 23417 -- Academic's Mortarboard +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23484 -- Academic's Gown +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23551 -- Academic's Bracers +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23618 -- Academic's Pants +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23685 -- Academic's Loafers +2
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Academic's +2 set.", target ) )
		end
	end
end