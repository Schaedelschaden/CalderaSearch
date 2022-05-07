-----------------------------------
-- Area: Sacrarium
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.SACRARIUM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED   = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6390, -- Obtained: <item>.
        GIL_OBTAINED              = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6393, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY   = 6404, -- There is nothing out of the ordinary here.
        CARRIED_OVER_POINTS       = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY   = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER              = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE             = 7057, -- Tallying conquest results...
        LARGE_KEYHOLE_DESCRIPTION = 7223, -- The gate is securely closed with two locks. This keyhole is engraved with a sealion insignia.
        SMALL_KEYHOLE_DESCRIPTION = 7224, -- The gate is securely closed with two locks. This keyhole is engraved with a coral insignia.
        KEYHOLE_DAMAGED           = 7225, -- The keyhole is damaged.  The gate cannot be opened from this side.
        CANNOT_OPEN_SIDE          = 7226, -- The gate cannot be opened from this side.
        CANNOT_TRADE_NOW          = 7227, -- You cannot trade right now.
        STURDY_GATE               = 7228, -- A sturdy iron gate. It is secured with two locks--a main lock and a sublock.
        CORAL_KEY_BREAKS          = 7232, -- The <item> breaks!
        EVIL_PRESENCE             = 7266, -- You sense an evil presence!
        DRAWER_OPEN               = 7267, -- You open the drawer.
        DRAWER_EMPTY              = 7268, -- There is nothing inside.
        DRAWER_SHUT               = 7269, -- The drawer is jammed shut.
        CHEST_UNLOCKED            = 7358, -- You unlock the chest!
        START_GET_GOOSEBUMPS      = 7368, -- You start to get goosebumps.
        HEART_RACING              = 7369, -- Your heart is racing.
        LEAVE_QUICKLY_AS_POSSIBLE = 7370, -- Your common sense tells you to leave as quickly as possible.
        NOTHING_HAPPENS           = 7373, -- Nothing happens.
        COMMON_SENSE_SURVIVAL     = 7377, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        SWIFT_BELT_NMS          =
        {
            {16892068, {[tpz.race.HUME_M]   = true, [tpz.race.HUME_F]   = true}}, -- Balor (hume)
            {16892069, {[tpz.race.ELVAAN_M] = true, [tpz.race.ELVAAN_F] = true}}, -- Luaith (elvaan)
            {16892070, {[tpz.race.TARU_M]   = true, [tpz.race.TARU_F]   = true}}, -- Lobais (tarutaru)
            {16892073, {[tpz.race.MITHRA]   = true}},                             -- Caithleann (mithra)
            {16892074, {[tpz.race.GALKA]    = true}},                             -- Indich (galka)
        },
        OLD_PROFESSOR_MARISELLE = 16891970,
    },
    npc =
    {
        STALE_DRAFT_OFFSET = 16892097,
        LABYRINTH_OFFSET   = 16892110,
        SMALL_KEYHOLE      = 16892142,
        TREASURE_CHEST     = 16892183,
    },
}

return zones[tpz.zone.SACRARIUM]
