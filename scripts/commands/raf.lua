---------------------------------------------------------------------------------------------------
-- func: !raf3 <player> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4>
-- desc: Gives the Reforged Artifact set with augments to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!raf <player>")
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
			itemId = 27663 -- Pummeler's Mask
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27807 -- Pummeler's Lorica
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27943 -- Pummeler's Mufflers
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28090 -- Pummeler's Cuisses
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 228223 -- Pummeler's Calligae
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Pummeler's set.", target ) )
		elseif (targ:getMainJob() == tpz.job.MNK) then
			itemId = 27664 -- Anchorite's Crown
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27808 -- Anchorite's Cyclas
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27944 -- Anchorite's Gloves
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28091 -- Anchorite's Hose
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28224 -- Anchorite's Gaiters
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Anchorite set.", target ) )
		elseif (targ:getMainJob() == tpz.job.WHM) then
			itemId = 27665 -- Theophany Cap
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27809 -- Theophany Briault
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27945 -- Theophany Mitts
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28092 -- Theophany Pantaloons
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28225 -- Theophany Duckbills
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Theophany set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BLM) then
			itemId = 227666 -- Spaekona's Petasos
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27810 -- Spaekona's Coat
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27946 -- Spaekona's Gloves
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28093 -- Spaekona's Tonban
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 28226 -- Spaekona's Sabots
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Spaekona's set.", target ) )
		elseif (targ:getMainJob() == tpz.job.RDM) then
			itemId = 23402 -- Atrophy Chapeau
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23469 -- Atrophy Tabard
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23536 -- Atrophy Gloves
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23603 -- Atrophy Tights
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23670 -- Atrophy Boots
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Atrophy set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.THF) then
			-- itemId = 23403 -- Pillager's Bonnet
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23470 -- Pillager's Vest
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23537 -- Pillager's Armlets
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23604 -- Pillager's Culottes
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23671 -- Pillager's Poulaines
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Pillager's set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.PLD) then
			-- itemId = 23404 -- Reverence Coronet
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23471 -- Reverence Surcoat
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23538 -- Reverence Gauntlets
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23605 -- Reverence Breeches
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23672 -- Reverence Leggings
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Reverence set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DRK) then
			-- itemId = 23405 -- Ignominy Burgeonet
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23472 -- Ignominy Cuirass
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23539 -- Ignominy Finger Gauntlets
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23606 -- Ignominy Flanchard
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23673 -- Ignominy Sollerets
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Ignominy set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BST) then
			-- itemId = 23406 -- Totemic Helm
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23473 -- Totemic Jackcoat
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23540 -- Totemic Gloves
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23607 -- Totemic Trousers
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23674 -- Totemic Gaiters
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Totemic set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BRD) then
			-- itemId = 23407 -- Brioso Roundlet
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23474 -- Brioso Justaucorps
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23541 -- Brioso Cuffs
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23608 -- Brioso Cannions
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23675 -- Brioso Slippers
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Brioso set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.RNG) then
			-- itemId = 23408 -- Orion Beret
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23475 -- Orion Jerkin
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23542 -- Orion Bracer
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23609 -- Orion Braccae
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23676 -- Orion Socks
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Orion set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SAM) then
			-- itemId = 23409 -- Wakido Kabuto
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23476 -- Wakido Domaru
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23543 -- Wakido Kote
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23610 -- Wakido Haidate
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23677 -- Wakido Sune-Ate
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Wakido set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.NIN) then
			-- itemId = 23410 -- Hachiya Hatsuburi
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23477 -- Hachiya Chainmail
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23544 -- Hachiya Tekko
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23611 -- Hachiya Hakama
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23678 -- Hachiya Kyahan
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Hachiya set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DRG) then
			-- itemId = 23411 -- Vishap Armet
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23478 -- Vishap Mail
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23545 -- Vishap Finger Gauntlets
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23612 -- Vishap Brais
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23679 -- Vishap Greaves
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Vishap set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SMN) then
			-- itemId = 23412 -- Convoker's Horn
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23479 -- Convoker's Doublet
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23546 -- Convoker's Bracers
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23613 -- Convoker's Spats
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23680 -- Convoker's Pigaches
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Convoker's set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.BLU) then
			-- itemId = 23413 -- Assimilator's Keffiyeh
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23480 -- Assimilator's Jubbah
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23547 -- Assimilator's Bazubands
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23614 -- Assimilator's Shalwar
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23681 -- Assimilator's Charuqs
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Assimilator's set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.COR) then
			-- itemId = 23414 -- Laksamana's Tricorne
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23481 -- Laksamana's Frac
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23548 -- Laksamana's Gants
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23615 -- Laksamana's Trews
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23682 -- Laksamana's Bottes
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Laksamana's set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.PUP) then
			-- itemId = 23415 -- Foire Taj
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23482 -- Foire Tobe
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23549 -- Foire Dastanas
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23616 -- Foire Churidars
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23683 -- Foire Babouches
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Foire set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.DNC) then
			-- itemId = 23416 -- Maxixi Tiara
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23483 -- Maxixi Casaque
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23550 -- Maxixi Bangles
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23617 -- Maxixi Tights
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23684 -- Maxixi Toe Shoes
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Maxixi set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.SCH) then
			-- itemId = 23417 -- Academic's Mortarboard
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23484 -- Academic's Gown
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23551 -- Academic's Bracers
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23618 -- Academic's Pants
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23685 -- Academic's Loafers
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Academic's set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.GEO) then
			-- itemId = 23418 -- Geomancy Galero
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23485 -- Geomancy Tunic
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23552 -- Geomancy Mitaines
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23619 -- Geomancy Pants
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23686 -- Geomancy Sandals
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Geomancy set.", target ) )
		-- elseif (targ:getMainJob() == tpz.job.RUN) then
			-- itemId = 23419 -- Runeist Bandeau
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23486 -- Runeist Coat
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23553 -- Runeist Mitons
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23620 -- Runeist Trousers
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- itemId = 23687 -- Runeist Boots
			-- targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			-- targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			-- player:PrintToPlayer( string.format( "Gave '%s' the Runeist set.", target ) )
		end
	end
end