---------------------------------------------------------------------------------------------------
-- func: !testemphq1
-- desc: Gives the materials for upgrading Reforged Empyrean NQ to Reforged Empyrean +1 to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
}

function onTrigger(player, job, slot)
    job = string.upper(job)

    -- Load needed text ids for target's current zone
    local ID = zones[player:getZoneID()]

    -- HQ+2 Emp  - Ravager's Mask +2, Ravager's Lorica +2, Ravager's Mufflers +2, Ravager's Cuisses +2, Ravager's Calligae +2,
    -- NQ REmp   - Boii Mask, Boii Lorica, Boii Mufflers, Boii Cuisses, Boii Calligae
    local empTrade =
    {
        11064, 11084, 11104, 11124, 11144,
        26740, 26898, 27052, 27237, 27411,
    }

    -- Bakka's Wing, Balaur Skull, Lieje Lantern, Chasmic Stinger, Keesha's Pamama, Marvin's Pelage,
    -- Mikey's Nugget, Chukwa's Egg, Cuelebre's Horn, Mictlantecuhtli's Habit, Manananggal's Necklet
    -- Etched Memory x3
    local empTradeMaterial =
    {
        2938, 2943, 2944, 2936, 2941, 2935,
        2942, 2933, 2939, 2940, 2934,
        9009
    }

    local empHQ1Recipe =
    {
        ["WAR"] =
        {
            [   1   ] = {   empTrade[   6   ]           ,   3226    ,   3217    ,   3210    ,   3226    ,   {empTradeMaterial[12], 3},  2967    ,   2965    }, -- boii_
            [   2   ] = {   empTrade[   7   ]           ,   3214    ,   3216    ,   3215    ,   3215    ,   {empTradeMaterial[12], 3},  2962    ,   2966    }, -- boii_
            [   3   ] = {   empTrade[   8   ]           ,   3224    ,   3214    ,   3212    ,   3222    ,   {empTradeMaterial[12], 3},  2967    ,   2962    }, -- boii_
            [   4   ] = {   empTrade[   9   ]           ,   3216    ,   3216    ,   3229    ,   3228    ,   {empTradeMaterial[12], 3},  2963    ,   2964    }, -- boii_
            [   5   ] = {   empTrade[   10  ]           ,   3219    ,   3224    ,   3228    ,   3228    ,   {empTradeMaterial[12], 3},  2962    ,   2965    }, -- boii_
        },
        ["MNK"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   2   ,   3216    ,   3228    ,   3211    ,   3212    ,   {empTradeMaterial[12], 3},  2967    ,   2965    }, -- bhikku_
            [   2   ] = {   empTrade[   7   ]   +   2   ,   3226    ,   3223    ,   3219    ,   3215    ,   {empTradeMaterial[12], 3},  2967    ,   2965    }, -- bhikku_
            [   3   ] = {   empTrade[   8   ]   +   2   ,   3215    ,   3217    ,   3225    ,   3216    ,   {empTradeMaterial[12], 3},  2965    ,   2966    }, -- bhikku_
            [   4   ] = {   empTrade[   9   ]   +   2   ,   3212    ,   3220    ,   3217    ,   3219    ,   {empTradeMaterial[12], 3},  2967    ,   2965    }, -- bhikku_
            [   5   ] = {   empTrade[   10  ]   +   2   ,   3219    ,   3227    ,   3220    ,   3215    ,   {empTradeMaterial[12], 3},  2965    ,   2965    }, -- bhikku_
        },
        ["WHM"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   4   ,   3229    ,   3223    ,   3221    ,   3227    ,   {empTradeMaterial[12], 3},  2963    ,   2964    }, -- ebers_
            [   2   ] = {   empTrade[   7   ]   +   4   ,   3210    ,   3214    ,   3218    ,   3214    ,   {empTradeMaterial[12], 3},  2965    ,   2962    }, -- ebers_
            [   3   ] = {   empTrade[   8   ]   +   4   ,   3226    ,   3216    ,   3226    ,   3212    ,   {empTradeMaterial[12], 3},  2964    ,   2966    }, -- ebers_
            [   4   ] = {   empTrade[   9   ]   +   4   ,   3211    ,   3226    ,   3210    ,   3219    ,   {empTradeMaterial[12], 3},  2962    ,   2964    }, -- ebers_
            [   5   ] = {   empTrade[   10  ]   +   4   ,   3224    ,   3210    ,   3214    ,   3217    ,   {empTradeMaterial[12], 3},  2967    ,   2962    }, -- ebers_
        },
        ["BLM"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   6   ,   3219    ,   3226    ,   3224    ,   3222    ,   {empTradeMaterial[12], 3},  2964    ,   2962    }, -- wicce_
            [   2   ] = {   empTrade[   7   ]   +   6   ,   3215    ,   3211    ,   3228    ,   3224    ,   {empTradeMaterial[12], 3},  2962    ,   2965    }, -- wicce_
            [   3   ] = {   empTrade[   8   ]   +   6   ,   3219    ,   3215    ,   3212    ,   3226    ,   {empTradeMaterial[12], 3},  2963    ,   2965    }, -- wicce_
            [   4   ] = {   empTrade[   9   ]   +   6   ,   3226    ,   3211    ,   3228    ,   3227    ,   {empTradeMaterial[12], 3},  2967    ,   2964    }, -- wicce_
            [   5   ] = {   empTrade[   10  ]   +   6   ,   3220    ,   3215    ,   3228    ,   3218    ,   {empTradeMaterial[12], 3},  2967    ,   2965    }, -- wicce_
        },
        ["RDM"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   8   ,   3212    ,   3220    ,   3221    ,   3214    ,   {empTradeMaterial[12], 3},  2967    ,   2965    }, -- lethargy_
            [   2   ] = {   empTrade[   7   ]   +   8   ,   3212    ,   3222    ,   3229    ,   3221    ,   {empTradeMaterial[12], 3},  2966    ,   2962    }, -- lethargy_
            [   3   ] = {   empTrade[   8   ]   +   8   ,   3211    ,   3228    ,   3217    ,   3211    ,   {empTradeMaterial[12], 3},  2963    ,   2963    }, -- lethargy_
            [   4   ] = {   empTrade[   9   ]   +   8   ,   3223    ,   3222    ,   3212    ,   3228    ,   {empTradeMaterial[12], 3},  2966    ,   2963    }, -- lethargy_
            [   5   ] = {   empTrade[   10  ]   +   8   ,   3227    ,   3216    ,   3228    ,   3222    ,   {empTradeMaterial[12], 3},  2966    ,   2963    }, -- lethargy_
        },
        ["THF"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   10  ,   3217    ,   3225    ,   3210    ,   3223    ,   {empTradeMaterial[12], 3},  2964    ,   2967    }, -- skulkers_
            [   2   ] = {   empTrade[   7   ]   +   10  ,   3224    ,   3221    ,   3212    ,   3221    ,   {empTradeMaterial[12], 3},  2966    ,   2967    }, -- skulkers_
            [   3   ] = {   empTrade[   8   ]   +   10  ,   3210    ,   3227    ,   3223    ,   3220    ,   {empTradeMaterial[12], 3},  2962    ,   2963    }, -- skulkers_
            [   4   ] = {   empTrade[   9   ]   +   10  ,   3221    ,   3220    ,   3223    ,   3225    ,   {empTradeMaterial[12], 3},  2966    ,   2962    }, -- skulkers_
            [   5   ] = {   empTrade[   10  ]   +   10  ,   3225    ,   3211    ,   3229    ,   3219    ,   {empTradeMaterial[12], 3},  2967    ,   2964    }, -- skulkers_
        },
        ["PLD"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   12  ,   3223    ,   3228    ,   3224    ,   3229    ,   {empTradeMaterial[12], 3},  2963    ,   2962    }, -- chevaliers_
            [   2   ] = {   empTrade[   7   ]   +   12  ,   3215    ,   3229    ,   3218    ,   3217    ,   {empTradeMaterial[12], 3},  2963    ,   2967    }, -- chevaliers_
            [   3   ] = {   empTrade[   8   ]   +   12  ,   3212    ,   3212    ,   3225    ,   3229    ,   {empTradeMaterial[12], 3},  2966    ,   2962    }, -- chevaliers_
            [   4   ] = {   empTrade[   9   ]   +   12  ,   3215    ,   3214    ,   3211    ,   3211    ,   {empTradeMaterial[12], 3},  2962    ,   2963    }, -- chevaliers_
            [   5   ] = {   empTrade[   10  ]   +   12  ,   3218    ,   3222    ,   3214    ,   3225    ,   {empTradeMaterial[12], 3},  2964    ,   2966    }, -- chevaliers_
        },
        ["DRK"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   14  ,   3214    ,   3222    ,   3218    ,   3210    ,   {empTradeMaterial[12], 3},  2962    ,   2966    }, -- heathens_
            [   2   ] = {   empTrade[   7   ]   +   14  ,   3227    ,   3222    ,   3218    ,   3217    ,   {empTradeMaterial[12], 3},  2964    ,   2964    }, -- heathens_
            [   3   ] = {   empTrade[   8   ]   +   14  ,   3221    ,   3224    ,   3219    ,   3225    ,   {empTradeMaterial[12], 3},  2962    ,   2967    }, -- heathens_
            [   4   ] = {   empTrade[   9   ]   +   14  ,   3211    ,   3216    ,   3229    ,   3214    ,   {empTradeMaterial[12], 3},  2967    ,   2967    }, -- heathens_
            [   5   ] = {   empTrade[   10  ]   +   14  ,   3217    ,   3211    ,   3224    ,   3223    ,   {empTradeMaterial[12], 3},  2963    ,   2962    }, -- heathens_
        },
        ["BST"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   16  ,   3222    ,   3222    ,   3219    ,   3222    ,   {empTradeMaterial[12], 3},  2963    ,   2965    }, -- nukumi_
            [   2   ] = {   empTrade[   7   ]   +   16  ,   3212    ,   3217    ,   3210    ,   3215    ,   {empTradeMaterial[12], 3},  2964    ,   2964    }, -- nukumi_
            [   3   ] = {   empTrade[   8   ]   +   16  ,   3211    ,   3211    ,   3227    ,   3212    ,   {empTradeMaterial[12], 3},  2967    ,   2963    }, -- nukumi_
            [   4   ] = {   empTrade[   9   ]   +   16  ,   3216    ,   3210    ,   3229    ,   3210    ,   {empTradeMaterial[12], 3},  2966    ,   2965    }, -- nukumi_
            [   5   ] = {   empTrade[   10  ]   +   16  ,   3225    ,   3224    ,   3214    ,   3215    ,   {empTradeMaterial[12], 3},  2966    ,   2967    }, -- nukumi_
        },
        ["BRD"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   18  ,   3210    ,   3215    ,   3222    ,   3218    ,   {empTradeMaterial[12], 3},  2962    ,   2966    }, -- fili_
            [   2   ] = {   empTrade[   7   ]   +   18  ,   3218    ,   3213    ,   3228    ,   3220    ,   {empTradeMaterial[12], 3},  2965    ,   2965    }, -- fili_
            [   3   ] = {   empTrade[   8   ]   +   18  ,   3218    ,   3223    ,   3224    ,   3215    ,   {empTradeMaterial[12], 3},  2967    ,   2967    }, -- fili_
            [   4   ] = {   empTrade[   9   ]   +   18  ,   3224    ,   3220    ,   3229    ,   3215    ,   {empTradeMaterial[12], 3},  2966    ,   2965    }, -- fili_
            [   5   ] = {   empTrade[   10  ]   +   18  ,   3225    ,   3215    ,   3226    ,   3219    ,   {empTradeMaterial[12], 3},  2962    ,   2964    }, -- fili_
        },
        ["RNG"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   20  ,   3225    ,   3225    ,   3224    ,   3218    ,   {empTradeMaterial[12], 3},  2966    ,   2966    }, -- amini_
            [   2   ] = {   empTrade[   7   ]   +   20  ,   3226    ,   3214    ,   3213    ,   3216    ,   {empTradeMaterial[12], 3},  2967    ,   2966    }, -- amini_
            [   3   ] = {   empTrade[   8   ]   +   20  ,   3221    ,   3216    ,   3218    ,   3220    ,   {empTradeMaterial[12], 3},  2964    ,   2966    }, -- amini_
            [   4   ] = {   empTrade[   9   ]   +   20  ,   3225    ,   3214    ,   3211    ,   3215    ,   {empTradeMaterial[12], 3},  2965    ,   2966    }, -- amini_
            [   5   ] = {   empTrade[   10  ]   +   20  ,   3225    ,   3225    ,   3214    ,   3214    ,   {empTradeMaterial[12], 3},  2964    ,   2965    }, -- amini_
        },
        ["SAM"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   22  ,   3221    ,   3212    ,   3228    ,   3216    ,   {empTradeMaterial[12], 3},  2967    ,   2964    }, -- kasuga_
            [   2   ] = {   empTrade[   7   ]   +   22  ,   3212    ,   3221    ,   3219    ,   3213    ,   {empTradeMaterial[12], 3},  2963    ,   2967    }, -- kasuga_
            [   3   ] = {   empTrade[   8   ]   +   22  ,   3213    ,   3226    ,   3229    ,   3222    ,   {empTradeMaterial[12], 3},  2962    ,   2964    }, -- kasuga_
            [   4   ] = {   empTrade[   9   ]   +   22  ,   3215    ,   3225    ,   3229    ,   3214    ,   {empTradeMaterial[12], 3},  2966    ,   2965    }, -- kasuga_
            [   5   ] = {   empTrade[   10  ]   +   22  ,   3223    ,   3221    ,   3223    ,   3220    ,   {empTradeMaterial[12], 3},  2963    ,   2966    }, -- kasuga_
        },
        ["NIN"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   24  ,   3226    ,   3226    ,   3222    ,   3227    ,   {empTradeMaterial[12], 3},  2964    ,   2962    }, -- hattori_
            [   2   ] = {   empTrade[   7   ]   +   24  ,   3223    ,   3226    ,   3215    ,   3211    ,   {empTradeMaterial[12], 3},  2966    ,   2967    }, -- hattori_
            [   3   ] = {   empTrade[   8   ]   +   24  ,   3229    ,   3226    ,   3219    ,   3218    ,   {empTradeMaterial[12], 3},  2967    ,   2965    }, -- hattori_
            [   4   ] = {   empTrade[   9   ]   +   24  ,   3211    ,   3217    ,   3210    ,   3214    ,   {empTradeMaterial[12], 3},  2963    ,   2963    }, -- hattori_
            [   5   ] = {   empTrade[   10  ]   +   24  ,   3216    ,   3229    ,   3226    ,   3227    ,   {empTradeMaterial[12], 3},  2962    ,   2963    }, -- hattori_
        },
        ["DRG"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   26  ,   3228    ,   3212    ,   3216    ,   3221    ,   {empTradeMaterial[12], 3},  2965    ,   2964    }, -- peltasts_
            [   2   ] = {   empTrade[   7   ]   +   26  ,   3212    ,   3220    ,   3227    ,   3221    ,   {empTradeMaterial[12], 3},  2963    ,   2962    }, -- peltasts_
            [   3   ] = {   empTrade[   8   ]   +   26  ,   3222    ,   3229    ,   3218    ,   3214    ,   {empTradeMaterial[12], 3},  2966    ,   2966    }, -- peltasts_
            [   4   ] = {   empTrade[   9   ]   +   26  ,   3211    ,   3214    ,   3213    ,   3213    ,   {empTradeMaterial[12], 3},  2964    ,   2967    }, -- peltasts_
            [   5   ] = {   empTrade[   10  ]   +   26  ,   3224    ,   3217    ,   3223    ,   3224    ,   {empTradeMaterial[12], 3},  2962    ,   2967    }, -- peltasts_
        },
        ["SMN"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   28  ,   3224    ,   3229    ,   3218    ,   3227    ,   {empTradeMaterial[12], 3},  2966    ,   2962    }, -- beckoners_
            [   2   ] = {   empTrade[   7   ]   +   28  ,   3218    ,   3224    ,   3215    ,   3212    ,   {empTradeMaterial[12], 3},  2964    ,   2966    }, -- beckoners_
            [   3   ] = {   empTrade[   8   ]   +   28  ,   3221    ,   3225    ,   3217    ,   3216    ,   {empTradeMaterial[12], 3},  2964    ,   2965    }, -- beckoners_
            [   4   ] = {   empTrade[   9   ]   +   28  ,   3216    ,   3223    ,   3211    ,   3226    ,   {empTradeMaterial[12], 3},  2966    ,   2963    }, -- beckoners_
            [   5   ] = {   empTrade[   10  ]   +   28  ,   3220    ,   3225    ,   3224    ,   3219    ,   {empTradeMaterial[12], 3},  2967    ,   2966    }, -- beckoners_
        },
        ["BLU"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   30  ,   3211    ,   3229    ,   3213    ,   3224    ,   {empTradeMaterial[12], 3},  2966    ,   2964    }, -- hashishin_
            [   2   ] = {   empTrade[   7   ]   +   30  ,   3220    ,   3228    ,   3223    ,   3224    ,   {empTradeMaterial[12], 3},  2963    ,   2962    }, -- hashishin_
            [   3   ] = {   empTrade[   8   ]   +   30  ,   3221    ,   3229    ,   3224    ,   3212    ,   {empTradeMaterial[12], 3},  2967    ,   2966    }, -- hashishin_
            [   4   ] = {   empTrade[   9   ]   +   30  ,   3214    ,   3212    ,   3229    ,   3226    ,   {empTradeMaterial[12], 3},  2965    ,   2966    }, -- hashishin_
            [   5   ] = {   empTrade[   10  ]   +   30  ,   3217    ,   3210    ,   3224    ,   3217    ,   {empTradeMaterial[12], 3},  2963    ,   2963    }, -- hashishin_
        },
        ["COR"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   32  ,   3211    ,   3224    ,   3212    ,   3214    ,   {empTradeMaterial[12], 3},  2964    ,   2962    }, -- chasseurs_
            [   2   ] = {   empTrade[   7   ]   +   32  ,   3224    ,   3229    ,   3217    ,   3218    ,   {empTradeMaterial[12], 3},  2963    ,   2965    }, -- chasseurs_
            [   3   ] = {   empTrade[   8   ]   +   32  ,   3221    ,   3215    ,   3212    ,   3222    ,   {empTradeMaterial[12], 3},  2965    ,   2964    }, -- chasseurs_
            [   4   ] = {   empTrade[   9   ]   +   32  ,   3215    ,   3229    ,   3212    ,   3218    ,   {empTradeMaterial[12], 3},  2967    ,   2964    }, -- chasseurs_
            [   5   ] = {   empTrade[   10  ]   +   32  ,   3227    ,   3219    ,   3224    ,   3223    ,   {empTradeMaterial[12], 3},  2966    ,   2967    }, -- chasseurs_
        },
        ["PUP"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   34  ,   3219    ,   3229    ,   3218    ,   3227    ,   {empTradeMaterial[12], 3},  2963    ,   2967    }, -- karagoz_
            [   2   ] = {   empTrade[   7   ]   +   34  ,   3221    ,   3215    ,   3228    ,   3210    ,   {empTradeMaterial[12], 3},  2963    ,   2966    }, -- karagoz_
            [   3   ] = {   empTrade[   8   ]   +   34  ,   3215    ,   3217    ,   3222    ,   3213    ,   {empTradeMaterial[12], 3},  2963    ,   2965    }, -- karagoz_
            [   4   ] = {   empTrade[   9   ]   +   34  ,   3215    ,   3227    ,   3226    ,   3220    ,   {empTradeMaterial[12], 3},  2967    ,   2967    }, -- karagoz_
            [   5   ] = {   empTrade[   10  ]   +   34  ,   3225    ,   3211    ,   3211    ,   3213    ,   {empTradeMaterial[12], 3},  2965    ,   2962    }, -- karagoz_
        },
        ["DNC"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   36  ,   3219    ,   3211    ,   3227    ,   3220    ,   {empTradeMaterial[12], 3},  2965    ,   2963    }, -- maculele_
            [   2   ] = {   empTrade[   7   ]   +   36  ,   3228    ,   3221    ,   3216    ,   3222    ,   {empTradeMaterial[12], 3},  2964    ,   2963    }, -- maculele_
            [   3   ] = {   empTrade[   8   ]   +   36  ,   3216    ,   3224    ,   3219    ,   3218    ,   {empTradeMaterial[12], 3},  2962    ,   2967    }, -- maculele_
            [   4   ] = {   empTrade[   9   ]   +   36  ,   3225    ,   3211    ,   3216    ,   3224    ,   {empTradeMaterial[12], 3},  2964    ,   2962    }, -- maculele_
            [   5   ] = {   empTrade[   10  ]   +   36  ,   3213    ,   3221    ,   3222    ,   3223    ,   {empTradeMaterial[12], 3},  2967    ,   2964    }, -- maculele_
        },
        ["SCH"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   38  ,   3229    ,   3223    ,   3222    ,   3220    ,   {empTradeMaterial[12], 3},  2966    ,   2963    }, -- arbatel_
            [   2   ] = {   empTrade[   7   ]   +   38  ,   3227    ,   3221    ,   3225    ,   3220    ,   {empTradeMaterial[12], 3},  2965    ,   2967    }, -- arbatel_
            [   3   ] = {   empTrade[   8   ]   +   38  ,   3220    ,   3219    ,   3217    ,   3226    ,   {empTradeMaterial[12], 3},  2962    ,   2965    }, -- arbatel_
            [   4   ] = {   empTrade[   9   ]   +   38  ,   3220    ,   3213    ,   3216    ,   3219    ,   {empTradeMaterial[12], 3},  2963    ,   2966    }, -- arbatel_
            [   5   ] = {   empTrade[   10  ]   +   38  ,   3215    ,   3227    ,   3211    ,   3228    ,   {empTradeMaterial[12], 3},  2962    ,   2964    }, -- arbatel_
        },
        ["GEO"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   40  ,   3222    ,   3218    ,   3211    ,   3215    ,   {empTradeMaterial[12], 3},  2962    ,   2964    }, -- azimuth_
            [   2   ] = {   empTrade[   7   ]   +   40  ,   3227    ,   3222    ,   3218    ,   3217    ,   {empTradeMaterial[12], 3},  2965    ,   2967    }, -- azimuth_
            [   3   ] = {   empTrade[   8   ]   +   40  ,   3212    ,   3222    ,   3216    ,   3210    ,   {empTradeMaterial[12], 3},  2965    ,   2964    }, -- azimuth_
            [   4   ] = {   empTrade[   9   ]   +   40  ,   3216    ,   3212    ,   3218    ,   3227    ,   {empTradeMaterial[12], 3},  2963    ,   2965    }, -- azimuth_
            [   5   ] = {   empTrade[   10  ]   +   40  ,   3213    ,   3218    ,   3214    ,   3228    ,   {empTradeMaterial[12], 3},  2962    ,   2966    }, -- azimuth_
        },
        ["RUN"] =
        {
            [   1   ] = {   empTrade[   6   ]   +   42  ,   3218    ,   3228    ,   3214    ,   3217    ,   {empTradeMaterial[12], 3},  2962    ,   2967    }, -- erilaz_
            [   2   ] = {   empTrade[   7   ]   +   42  ,   3213    ,   3216    ,   3223    ,   3226    ,   {empTradeMaterial[12], 3},  2967    ,   2966    }, -- erilaz_
            [   3   ] = {   empTrade[   8   ]   +   42  ,   3212    ,   3214    ,   3218    ,   3222    ,   {empTradeMaterial[12], 3},  2966    ,   2962    }, -- erilaz_
            [   4   ] = {   empTrade[   9   ]   +   42  ,   3219    ,   3217    ,   3217    ,   3225    ,   {empTradeMaterial[12], 3},  2963    ,   2967    }, -- erilaz_
            [   5   ] = {   empTrade[   10  ]   +   42  ,   3228    ,   3214    ,   3224    ,   3222    ,   {empTradeMaterial[12], 3},  2963    ,   2966    }, -- erilaz_
        },
    }

    -- printf("testemphq1.lua onTrigger  JOB: [%s]  SLOT: [%i]", job, slot)
    -- printf("testemphq1.lua onTrigger  R1: [%i]  R2: [%i]  R3: [%i]  R4: [%i]  R5: [%i]  R6: [%i]  R7: [%i]  R8: [%i]", empHQ1Recipe[job][slot][1], empHQ1Recipe[job][slot][2], empHQ1Recipe[job][slot][3], empHQ1Recipe[job][slot][4], empHQ1Recipe[job][slot][5], empHQ1Recipe[job][slot][6][1], empHQ1Recipe[job][slot][7], empHQ1Recipe[job][slot][8])

    -- Attempt to give the target the items
    if player:getFreeSlotsCount() < 8 then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "'%s' does not have enough free space for that set! Please clear 8 inventory slots and try again.", player ) )
    else
        for i = 1, 8 do
            if i ~= 6 then
                player:addItem(empHQ1Recipe[job][slot][i], 1)
                player:messageSpecial(ID.text.ITEM_OBTAINED, empHQ1Recipe[job][slot][i])
            else
                player:addItem(empHQ1Recipe[job][slot][i][1], empHQ1Recipe[job][slot][i][2])
                player:messageSpecial(ID.text.ITEM_OBTAINED, empHQ1Recipe[job][slot][i][1])
            end
        end
    end
end
