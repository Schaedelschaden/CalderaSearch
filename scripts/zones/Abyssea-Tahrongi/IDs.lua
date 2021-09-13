-----------------------------------
-- Area: Abyssea-Tahrongi
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.ABYSSEA_TAHRONGI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
        CRUOR_TOTAL             = 6987, -- Obtained <number> cruor. (Total: <number>)
        STAGGERED               = 7317, -- <name>'s attack staggers the fiend!
        YELLOW_STAGGER          = 7318, -- The fiend is unable to cast magic.
        BLUE_STAGGER            = 7319, -- The fiend is unable to use special attacks.
        RED_STAGGER             = 7320, -- The fiend is frozen in its tracks.
        YELLOW_WEAKNESS         = 7321, -- The fiend appears vulnerable to [/fire/ice/wind/earth/lightning/water/light/darkness] elemental magic!
        BLUE_WEAKNESS           = 7322, -- The fiend appears vulnerable to [/hand-to-hand/dagger/sword/great sword/axe/great axe/scythe/polearm/katana/great katana/club/staff/archery/marksmanship] weapon skills!
        RED_WEAKNESS            = 7323, -- The fiend appears vulnerable to [/fire/ice/wind/earth/lightning/water/light/darkness] elemental weapon skills!
        EXACT_TIME_REMAINING    = 7324, -- Your visitant status will wear off in <number> [second/minute].
        TIME_REMAINING          = 7325, -- Your visitant status will wear off in <number> [seconds/minutes].
        LOST_VISITANT_STATUS    = 7326, -- Your visitant status has worn off.
        VISITANT_EXTENDED       = 7327, -- Your visitant status has been extended by <number> [minute/minutes].
        EXIT_WARNING_1          = 7328, -- Exiting in <number> [minute/minutes].
        EXIT_WARNING_2          = 7329, -- Those without visitant status will be ejected from the area in <number> [minute/minutes]. To learn about this status, please consult a Conflux Surveyor.
        EXIT_WARNING_3          = 7330, -- Exiting in <number> [second/minute].
        EXIT_WARNING_4          = 7331, -- Exiting in <number> [seconds/minutes].
        EXITING_NOW             = 7332, -- Exiting now.
        WARD_WARNING_1          = 7333, -- Returning to the Searing Ward in <number> [second/seconds].
        WARD_WARNING_2          = 7334, -- You do not have visitant status. Returning to the Searing Ward in <number> [second/seconds].
        WARD_WARNING_3          = 7335, -- Returning to the Searing Ward in <number> [second/seconds].
        SEARING_WARD_TELE       = 7336, -- Returning to the Searing Ward now.
        CRUOR_OBTAINED          = 7496, -- <name> obtained <number> cruor.
        BOUNDLESS_RAGE          = 7573, -- You sense an aura of boundless rage...
        INFO_KI                 = 7574, -- Your keen senses tell you that something may happen if only you had [this item/these items].
        USE_KI                  = 7577, -- Use the [key item/key items]? Yes. No.
    },
    mob =
    {
		ON_DEATH_KI =
		{
			[16961919] = {reward = tpz.ki.VEINOUS_HECTEYES_EYELID},     -- Ophanim
			[16961921] = {reward = tpz.ki.TORN_BAT_WING},               -- Treble Noctules
			[16961923] = {reward = tpz.ki.GORY_SCORPION_CLAW},          -- Hedetet
			[16961925] = {reward = tpz.ki.FAT_LINED_COCKATRICE_SKIN},   -- Alectryon
			[16961927] = {reward = tpz.ki.LUXURIANT_MANTICORE_MANE},    -- Muscaliet
			[16961929] = {reward = tpz.ki.OVERGROWN_MANDRAGORA_FLOWER}, -- Chloris
			[16961930] = {reward = tpz.ki.CHIPPED_SANDWORM_TOOTH},      -- Glavoid
			[16961934] = {reward = tpz.ki.MOSSY_ADAMANTOISE_SHELL},     -- Chukwa
			[16961936] = {reward = tpz.ki.STICKY_GNAT_WING},            -- Adze
			[16961946] = {reward = tpz.ki.OVERGROWN_MANDRAGORA_FLOWER}, -- Chloris
			[16961947] = {reward = tpz.ki.CHIPPED_SANDWORM_TOOTH},      -- Glavoid
			[16961949] = {reward = tpz.ki.OVERGROWN_MANDRAGORA_FLOWER}, -- Chloris
			[16961950] = {reward = tpz.ki.CHIPPED_SANDWORM_TOOTH},      -- Glavoid
			[16961935] = {reward = tpz.ki.SODDEN_SANDWORM_HUSK},        -- Minhocao
			[16961904] = {reward = tpz.ki.VIRIDIAN_ABYSSITE_OF_MERIT},  -- Bhumi
		}
    },
    npc =
    {
        QM_POPS =
        {
            -- TODO: the first item, e.g. 'qm1', is unused and will be meaningless once I (Wren) finish entity-QC on all Abyssea zones.
            -- When that is done, I will rewrite Abyssea global and adjust and neaten this table
             [16961954] = { 'qm1',             {2915},                                                                                                                        {}, 16961917}, -- Halimede
             [16961955] = { 'qm2',             {2916},                                                                                                                        {}, 16961918}, -- Vetehinen
             [16961956] = { 'qm3', {2917, 2945, 2946},                                                                                                                        {}, 16961919}, -- Ophanim
             [16961957] = { 'qm4',             {2918},                                                                                                                        {}, 16961920}, -- Cannered Noz
             [16961958] = { 'qm5',       {2919, 2947},                                                                                                                        {}, 16961921}, -- Treble Noctules
             [16961959] = { 'qm6',             {2920},                                                                                                                        {}, 16961922}, -- Gancanagh
             [16961960] = { 'qm7',       {2921, 2948},                                                                                                                        {}, 16961923}, -- Hedetet
             [16961961] = { 'qm8',             {2922},                                                                                                                        {}, 16961924}, -- Abas
             [16961962] = { 'qm9',       {2923, 2949},                                                                                                                        {}, 16961925}, -- Alectryon
             [16961963] = {'qm10',             {2924},                                                                                                                        {}, 16961926}, -- Tefnet
             [16961964] = {'qm11',       {2925, 2950},                                                                                                                        {}, 16961927}, -- Muscaliet
             [16961965] = {'qm12',             {2926},                                                                                                                        {}, 16961928}, -- Lachrymater
             [16961966] = {'qm13',                 {},         {tpz.ki.VEINOUS_HECTEYES_EYELID, tpz.ki.TORN_BAT_WING, tpz.ki.GORY_SCORPION_CLAW, tpz.ki.MOSSY_ADAMANTOISE_SHELL}, 16961929}, -- Chloris
             [16961967] = {'qm14',                 {}, {tpz.ki.FAT_LINED_COCKATRICE_SKIN, tpz.ki.SODDEN_SANDWORM_HUSK, tpz.ki.LUXURIANT_MANTICORE_MANE, tpz.ki.STICKY_GNAT_WING}, 16961930}, -- Glavoid
             [16961968] = {'qm15',                 {},                                                       {tpz.ki.OVERGROWN_MANDRAGORA_FLOWER, tpz.ki.CHIPPED_SANDWORM_TOOTH}, 16961931}, -- Lacovie
             [16961969] = {'qm16',                 {},         {tpz.ki.VEINOUS_HECTEYES_EYELID, tpz.ki.TORN_BAT_WING, tpz.ki.GORY_SCORPION_CLAW, tpz.ki.MOSSY_ADAMANTOISE_SHELL}, 16961946}, -- Chloris
             [16961970] = {'qm17',                 {}, {tpz.ki.FAT_LINED_COCKATRICE_SKIN, tpz.ki.SODDEN_SANDWORM_HUSK, tpz.ki.LUXURIANT_MANTICORE_MANE, tpz.ki.STICKY_GNAT_WING}, 16961947}, -- Glavoid
             [16961971] = {'qm18',                 {},                                                       {tpz.ki.OVERGROWN_MANDRAGORA_FLOWER, tpz.ki.CHIPPED_SANDWORM_TOOTH}, 16961948}, -- Lacovie
             [16961972] = {'qm19',                 {},         {tpz.ki.VEINOUS_HECTEYES_EYELID, tpz.ki.TORN_BAT_WING, tpz.ki.GORY_SCORPION_CLAW, tpz.ki.MOSSY_ADAMANTOISE_SHELL}, 16961949}, -- Chloris
             [16961973] = {'qm20',                 {}, {tpz.ki.FAT_LINED_COCKATRICE_SKIN, tpz.ki.SODDEN_SANDWORM_HUSK, tpz.ki.LUXURIANT_MANTICORE_MANE, tpz.ki.STICKY_GNAT_WING}, 16961950}, -- Glavoid
             [16961974] = {'qm21',                 {},                                                       {tpz.ki.OVERGROWN_MANDRAGORA_FLOWER, tpz.ki.CHIPPED_SANDWORM_TOOTH}, 16961951}, -- Lacovie
        },
    },
}

return zones[tpz.zone.ABYSSEA_TAHRONGI]