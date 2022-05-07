-----------------------------------
-- Area: La_Theine_Plateau
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.LA_THEINE_PLATEAU] =
{
    text =
    {
        NOTHING_HAPPENS              = 119,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED      = 6384,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6390,  -- Obtained: <item>.
        GIL_OBTAINED                 = 6391,  -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6393,  -- Obtained key item: <keyitem>.
        FELLOW_MESSAGE_OFFSET        = 6419,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS          = 7001,  -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY      = 7002,  -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER                 = 7003,  -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE                = 7057,  -- Tallying conquest results...
        ALREADY_OBTAINED_TELE        = 7216,  -- You already possess the gate crystal for this telepoint.
        FISHING_MESSAGE_OFFSET       = 7220,  -- You can't fish here.
        DIG_THROW_AWAY               = 7233,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                 = 7235,  -- You dig and you dig, but find nothing.
        RESCUE_DRILL                 = 7392,  -- Rescue drills in progress. Try to stay out of the way.
        FAURBELLANT_1                = 7432,  -- Greetings. traveler. Sorry, I've little time to chat. I must focus on my prayer.
        FAURBELLANT_2                = 7433,  -- Ah, the <item>! Thank you for making such a long journey to bring this! May the Gates of Paradise open to all.
        FAURBELLANT_3                = 7434,  -- Please deliver that <item> to the high priest in the San d'Oria Cathedral.
        FAURBELLANT_4                = 7435,  -- My thanks again for your services. May the Gates of Paradise open to all.
        UNLOCK_SUMMONER              = 7587,  -- You can now become a summoner.
        UNLOCK_CARBUNCLE             = 7588,  -- You can now summon Carbuncle.
        CANNOT_REMOVE_FRAG           = 7602,  -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG        = 7603,  -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS       = 7604,  -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS              = 7605,  -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT              = 7606,  -- It is an ancient Zilart monument.
        ITEMS_ITEMS_LA_LA            = 7751,  -- You can hear a strange voice... Items, items, la la la la la
        GOBLIN_SLIPPED_AWAY          = 7757,  -- The Goblin slipped away when you were not looking...
        TELEPOINT_HAS_BEEN_SHATTERED = 7767,  -- The telepoint has been shattered into a thousand pieces...
        BROKEN_EGG                   = 7838,  -- There is a broken egg on the ground here. Perhaps there is a nest in the boughs of this tree.
        CHOCOBO_TRACKS               = 7899,  -- There are chocobo tracks on the ground here.
        PLAYER_OBTAINS_ITEM          = 7918,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM        = 7919,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM     = 7920,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP         = 7921,  -- You already possess that temporary item.
        NO_COMBINATION               = 7926,  -- You were unable to enter a combination.
        VOIDWALKER_DESPAWN           = 7957,  -- The monster fades before your eyes, a look of disappointment on its face.
        MEMORIES_SEALED_OFF          = 8082,  -- A portion of your memories has been sealed off.
        REGIME_REGISTERED            = 10137, -- New training regime registered!
        VOIDWALKER_NO_MOB            = 11310, -- The <keyitem> quivers ever so slightly, but emits no light. There seem to be no monsters in the area.
        VOIDWALKER_MOB_TOO_FAR       = 11311, -- The <keyitem> quivers ever so slightly and emits a faint light. There seem to be no monsters in the immediate vicinity.
        VOIDWALKER_MOB_HINT          = 11312, -- The <keyitem> resonates [feebly/softly/solidly/strongly/very strongly/furiously], sending a radiant beam of light lancing towards a spot roughly <number> [yalm/yalms] [east/southeast/south/southwest/west/northwest/north/northeast] of here.
        VOIDWALKER_SPAWN_MOB         = 11313, -- A monster materializes out of nowhere!
        VOIDWALKER_UPGRADE_KI_1      = 11315, -- The <keyitem> takes on a slightly deeper hue and becomes <keyitem>!
        VOIDWALKER_UPGRADE_KI_2      = 11316, -- The <keyitem> takes on a deeper, richer hue and becomes <keyitem>!
        VOIDWALKER_BREAK_KI          = 11317, -- The <keyitem> shatters into tiny fragments.
        VOIDWALKER_OBTAIN_KI         = 11318, -- Obtained key item: <keyitem>!
        COMMON_SENSE_SURVIVAL        = 12345, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        TUMBLING_TRUFFLE_PH =
        {
            [17195256] = 17195259, -- 450.472 70.657 238.237
        },
        LUMBERING_LAMBERT_PH =
        {
            [17195143] = 17195317, -- -372 -16 -6
            [17195316] = 17195317, -- -117 -1 -136
            [17195317] = 17195318, -- Lumbering can't spawn if Bloodtear is up
        },
        BLOODTEAR_PH =
        {
            [17195143] = 17195318, -- -372 -16 -6
            [17195316] = 17195318, -- -117 -1 -136
            [17195317] = 17195318, -- -216 -8 -107
            [17195318] = 17195317, -- Bloodtear can't spawn if Lumbering is up
        },
        NIHNIKNOOVI    = 17195475,
    },
    npc =
    {
        FALLEN_EGG  = 17195583,
        CASKET_BASE = 17195584,
        RAINBOW     = 17195607,
    },
}

return zones[tpz.zone.LA_THEINE_PLATEAU]
