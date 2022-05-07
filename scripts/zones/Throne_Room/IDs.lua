-----------------------------------
-- Area: Throne_Room
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.THRONE_ROOM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6390, -- Obtained: <item>.
        GIL_OBTAINED            = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6393, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS     = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE           = 7057, -- Tallying conquest results...
        NO_HIDE_AWAY            = 7706, -- I have not been hiding away from my troubles!
        FEEL_MY_PAIN            = 7707, -- Feel my twenty years of pain!
        YOUR_ANSWER             = 7708, -- Is that your answer!?
        RETURN_TO_THE_DARKNESS  = 7709, -- Return with your soul to the darkness you came from!
        CANT_UNDERSTAND         = 7710, -- You--a man who has never lived bound by the chains of his country--how can you understand my pain!?
        BLADE_ANSWER            = 7711, -- Let my blade be the answer!
    },
    mob =
    {
        SHADOW_LORD_STAGE_2_OFFSET = 17453060,
        ZEID_BCNM_OFFSET           = 17453063,
    },
    npc =
    {
    },
}

return zones[tpz.zone.THRONE_ROOM]
