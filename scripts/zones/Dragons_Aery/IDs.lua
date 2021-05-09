-----------------------------------
-- Area: Dragons_Aery
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.DRAGONS_AERY] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6387, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6389, -- Obtained: <item>.
        GIL_OBTAINED               = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6392, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED             = 6398, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6403, -- There is nothing out of the ordinary here.
		IRREPRESSIBLE_MIGHT        = 6407, -- An aura of irrepressible might threatens to overwhelm you...
        FISHING_MESSAGE_OFFSET     = 7050, -- You can't fish here.
        CONQUEST_BASE              = 7152, -- Tallying conquest results...
        COMMON_SENSE_SURVIVAL      = 7496, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        FAFNIR  = 17408018,
        NIDHOGG = 17408019,
    },
    npc =
    {
        FAFNIR_QM = 17408033,
    },
}

return zones[tpz.zone.DRAGONS_AERY]
