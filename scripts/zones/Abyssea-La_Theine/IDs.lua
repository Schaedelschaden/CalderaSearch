-----------------------------------
-- Area: Abyssea-La_Theine
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.ABYSSEA_LA_THEINE] =
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
			[17317897] = {reward = tpz.ki.SMOLDERING_CRAB_SHELL},    -- Nahn
			[17318435] = {reward = tpz.ki.MARBLED_MUTTON_CHOP},      -- Trudging Thomas
			[17318436] = {reward = tpz.ki.BLOODIED_SABER_TOOTH},     -- Megantereon
			[17318437] = {reward = tpz.ki.DENTED_GIGAS_SHIELD},      -- Adamastor
			[17318438] = {reward = tpz.ki.WARPED_GIGAS_ARMBAND},     -- Pantagruel
			[17318439] = {reward = tpz.ki.SEVERED_GIGAS_COLLAR},     -- Grandgousier
			[17318440] = {reward = tpz.ki.PELLUCID_FLY_EYE},         -- La Theine Leige
			[17318441] = {reward = tpz.ki.SHIMMERING_PIXIE_PINION},  -- Baba Yaga
			[17318446] = {reward = tpz.ki.BLOOD_SMEARED_GIGAS_HELM}, -- Briareus
			[17318447] = {reward = tpz.ki.GLITTERING_PIXIE_CHOKER},  -- Carabosse
			[17318456] = {reward = tpz.ki.BLOOD_SMEARED_GIGAS_HELM}, -- Briareus
			[17318457] = {reward = tpz.ki.GLITTERING_PIXIE_CHOKER},  -- Carabosse
			[17318459] = {reward = tpz.ki.BLOOD_SMEARED_GIGAS_HELM}, -- Briareus
			[17318460] = {reward = tpz.ki.GLITTERING_PIXIE_CHOKER},  -- Carabosse
		}
    },
    npc =
    {
        QM_POPS =
        {
            -- TODO: the first item, e.g. 'qm1', is unused and will be meaningless once I (Wren) finish entity-QC on all Abyssea zones.
            -- When that is done, I will rewrite Abyssea global and adjust and neaten this table
            [17318473] = { 'qm1', {2891},                                                                                                                         {}, 17318434}, -- Dozing Dorian
            [17318474] = { 'qm2', {2892},                                                                                                                         {}, 17318435}, -- Trudging Thomas
            [17318475] = { 'qm3', {2893},                                                                                                                         {}, 17318436}, -- Megantereon
            [17318476] = { 'qm4', {2894},                                                                                                                         {}, 17318437}, -- Adamastor
            [17318477] = { 'qm5', {2895},                                                                                                                         {}, 17318438}, -- Pantagruel
            [17318478] = { 'qm6', {2896},                                                                                                                         {}, 17318439}, -- Grandgousier
            [17318479] = { 'qm7', {2897},                                                                                                                         {}, 17318440}, -- La Theine Liege
            [17318480] = { 'qm8', {2898},                                                                                                                         {}, 17318441}, -- Baba Yaga
            [17318481] = { 'qm9', {2899},                                                                                                                         {}, 17318442}, -- Nguruvilu
            [17318482] = {'qm10', {2900},                                                                                                                         {}, 17318443}, -- Poroggo Dom Juan
            [17318483] = {'qm11', {2901},                                                                                                                         {}, 17318444}, -- Toppling Tuber
            [17318484] = {'qm12', {2902},                                                                                                                         {}, 17318445}, -- Lugarhoo
            [17318485] = {'qm13',     {},                                     {tpz.ki.DENTED_GIGAS_SHIELD, tpz.ki.WARPED_GIGAS_ARMBAND, tpz.ki.SEVERED_GIGAS_COLLAR}, 17318446}, -- Briareus
            [17318486] = {'qm14',     {},                                                                  {tpz.ki.PELLUCID_FLY_EYE, tpz.ki.SHIMMERING_PIXIE_PINION}, 17318447}, -- Carabosse
            [17318487] = {'qm15',     {}, {tpz.ki.MARBLED_MUTTON_CHOP, tpz.ki.BLOODIED_SABER_TOOTH, tpz.ki.GLITTERING_PIXIE_CHOKER, tpz.ki.BLOOD_SMEARED_GIGAS_HELM}, 17318448}, -- Hadhayosh
            [17318488] = {'qm16',     {},                                     {tpz.ki.DENTED_GIGAS_SHIELD, tpz.ki.WARPED_GIGAS_ARMBAND, tpz.ki.SEVERED_GIGAS_COLLAR}, 17318456}, -- Briareus
            [17318489] = {'qm17',     {},                                                                  {tpz.ki.PELLUCID_FLY_EYE, tpz.ki.SHIMMERING_PIXIE_PINION}, 17318457}, -- Carabosse
            [17318490] = {'qm18',     {}, {tpz.ki.MARBLED_MUTTON_CHOP, tpz.ki.BLOODIED_SABER_TOOTH, tpz.ki.GLITTERING_PIXIE_CHOKER, tpz.ki.BLOOD_SMEARED_GIGAS_HELM}, 17318458}, -- Hadhayosh
            [17318491] = {'qm19',     {},                                     {tpz.ki.DENTED_GIGAS_SHIELD, tpz.ki.WARPED_GIGAS_ARMBAND, tpz.ki.SEVERED_GIGAS_COLLAR}, 17318459}, -- Briareus
            [17318492] = {'qm20',     {},                                                                  {tpz.ki.PELLUCID_FLY_EYE, tpz.ki.SHIMMERING_PIXIE_PINION}, 17318460}, -- Carabosse
            [17318493] = {'qm21',     {}, {tpz.ki.MARBLED_MUTTON_CHOP, tpz.ki.BLOODIED_SABER_TOOTH, tpz.ki.GLITTERING_PIXIE_CHOKER, tpz.ki.BLOOD_SMEARED_GIGAS_HELM}, 17318461}, -- Hadhayosh
			[17318648] = {'qm22',     {},                                                                                             {tpz.ki.SMOLDERING_CRAB_SHELL}, 17317898}, -- Karkinos
        },
    },
}

return zones[tpz.zone.ABYSSEA_LA_THEINE]