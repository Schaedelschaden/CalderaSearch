-----------------------------------
-- Area: Zhayolm_Remnants
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.ZHAYOLM_REMNANTS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6383, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
        CELL_OFFSET             = 7213, -- Main Weapon/Sub-Weapon restriction removed.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.ZHAYOLM_REMNANTS]
