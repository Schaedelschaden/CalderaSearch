---------------------------------------------------------------------------------------------------
-- func: !rrel3 <player> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4>
-- desc: Gives the Reforged Relic +3 set with augments to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!rrel3 <player>")
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
			itemId = 23398 -- Agoge Mask +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23465 -- Agoge Lorica +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23532 -- Agoge Mufflers +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23599 -- Agoge Cuisses +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23666 -- Agoge Calligae +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Agoge +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.MNK) then
			itemId = 23399 -- Hesychast's Crown +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23466 -- Hesychast's Cyclas +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23533 -- Hesychast's Gloves +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23600 -- Hesychast's Hose +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23667 -- Hesychast's Gaiters +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Hesychast +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.WHM) then
			itemId = 23400 -- Piety Cap +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23467 -- Piety Briault +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23534 -- Piety Mitts +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23601 -- Piety Pantaloons +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23668 -- Piety Duckbills +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Piety +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BLM) then
			itemId = 23401 -- Archmage's Petasos +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23468 -- Archmage's Coat +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23535 -- Archmage's Gloves +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23602 -- Archmage's Tonban +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23669 -- Archmage's Sabots +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Archmage's +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.RDM) then
			itemId = 23402 -- Vitiation Chapeau +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23469 -- Vitiation Tabard +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23536 -- Vitiation Gloves +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23603 -- Vitiation Tights +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23670 -- Vitiation Boots +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Vitiation +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.THF) then
			itemId = 23403 -- Plunderer's Bonnet +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23470 -- Plunderer's Vest +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23537 -- Plunderer's Armlets +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23604 -- Plunderer's Culottes +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23671 -- Plunderer's Poulaines +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Plunderer's +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.PLD) then
			itemId = 23404 -- Caballarius Coronet +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23471 -- Caballarius Surcoat +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23538 -- Caballarius Gauntlets +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23605 -- Caballarius Breeches +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23672 -- Caballarius Leggings +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Caballarius +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.DRK) then
			itemId = 23405 -- Fallen Burgeonet +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23472 -- Fallen Cuirass +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23539 -- Fallen Finger Gauntlets +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23606 -- Fallen Flanchard +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23673 -- Fallen Sollerets +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Fallen +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BST) then
			itemId = 23406 -- Ankusa Helm +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23473 -- Ankusa Jackcoat +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23540 -- Ankusa Gloves +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23607 -- Ankusa Trousers +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23674 -- Ankusa Gaiters +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Ankusa +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BRD) then
			itemId = 23407 -- Bihu Roundlet +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23474 -- Bihu Justaucorps +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23541 -- Bihu Cuffs +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23608 -- Bihu Cannions +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23675 -- Bihu Slippers +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Bihu +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.RNG) then
			itemId = 23408 -- Arcadian Beret +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23475 -- Arcadian Jerkin +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23542 -- Arcadian Bracer +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23609 -- Arcadian Braccae +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23676 -- Arcadian Socks +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Arcadian +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.SAM) then
			itemId = 23409 -- Sakonji Kabuto +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23476 -- Sakonji Domaru +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23543 -- Sakonji Kote +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23610 -- Sakonji Haidate +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23677 -- Sakonji Sune-Ate +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Sakonji +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.NIN) then
			itemId = 23410 -- Mochizuki Hatsuburi +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23477 -- Mochizuki Chainmail +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23544 -- Mochizuki Tekko +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23611 -- Mochizuki Hakama +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23678 -- Mochizuki Kyahan +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Mochizuki +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.DRG) then
			itemId = 23411 -- Pteroslaver Armet +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23478 -- Pteroslaver Mail +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23545 -- Pteroslaver Finger Gauntlets +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23612 -- Pteroslaver Brais +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23679 -- Pteroslaver Greaves +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Pteroslaver +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.SMN) then
			itemId = 23412 -- Glyphic Horn +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23479 -- Glyphic Doublet +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23546 -- Glyphic Bracers +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23613 -- Glyphic Spats +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23680 -- Glyphic Pigaches +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Glyphic +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BLU) then
			itemId = 23413 -- Luhlaza Keffiyeh +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23480 -- Luhlaza Jubbah +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23547 -- Luhlaza Bazubands +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23614 -- Luhlaza Shalwar +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23681 -- Luhlaza Charuqs +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Luhlaza +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.COR) then
			itemId = 23414 -- Lanun Tricorne +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23481 -- Lanun Frac +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23548 -- Lanun Gants +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23615 -- Lanun Trews +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23682 -- Lanun Bottes +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Lanun +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.PUP) then
			itemId = 23415 -- Pitre Taj +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23482 -- Pitre Tobe +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23549 -- Pitre Dastanas +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23616 -- Pitre Churidars +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23683 -- Pitre Babouches +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Pitre +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.DNC) then
			itemId = 23416 -- Horos Tiara +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23483 -- Horos Casaque +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23550 -- Horos Bangles +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23617 -- Horos Tights +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23684 -- Horos Toe Shoes +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Horos +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.SCH) then
			itemId = 23417 -- Pedagogy Mortarboard +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23484 -- Pedagogy Gown +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23551 -- Pedagogy Bracers +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23618 -- Pedagogy Pants +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23685 -- Pedagogy Loafers +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Pedagogy +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.GEO) then
			itemId = 23418 -- Bagua Galero +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23485 -- Bagua Tunic +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23552 -- Bagua Mitaines +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23619 -- Bagua Pants +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23686 -- Bagua Sandals +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Bagua +3 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.RUN) then
			itemId = 23419 -- Futhark Bandeau +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23486 -- Futhark Coat +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23553 -- Futhark Mitons +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23620 -- Futhark Trousers +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23687 -- Futhark Boots +3
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Futhark +3 set.", target ) )
		end
	end
end