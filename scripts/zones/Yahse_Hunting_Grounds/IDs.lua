-----------------------------------
-- Area: Yahse_Hunting_Grounds
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.YAHSE_HUNTING_GROUNDS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6383, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
        UNCANNY_SENSATION       = 7859, -- You are assaulted by an uncanny sensation.
        ENERGIES_COURSE         = 7860, -- The arcane energies begin to course within your veins.
        MYSTICAL_WARMTH         = 7861, -- You feel a mystical warmth welling up inside you!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.YAHSE_HUNTING_GROUNDS]
