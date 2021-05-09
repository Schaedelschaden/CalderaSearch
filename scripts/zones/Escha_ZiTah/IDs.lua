-----------------------------------
-- Area: Escha_ZiTah
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.ESCHA_ZITAH] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED          = 6398, -- You obtain <number> <item>!
		NOTHING_OUT_OF_ORDINARY = 6403, -- There is nothing out of the ordinary here.
		SILT_OBTAINED           = 7688, -- You receive <number> pinches of escha silt.
		SILT_OBTAINED_TOTAL     = 7689, -- You receive <number> pinches of escha silt for a total of <number>.
		BEAD_OBTAINED           = 7690, -- You receive <number> escha beads.
		BEAD_OBTAINED_TOTAL     = 7691, -- You receive <number> escha beads for a total of <number>.
    },
    mob =
    {
		WEPWAWET 			= 17957298,
		LUSTFUL_LYDIA 		= 17957301,
		AGLAOPHOTIS			= 17957304,
		TANGATA_MANU 		= 17957307,
		VIDALA 				= 17957310,
		GESTALT 			= 17957313,
		ANGRBODA 			= 17957316,
		CUNNAST 			= 17957319,
		REVETAUR 			= 17957322,
		FERRODON 			= 17957325,
		GULLTOP 			= 17957328,
		VYALA 				= 17957331,
		IONOS 				= 17957352,
		SENSUAL_SANDY 		= 17957355,
		NOSOI 				= 17957358,
		BRITTLIS 			= 17957361,
		KAMOHOALII 			= 17957364,
		UMDHLEBI 			= 17957367,
		FLEETSTALKER 		= 17957370,
		SHOCKMAW 			= 17957373,
		URMAHLULU 			= 17957376,
		ALPLUACHRA 			= 17957343,
		BUCCA 				= 17957337,
		PUCA 				= 17957340,
		BLAZEWING 			= 17957379,
		PAZUZU 				= 17957346,
		WRATHARE 			= 17957349
    },
    npc =
    {
		QM1 = 17957436,
		QM2 = 17957437,
		QM3 = 17957438,
		QM4 = 17957439,
		QM5 = 17957440,
		QM6 = 17957441,
		QM7 = 17957442,
		QM8 = 17957443,
		QM9 = 17957444,
		QM10 = 17957445,
		QM11 = 17957446,
		QM12 = 17957447
    },
}

return zones[tpz.zone.ESCHA_ZITAH]
