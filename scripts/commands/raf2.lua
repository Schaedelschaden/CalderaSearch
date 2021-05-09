---------------------------------------------------------------------------------------------------
-- func: !raf2 <player> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4>
-- desc: Gives the Reforged Artifact +2 set with augments to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
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
		elseif (targ:getMainJob() == tpz.job.THF) then
			itemId = 23045 -- Pillager's Bonnet +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23112 -- Pillager's Vest +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23179 -- Pillager's Armlets +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23246 -- Pillager's Culottes +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23313 -- Pillager's Poulaines +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Pillager's +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.PLD) then
			itemId = 23046 -- Reverence Coronet +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23113 -- Reverence Surcoat +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23180 -- Reverence Gauntlets +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23247 -- Reverence Breeches +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23314 -- Reverence Leggings +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Reverence +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.DRK) then
			itemId = 23047 -- Ignominy Burgeonet +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23114 -- Ignominy Cuirass +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23181 -- Ignominy Finger Gauntlets +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23248 -- Ignominy Flanchard +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23315 -- Ignominy Sollerets +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Ignominy +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BST) then
			itemId = 23048 -- Totemic Helm +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23115 -- Totemic Jackcoat +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23182 -- Totemic Gloves +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23249 -- Totemic Trousers +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23316 -- Totemic Gaiters +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Totemic +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BRD) then
			itemId = 23049 -- Brioso Roundlet +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23116 -- Brioso Justaucorps +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23183 -- Brioso Cuffs +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23250 -- Brioso Cannions +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23317 -- Brioso Slippers +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Brioso +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.RNG) then
			itemId = 23050 -- Orion Beret +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23117 -- Orion Jerkin +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23184 -- Orion Bracer +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23251 -- Orion Braccae +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23318 -- Orion Socks +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Orion +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.SAM) then
			itemId = 23051 -- Wakido Kabuto +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23118 -- Wakido Domaru +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23185 -- Wakido Kote +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23252 -- Wakido Haidate +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23319 -- Wakido Sune-Ate +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Wakido +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.NIN) then
			itemId = 23052 -- Hachiya Hatsuburi +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23119 -- Hachiya Chainmail +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23186 -- Hachiya Tekko +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23253 -- Hachiya Hakama +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23320 -- Hachiya Kyahan +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Hachiya +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.DRG) then
			itemId = 23053 -- Vishap Armet +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23120 -- Vishap Mail +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23187 -- Vishap Finger Gauntlets +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23254 -- Vishap Brais +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23321 -- Vishap Greaves +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Vishap +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.SMN) then
			itemId = 23054 -- Convoker's Horn +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23121 -- Convoker's Doublet +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23188 -- Convoker's Bracers +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23255 -- Convoker's Spats +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23322 -- Convoker's Pigaches +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Convoker's +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.BLU) then
			itemId = 23055 -- Assimilator's Keffiyeh +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23122 -- Assimilator's Jubbah +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23189 -- Assimilator's Bazubands +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23256 -- Assimilator's Shalwar +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23323 -- Assimilator's Charuqs +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Assimilator's +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.COR) then
			itemId = 23056 -- Laksamana's Tricorne +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23123 -- Laksamana's Frac +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23190 -- Laksamana's Gants +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23257 -- Laksamana's Trews +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23324 -- Laksamana's Bottes +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Laksamana's +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.PUP) then
			itemId = 23057 -- Foire Taj +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23124 -- Foire Tobe +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23191 -- Foire Dastanas +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23258 -- Foire Churidars +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23325 -- Foire Babouches +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Foire +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.DNC) then
			itemId = 23058 -- Maxixi Tiara +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23125 -- Maxixi Casaque +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23192 -- Maxixi Bangles +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23259 -- Maxixi Tights +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23326 -- Maxixi Toe Shoes +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Maxixi +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.SCH) then
			itemId = 23060 -- Academic's Mortarboard +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23127 -- Academic's Gown +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23194 -- Academic's Bracers +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23261 -- Academic's Pants +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23328 -- Academic's Loafers +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Academic's +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.GEO) then
			itemId = 23061 -- Geomancy Galero +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23128 -- Geomancy Tunic +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23195 -- Geomancy Mitaines +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23262 -- Geomancy Pants +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23329 -- Geomancy Sandals +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Geomancy +2 set.", target ) )
		elseif (targ:getMainJob() == tpz.job.RUN) then
			itemId = 23062 -- Runeist Bandeau +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23129 -- Runeist Coat +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23196 -- Runeist Mitons +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23263 -- Runeist Trousers +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23330 -- Runeist Boots +2
			targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave '%s' the Runeist +2 set.", target ) )
		end
	end
end