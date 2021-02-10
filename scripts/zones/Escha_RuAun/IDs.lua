-----------------------------------
-- Area: Escha_RuAun
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.ESCHA_RUAUN] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6383, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED          = 6398, -- You obtain <number> <item>!
		NOTHING_OUT_OF_ORDINARY = 6403, -- There is nothing out of the ordinary here.
		ITEM_USED               = 7553, -- You have used <item>.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.ESCHA_RUAUN]
