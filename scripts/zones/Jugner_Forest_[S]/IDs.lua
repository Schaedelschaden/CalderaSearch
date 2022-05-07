-----------------------------------
-- Area: Jugner_Forest_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.JUGNER_FOREST_S] =
{
    text =
    {
        NOTHING_HAPPENS           = 119,  -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED   = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6390, -- Obtained: <item>.
        GIL_OBTAINED              = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6393, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY   = 6404, -- There is nothing out of the ordinary here.
        CARRIED_OVER_POINTS       = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY   = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER              = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        LOGGING_IS_POSSIBLE_HERE  = 7077, -- Logging is possible here if you have <item>.
        FISHING_MESSAGE_OFFSET    = 7370, -- You can't fish here.
        ALREADY_OBTAINED_TELE     = 7706, -- You already possess the gate crystal for this telepoint.
        YOU_FIND_SPARKLING_STONE  = 7724, -- You find a sparkling stone.
        ELEGANT_FOOTPRINTS        = 8399, -- You see numerous sets of elegant footprints.
        LILISETTE_IS_PREPARING    = 8400, -- Lilisette is preparing a new trap in an attempt to catch the ever-elusive Cait Sith. Bring her <item> to use as bait.
        IDEAL_PLACE_TO_PLANT_ITEM = 8529, -- This seems to be an ideal place to plant <item>.
        YOU_PLANT_ITEM            = 8530, -- You plant <item>.
        ITEM_IS_PLANTED_HERE      = 8531, -- <item> has been planted here...
        VOIDWALKER_DESPAWN        = 8558, -- The monster fades before your eyes, a look of disappointment on its face.
        VOIDWALKER_NO_MOB         = 8605, -- The <keyitem> quivers ever so slightly, but emits no light. There seem to be no monsters in the area.
        VOIDWALKER_MOB_TOO_FAR    = 8606, -- The <keyitem> quivers ever so slightly and emits a faint light. There seem to be no monsters in the immediate vicinity.
        VOIDWALKER_MOB_HINT       = 8607, -- The <keyitem> resonates [feebly/softly/solidly/strongly/very strongly/furiously], sending a radiant beam of light lancing towards a spot roughly <number> [yalm/yalms] [east/southeast/south/southwest/west/northwest/north/northeast] of here.
        VOIDWALKER_SPAWN_MOB      = 8608, -- A monster materializes out of nowhere!
        VOIDWALKER_UPGRADE_KI_1   = 8610, -- The <keyitem> takes on a slightly deeper hue and becomes <keyitem>!
        VOIDWALKER_UPGRADE_KI_2   = 8611, -- The <keyitem> takes on a deeper, richer hue and becomes <keyitem>!
        VOIDWALKER_BREAK_KI       = 8612, -- The <keyitem> shatters into tiny fragments.
        VOIDWALKER_OBTAIN_KI      = 8613, -- Obtained key item: <keyitem>!
        COMMON_SENSE_SURVIVAL     = 9508, -- It appears that you have arrived at a new survival guide provided by the Servicemen's Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        DRUMSKULL_ZOGDREGG_PH =
        {
            [17113380] = 17113381, -- 195.578 -0.556 -347.699
        },
        FINGERFILCHER_DRADZAD = 17113462,
        COBRACLAW_BUCHZVOTCH  = 17113464,
    },
    npc =
    {
        LOGGING =
        {
            17113901,
            17113902,
            17113903,
            17113904,
            17113905,
            17113906,
        },
    },
}

return zones[tpz.zone.JUGNER_FOREST_S]
