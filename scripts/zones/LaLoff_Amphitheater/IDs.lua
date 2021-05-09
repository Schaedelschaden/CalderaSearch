-----------------------------------
-- Area: LaLoff_Amphitheater
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.LALOFF_AMPHITHEATER] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7050, -- Tallying conquest results...
    },
    mob =
    {
    },
    npc =
    {
        ENTRANCE_OFFSET = 17514791, -- used by scripts/globals/bcnm.lua
    },
}

return zones[tpz.zone.LALOFF_AMPHITHEATER]
