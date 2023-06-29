-----------------------------------
-- Global version of onMobDeath
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/zone")
require("scripts/globals/msg")
require("scripts/globals/magiantrials")
require("scripts/globals/npc_util")
require("scripts/globals/roe")
-----------------------------------

tpz = tpz or {}
tpz.mob = tpz.mob or {}

tpz.mob.mobFamily =
{
    ACROLITH                    = 1,
    ADAMANTOISE                 = 2,
    AERN                        = 3,
    AHRIMAN                     = 4,
    AMOEBAN                     = 5,
    AMPHIPTERE                  = 6,
    ANIMATEDWEAPON_ARCHERY      = 7,
    ANIMATEDWEAPON_AXE          = 8,
    ANIMATEDWEAPON_CLUB         = 9,
    ANIMATEDWEAPON_DAGGER       = 11,
    ANIMATEDWEAPON_GREATAXE     = 12,
    ANIMATEDWEAPON_GREATKATANA  = 13,
    ANIMATEDWEAPON_GREATSWORD   = 14,
    ANIMATEDWEAPON_HANDTOHAND   = 15,
    ANIMATEDWEAPON_INSTRUMENT   = 16,
    ANIMATEDWEAPON_KATANA       = 17,
    ANIMATEDWEAPON_MARKSMANSHIP = 18,
    ANIMATEDWEAPON_POLEARM      = 19,
    ANIMATEDWEAPON_SCYTHE       = 20,
    ANIMATEDWEAPON_SHIELD       = 21,
    ANIMATEDWEAPON_STAFF        = 23,
    ANIMATEDWEAPON_SWORD        = 24,
    ANTICA                      = 25,
    ANTLION                     = 26,
    APKALLU                     = 27,
    AUTOMATON_HARLEQUIN         = 28,
    AUTOMATON_SHARPSHOT         = 29,
    AUTOMATON_STORMWAKER        = 30,
    AUTOMATON_VALOREDGE         = 31,
    AVATAR_ATOMOS               = 32,
    AVATAR_ALEXANDER            = 33,
    AVATAR_CARBUNCLE            = 34,
    AVATAR_DIABOLOS             = 35,
    AVATAR_FENRIR               = 36,
    AVATAR_GARUDA               = 37,
    AVATAR_IFRIT                = 38,
    AVATAR_IXION                = 39,
    AVATAR_LEVIATHAN            = 40,
    AVATAR_ODIN                 = 41,
    AVATAR_ODIN                 = 42,
    AVATAR_RAMUH                = 43,
    AVATAR_SHIVA                = 44,
    AVATAR_TITAN                = 45,
    BAT                         = 46,
    BATS                        = 47,
    BEE                         = 48,
    BEETLE                      = 49,
    BEHEMOTH                    = 51,
    BHOOT                       = 52,
    GRIMOIRE                    = 53,
    BIOTECHNOLOGICAL            = 54,
    BIRD                        = 55,
    BOMB                        = 56,
    BUFFALO                     = 57,
    BUGARD                      = 58,
    BUGBEAR                     = 59,
    CAIT_SITH                   = 60,
    CARDIAN                     = 61,
    CERBERUS                    = 62,
    CHARIOT                     = 63,
    CHIGOE                      = 64,
    CLIONID                     = 65,
    CLOT                        = 66,
    GLUTINOUS_CLOT              = 67,
    CLUSTER_1                   = 68,
    CLUSTER_2                   = 69,
    COCKATRICE                  = 70,
    COEURL                      = 71,
    COLIBRI                     = 72,
    CORPSELIGHTS                = 73,
    CORSE                       = 74,
    CRAB_1                      = 75,
    CRAB_2                      = 76,
    CRAB_3                      = 77,
    CRAVER                      = 78,
    CRAWLER                     = 79,
    DHALMEL                     = 80,
    DIREMITE                    = 81,
    DJINN                       = 82,
    DOLL_1                      = 83,
    DOLL_2                      = 84,
    DOLL_3                      = 85,
    DOOMED                      = 86,
    DRAGON                      = 87,
    DRAUGAR_1                   = 88,
    DRAUGAR_2                   = 89,
    DVERGR                      = 90,
    DVERGR_SKULL                = 91,
    DYNAMISSTATUE_GOBLIN        = 92,
    DYNAMISSTATUE_ORC           = 93,
    DYNAMISSTATUE_QUADAV        = 94,
    DYNAMISSTATUE_YAGUDO        = 95,
    ICE_LIZARD                  = 97,
    EFT                         = 98,
    ELEMENTAL_AIR               = 99,
    ELEMENTAL_DARK              = 100,
    ELEMENTAL_EARTH             = 101,
    ELEMENTAL_FIRE              = 102,
    ELEMENTAL_ICE               = 103,
    ELEMENTAL_LIGHT             = 104,
    ELEMENTAL_LIGHTNING         = 105,
    ELEMENTAL_WATER             = 106,
    ERUCA_1                     = 107,
    ERUCA_2                     = 108,
    EUVHI                       = 109,
    EVIL_WEAPON                 = 110,
    FLAN                        = 112,
    FLY                         = 113,
    FLYTRAP                     = 114,
    FOMOR                       = 115,
    FUNGUAR                     = 116,
    GARGOUILLE                  = 117,
    GARGOYLE                    = 118,
    GEAR                        = 119,
    GEARS                       = 120,
    GHOST                       = 121,
    GHRAH_1                     = 122,
    GHRAH_2                     = 123,
    GHRAH_3                     = 124,
    GIANT_BIRD                  = 125,
    GIGAS_1                     = 126,
    GIGAS_2                     = 127,
    GIGAS_3                     = 128,
    GIGAS_4                     = 129,
    GIGAS_5                     = 130,
    GNAT                        = 131,
    GNOLE                       = 132,
    GOBLIN                      = 133,
    GOD                         = 134,
    GOLEM                       = 135,
    GOOBBUE                     = 136,
    GORGER_1                    = 137,
    GORGER_2                    = 138,
    HECTEYES                    = 139,
    HIPPOGRYPH_1                = 140,
    HIPPOGRYPH_2                = 141,
    HOUND_1                     = 142,
    HOUND_2                     = 143,
    HPEMDE                      = 144,
    HUMANOID_ELVAAN             = 145,
    HUMANOID_GALKA              = 146,
    HUMANOID_GALKA              = 147,
    HUMANOID_GALKA              = 148,
    HUMANOID_HUME               = 149,
    HUMANOID_HUME               = 150,
    HUMANOID_MITHRA             = 151,
    HUMANOID_MITHRA             = 152,
    HUMANOID_TARUTARU           = 153,
    HUMANOID_TARUTARU           = 154,
    HYBRIDELEMENTAL_AIR         = 155,
    HYBRIDELEMENTAL_DARK        = 156,
    HYBRIDELEMENTAL_EARTH       = 157,
    HYBRIDELEMENTAL_FIRE        = 158,
    HYBRIDELEMENTAL_ICE         = 159,
    HYBRIDELEMENTAL_LIGHT       = 160,
    HYBRIDELEMENTAL_LIGHTNING   = 161,
    HYBRIDELEMENTAL_WATER       = 162,
    HYDRA_1                     = 163,
    HYDRA_2                     = 164,
    IMP_1                       = 165,
    IMP_2                       = 166,
    KARAKUL                     = 167,
    KHIMAIRA                    = 168,
    KINDRED                     = 169,
    LADYBUG                     = 170,
    LAMIAE                      = 171,
    LEECH                       = 172,
    LIMULE                      = 173,
    LIZARD                      = 174,
    MAGICPOT                    = 175,
    MAMOOL_JA                   = 176,
    MAMOOL_JA_KNIGHT            = 177,
    MANDRAGORA                  = 178,
    MANTICORE                   = 179,
    MARID                       = 180,
    MEMORY_RECEPTACLE           = 181,
    MERROW                      = 182,
    MIMIC                       = 183,
    MOBLIN                      = 184,
    MOOGLE                      = 185,
    MORBOL                      = 186,
    MUREX                       = 187,
    OPO_OPO                     = 188,
    ORC                         = 189,
    ORCISH_WARMACHINE           = 190,
    OROBON                      = 191,
    PEISTE                      = 192,
    PETWYVERN                   = 193,
    PHUABO                      = 194,
    PIXIE                       = 195,
    POROGGO                     = 196,
    PUGIL                       = 197,
    PUK                         = 198,
    QIQIRN                      = 199,
    QUADAV_1                    = 200,
    QUADAV_2                    = 201,
    QUADAV_3                    = 202,
    QUTRUB_1                    = 203,
    QUTRUB_2                    = 204,
    QUTRUB_3                    = 205,
    RABBIT                      = 206,
    RAFFLESIA                   = 207,
    RAM                         = 208,
    RAMPART                     = 209,
    RAPTOR                      = 210,
    RUSZOR                      = 211,
    SABOTENDER                  = 212,
    SAHAGIN                     = 213,
    SANDWORM_1                  = 214,
    SANDWORM_1                  = 215,
    SAPLING                     = 216,
    SCORPION                    = 217,
    SEAMONK_1                   = 218,
    SEAMONK_2                   = 219,
    SEETHER                     = 220,
    SHADOW_1                    = 221,
    SHADOW_2                    = 222,
    SHADOW_3                    = 223,
    SHADOWLORD_1                = 224,
    SHADOWLORD_2                = 225,
    SHEEP                       = 226,
    SKELETON                    = 227,
    SLIME_1                     = 228,
    SLIME_2                     = 229,
    SLIME_3                     = 230,
    SLUG                        = 231,
    SNOLL                       = 232,
    SOULFLAYER                  = 233,
    SPHEROID                    = 234,
    SPIDER                      = 235,
    STRUCTURE_1                 = 236,
    STRUCTURE_2                 = 237,
    STRUCTURE_3                 = 238,
    STRUCTURE_4                 = 239,
    TAURI                       = 240,
    THINKER                     = 241,
    TIGER                       = 242,
    TONBERRY_1                  = 243,
    TONBERRY_2                  = 244,
    TREANT                      = 245,
    TROLL                       = 246,
    TUBES                       = 247,
    TURRET_ORC                  = 248,
    TURRET_QUADAV               = 249,
    TURRET_YAGUDO               = 250,
    URAGNITE                    = 251,
    VAMPYR                      = 252,
    WAMOURA                     = 253,
    WAMOURACAMPA                = 254,
    WANDERER                    = 255,
    WEEPER                      = 256,
    WIVRE                       = 257,
    WORM                        = 258,
    OURYU_WYRM                  = 259,
    FAFNIR_WYRM                 = 260,
    CYNOPROSOPI_WYRM            = 261,
    WYRM_1                      = 262,
    NIDHOGG_WYRM                = 263,
    WYRM_2                      = 264,
    SIMORG_WYVERN               = 265,
    WYVERN                      = 266,
    GUIVRE_WYVERN               = 267,
    WYVERN_UNDEAD               = 268,
    XZOMIT                      = 269,
    YAGUDO                      = 270,
    YOVRA                       = 271,
    ZDEI                        = 272,
    KINGV                       = 274,
    SERKET                      = 273,
    MINIADAMANTOISE             = 275,
    BIGWORM                     = 276,
    GENBU                       = 277,
    SEIRYU                      = 278,
    BYAKKO                      = 279,
    SUZAKU                      = 280,
    KIRIN                       = 281,
    GRAVITON                    = 282,
    VAMPYR                      = 284,
    MAMOOLJA                    = 285,
    VULPANGUE                   = 286,
    CHAMROSH                    = 287,
    CHEESE_HOARDER              = 288,
    BRASS_BORER                 = 289,
    CLARET                      = 290,
    OB                          = 291,
    VELIONIS                    = 292,
    CHIGRE                      = 293,
    LIL_APKALLU                 = 294,
    IRIZ_IMA                    = 295,
    LIVIDROOT_AMOO              = 296,
    IRIRI_SAMARIRI              = 297,
    ANANTABOGA                  = 298,
    DEXTROSE                    = 299,
    REACTON                     = 300,
    VERDELET                    = 301,
    WULGARU                     = 302,
    ZAREEHKL_THE_JUBILANT       = 303,
    ARMED_GEARS                 = 304,
    GOTOH_ZHA_THE_REDOLENT      = 305,
    DEA                         = 306,
    ACHAMOTH                    = 307,
    KHROMASOUL                  = 308,
    NOSFERATU                   = 309,
    EXPERIMENTAL_LAMIA          = 310,
    MAHJLAEF_THE_PAINTORN       = 311,
    NUHN                        = 312,
    TINNIN                      = 313,
    SARAMEYA                    = 314,
    TYGER                       = 315,
    PANDEMONIUM                 = 316,
    AVATAR_SHIVA                = 319,
    AVATAR_RAMUH                = 320,
    AVATAR_TITAN                = 321,
    AVATAR_IFRIT                = 322,
    AVATAR_LEVIATHAN            = 323,
    AVATAR_GARUDA               = 324,
    AVATAR_FENRIR               = 325,
    TROLL_GURFURLUR             = 326,
    GOBLIN                      = 327,
    GIGAS                       = 328,
    ABSOLUTEVIRTUE              = 329,
    PET_GENBU                   = 330,
    PET_SEIRYU                  = 331,
    PET_BYAKKO                  = 332,
    PET_SUZAKU                  = 333,
    ORC_NM                      = 334,
    MAAT                        = 335,
    ZM4_TONBERRY                = 336,
    QUADAV_NM                   = 337,
    TWITHERYM                   = 338,
    CHAPULI                     = 339,
    MANTIS                      = 340,
    BLOSSOM                     = 341,
    VELKK                       = 342,
    HEARTWING                   = 343,
    CRACKLAW                    = 344,
    BLOATED_ACUEX               = 345,
    KNOTTED_ROOT                = 346,
    MAROLITH                    = 347,
    MATAMATA                    = 348,
    GEYSER                      = 349,
    IRON_GIANT                  = 350,
    KAM_LANAUT                  = 351,
    ARKANGEL_EV                 = 352,
    ARKANGEL_GK                 = 353,
    ARKANGEL_HM                 = 354,
    ARKANGEL_MR                 = 355,
    ARKANGEL_TT                 = 356,
    AMBUSH_ANTLION              = 357,
    KINDRED                     = 358,
    FOMOR                       = 359,
    YAGUDONM                    = 360,
    DYNAMIS_LORD                = 361,
    SABOTENDER_FLORIDO          = 362,
    AUTOMATON_HARLEQUIN         = 363,
    AUTOMATON_VALOREDGE         = 364,
    AUTOMATON_SHARPSHOT         = 365,
    AUTOMATON_STORMWAKER        = 366,
    FAUST                       = 367,
    DESPOT                      = 368,
    LEECH                       = 369,
    MARID                       = 371,
    CRAB                        = 372,
    GOBLIN_ARMORED              = 373,
    FLY                         = 374,
    FLY_DARK                    = 375,
    RAPTOR                      = 376,
    RAPTOR                      = 377,
    AVATAR_DIABOLOS             = 378,
    PET_CARBUNCLE               = 379,
    PET_DIABOLOS                = 380,
    PET_FENRIR                  = 381,
    PET_GARUDA                  = 382,
    PET_IFRIT                   = 383,
    PET_LEVIATHAN               = 384,
    PET_ODIN                    = 385,
    PET_RAMUH                   = 386,
    PET_SHIVA                   = 387,
    PET_TITAN                   = 388,
    PET_ALEXANDER               = 389,
    LADYBUG                     = 390,
    VRTRA_WYRM                  = 391,
    JORMUNGAND_WYRM             = 392,
    TIAMAT_WYRM                 = 393,
    HUMANOID_HUME               = 394,
    CALCABRINA                  = 395,
    BEDROCK_BARRY               = 396,
    QU_VHO_DEATHHURLER          = 397,
    SLUMBERING_SAMWELL          = 398,
    DUKE_FOCALOR                = 399,
    TEGMINE                     = 400,
    MARTINET                    = 401,
    AQRABUAMELU                 = 402,
    AUTARCH                     = 403,
    CURE_RABBIT                 = 404,
    SEED_MANDRAGORA             = 406,
    SEED_ORC                    = 407,
    SEED_QUADAV                 = 408,
    SEED_YAGUDO                 = 409,
    SEED_GOBLIN                 = 410,
    GIANT_GNAT                  = 435,
    BLOODLAPPER                 = 436,
    GHILLIE_DHU                 = 437,
    HIGHLANDER_LIZARD           = 438,
    LARZOS                      = 444,
    PORTIA                      = 445,
    RAGELISE                    = 446,
    DULLAHAN                    = 447,
    FLUTURINI                   = 448,
    BAHAMUT                     = 449,
    CATURAE                     = 450,
    PTERAKETOS                  = 451,
    ROCKFIN                     = 452,
    BELLADONA                   = 453,
    TULFAIRE                    = 454,
    LEAFKIN                     = 455,
    COLKHAB                     = 456,
    KUMHAU                      = 457,
    RAAZ                        = 458,
    YZTARG                      = 459,
    HURKAN                      = 460,
    ACHUKA                      = 461,
    PROVENANCE_WATCHER          = 462,
    PANOPT                      = 463,
    SNAPWEED                    = 464,
    YUMCAX                      = 465,
    GALLU                       = 467,
    UMBRIL                      = 468,
    MEDUSA                      = 469,
    YILBEGAN                    = 470,
    HARPEIA                     = 471,
    NARAKA                      = 472,
    LADY_LILITH                 = 473,
    LILITH_ASCENDANT            = 474,
    SHINRYU                     = 475,
    PRISHE                      = 476,
    SELHTEUS                    = 477,
    GOD                         = 478,
    KING_BEHEMOTH               = 479,
    ZEID                        = 480,
    AJIDO_MARUJIDO              = 481,
    VOLKER                      = 482,
    TRION                       = 483,
    LILISETTE                   = 484,
    HADES_V1                    = 485,
    ARCIELA                     = 486,
    HADES_V2                    = 487,
    THEODOR                     = 488,
    DARRCUILN                   = 489,
    DHOKMAK                     = 490,
    MORIMAR                     = 491,
    BALAMOR                     = 492,
    ASHRAKK                     = 493,
    SEKHMET                     = 494,
    ASTRAL_FLOW_PET             = 495,
    CHANEQUE_MANDRAGORA         = 496,
    CLOUD_OF_DARKNESS           = 497,
    DOLL                        = 498,
    STRAY                       = 499,
    MOKKURKALFI                 = 500,
    NIOA_NIOHUM                 = 501,
    SHIKIGAMI_WEAPON            = 502,
    MAMMET                      = 503,
    LUOPAN                      = 504,
    PET_SIREN                   = 506,
    PET_CAITSITH                = 505,
    CRAVER_VW                   = 507,
    PET_PORTERCRABFAMILIAR      = 567,
    PET_JOVIALEDWIN             = 568,
    PET_YELLOWBEETLEFAMILIAR    = 569,
    PET_ENERGIZEDSEFINA         = 570,
    PET_LYNXFAMILIAR            = 571,
    PET_VIVACIOUSGASTON         = 572,
    PET_HIPPOGRYPHFAMILIAR      = 573,
    PET_DARINGROLAND            = 574,
    PET_SLIMEFAMILIAR           = 575,
    PET_SULTRYPATRICE           = 576,
}

local familyKillCounter =
{
    [206] = {"KC_Fam_Rabbits"},
}

-- onMobDeathEx is called from the core
function onMobDeathEx(mob, player, isKiller, isWeaponSkillKill)
    -- Things that happen only to the person who landed killing blow
    if isKiller then
        -- DRK quest - Blade Of Darkness
        if
            (player:getQuestStatus(BASTOK, tpz.quest.id.bastok.BLADE_OF_DARKNESS) == QUEST_ACCEPTED or player:getQuestStatus(BASTOK, tpz.quest.id.bastok.BLADE_OF_DEATH) == QUEST_ACCEPTED) and
            player:getEquipID(tpz.slot.MAIN) == 16607 and
            player:getCharVar("ChaosbringerKills") < 200 and
            not isWeaponSkillKill
        then
            player:addCharVar("ChaosbringerKills", 1)
        end
    end

    -- Things that happen to any player in the party/alliance
    if player:getCurrentMission(WINDURST) == tpz.mission.id.windurst.A_TESTING_TIME then
        if
            (player:getZoneID() == tpz.zone.BUBURIMU_PENINSULA and player:hasCompletedMission(WINDURST, tpz.mission.id.windurst.A_TESTING_TIME)) or
            (player:getZoneID() == tpz.zone.TAHRONGI_CANYON and not player:hasCompletedMission(WINDURST, tpz.mission.id.windurst.A_TESTING_TIME))
        then
            player:addCharVar("testingTime_crea_count", 1)
        end
    end

    -- Caldera Custom Kill Counter based on Mob Family
    local mobFamily = mob:getFamily()

    player:setCharVar("KC_Fam_"..mobFamily, player:getCharVar("KC_Fam_"..mobFamily) + 1)

    -- if mobFamily == tpz.mob.mobFamily.RABBIT then
        -- local famRabbitThreshold = player:getCharVar("KC_Fam_Rabbit_Threshold")
        -- local chance             = math.random(1, 1000)
        -- -- printf("mobs.lua onMobDeathEx  RABBIT REVENGE CHANCE: [%i]", chance)
        -- -- Order a hit on players
        -- if chance < famRabbitThreshold then
            -- local playerName = player:getName()
            -- local channel    = 7
            -- local message    = string.format("The rabbits have ordered a hit on %s!", playerName)

            -- SendServerMsg(playerName, channel, message)

            -- player:timer(5000, function(player)
                -- player:injectActionPacket(4, 241) -- Meteor
				-- player:injectActionPacket(4, 280) -- Meteor II
                -- player:setHP(0)
                -- player:setMP(0)
                -- player:setAnimation(0)
            -- end)

            -- player:timer(15000, function(player)
                -- player:PrintToPlayer(string.format("Rabbit Conclave: The rabbits have taught you a lesson today %s!", playerName), tpz.msg.channel.NS_LINKSHELL3)
                -- player:sendRaise(3)
            -- end)

            -- player:setCharVar("KC_Fam_Rabbit_Threshold", 1)
        -- else
            -- player:setCharVar("KC_Fam_Rabbit_Threshold", player:getCharVar("KC_Fam_Rabbit_Threshold") + 1)
            -- -- printf("mobs.lua onMobDeathEx  RABBIT THRESHOLD: [%i]", player:getCharVar("KC_Fam_Rabbit_Threshold"))
        -- end
    -- end

	-- Universal Kill Counter
	-- TODO: Remove kill counters from previously established NM's
	-- if (mob:isNM()) then
		-- local mobName = mob:getName()
		-- local fixedMobName = string.gsub(mobName, "_", "")
		-- local KillCounter = player:getCharVar("KillCounter_"..fixedMobName)
	
		-- KillCounter = KillCounter + 1
		
		-- player:setCharVar("KillCounter_"..fixedMobName, KillCounter)
	-- else
		
	-- end

    tpz.magian.checkMagianTrial(player, {['mob'] = mob})
end

-------------------------------------------------
-- placeholder / lottery NMs
-------------------------------------------------

-- is a lottery NM already spawned or primed to pop?
local function lotteryPrimed(phList)
    local nm
    for k, v in pairs(phList) do
        nm = GetMobByID(v)
        if nm ~= nil and (nm:isSpawned() or nm:getRespawnTime() ~= 0) then
            return true
        end
    end
    return false
end

-- potential lottery placeholder was killed
tpz.mob.phOnDespawn = function(ph, phList, chance, cooldown, immediate)
    if type(immediate) ~= "boolean" then immediate = false end
    
    if NM_LOTTERY_CHANCE then
        chance = NM_LOTTERY_CHANCE >= 0 and (chance * NM_LOTTERY_CHANCE) or 100
    end
    if NM_LOTTERY_COOLDOWN then
        cooldown = NM_LOTTERY_COOLDOWN >= 0 and (cooldown * NM_LOTTERY_COOLDOWN) or cooldown
    end

    if phList == nil then
        printf("mobs.lua phOnDespawn  PLACEHOLDER ID: [%i]  NAME: [%s]", ph:getID(), ph:getName())
    end

    local phId = ph:getID()
    local nmId = phList[phId]

    if nmId ~= nil then
        local nm = GetMobByID(nmId)
        if nm ~= nil then
            local pop = nm:getLocalVar("pop")
            
            chance = math.ceil(chance * 10) -- chance / 1000.
            if os.time() > pop and not lotteryPrimed(phList) and math.random(1000) <= chance then

                -- on PH death, replace PH repop with NM repop
                DisallowRespawn(phId, true)
                DisallowRespawn(nmId, false)
                UpdateNMSpawnPoint(nmId)
                nm:setRespawnTime(immediate and 1 or GetMobRespawnTime(phId)) -- if immediate is true, spawn the nm immediately (1ms) else use placeholder's timer

                nm:addListener("DESPAWN", "DESPAWN_" .. nmId, function(m)
                    -- on NM death, replace NM repop with PH repop
                    DisallowRespawn(nmId, true)
                    DisallowRespawn(phId, false)
                    GetMobByID(phId):setRespawnTime(GetMobRespawnTime(phId))
                    m:setLocalVar("pop", os.time() + cooldown)
                    m:removeListener("DESPAWN_" .. nmId)
                end)

                return true
            end
        end
    end

    return false
end

-------------------------------------------------
-- mob additional melee effects
-------------------------------------------------

tpz.mob.additionalEffect =
{
    BLIND      = 0,
    CURSE      = 1,
    ENAERO     = 2,
    ENBLIZZARD = 3,
    ENDARK     = 4,
    ENFIRE     = 5,
    ENLIGHT    = 6,
    ENSTONE    = 7,
    ENTHUNDER  = 8,
    ENWATER    = 9,
    EVA_DOWN   = 10,
    HP_DRAIN   = 11,
    MP_DRAIN   = 12,
    PARALYZE   = 13,
    PETRIFY    = 14,
    PLAGUE     = 15,
    POISON     = 16,
    SILENCE    = 17,
    SLOW       = 18,
    STUN       = 19,
    TERROR     = 20,
    TP_DRAIN   = 21,
	HASTE      = 22,
	BIND       = 23,
	DOOM       = 24,
	CHARM      = 25,
    AMNESIA    = 26,
}
tpz.mob.ae = tpz.mob.additionalEffect

local additionalEffects =
{
    [tpz.mob.ae.BLIND] =
    {
        chance = 25,
        ele = tpz.magic.ele.DARK,
        sub = tpz.subEffect.BLIND,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.BLINDNESS,
        power = 20,
        duration = 30,
        minDuration = 1,
        maxDuration = 45,
    },
    [tpz.mob.ae.CURSE] =
    {
        chance = 20,
        ele = tpz.magic.ele.DARK,
        sub = tpz.subEffect.CURSE,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.CURSE_I,
        power = 50,
        duration = 300,
        minDuration = 1,
        maxDuration = 300,
    },
    [tpz.mob.ae.ENAERO] =
    {
        ele = tpz.magic.ele.WIND,
        sub = tpz.subEffect.WIND_DAMAGE,
        msg = tpz.msg.basic.ADD_EFFECT_DMG,
        negMsg = tpz.msg.basic.ADD_EFFECT_HEAL,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [tpz.mob.ae.ENBLIZZARD] =
    {
        ele = tpz.magic.ele.ICE,
        sub = tpz.subEffect.ICE_DAMAGE,
        msg = tpz.msg.basic.ADD_EFFECT_DMG,
        negMsg = tpz.msg.basic.ADD_EFFECT_HEAL,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [tpz.mob.ae.ENDARK] =
    {
        ele = tpz.magic.ele.DARK,
        sub = tpz.subEffect.DARKNESS_DAMAGE,
        msg = tpz.msg.basic.ADD_EFFECT_DMG,
        negMsg = tpz.msg.basic.ADD_EFFECT_HEAL,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [tpz.mob.ae.ENFIRE] =
    {
        ele = tpz.magic.ele.FIRE,
        sub = tpz.subEffect.FIRE_DAMAGE,
        msg = tpz.msg.basic.ADD_EFFECT_DMG,
        negMsg = tpz.msg.basic.ADD_EFFECT_HEAL,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [tpz.mob.ae.ENLIGHT] =
    {
        ele = tpz.magic.ele.LIGHT,
        sub = tpz.subEffect.LIGHT_DAMAGE,
        msg = tpz.msg.basic.ADD_EFFECT_DMG,
        negMsg = tpz.msg.basic.ADD_EFFECT_HEAL,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [tpz.mob.ae.ENSTONE] =
    {
        ele = tpz.magic.ele.EARTH,
        sub = tpz.subEffect.EARTH_DAMAGE,
        msg = tpz.msg.basic.ADD_EFFECT_DMG,
        negMsg = tpz.msg.basic.ADD_EFFECT_HEAL,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [tpz.mob.ae.ENTHUNDER] =
    {
        ele = tpz.magic.ele.LIGHTNING,
        sub = tpz.subEffect.LIGHTNING_DAMAGE,
        msg = tpz.msg.basic.ADD_EFFECT_DMG,
        negMsg = tpz.msg.basic.ADD_EFFECT_HEAL,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [tpz.mob.ae.ENWATER] =
    {
        ele = tpz.magic.ele.WATER,
        sub = tpz.subEffect.WATER_DAMAGE,
        msg = tpz.msg.basic.ADD_EFFECT_DMG,
        negMsg = tpz.msg.basic.ADD_EFFECT_HEAL,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
    },
    [tpz.mob.ae.EVA_DOWN] =
    {
        chance = 25,
        ele = tpz.magic.ele.ICE,
        sub = tpz.subEffect.EVASION_DOWN,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.EVASION_DOWN,
        power = 25,
        duration = 30,
        minDuration = 1,
        maxDuration = 60,
    },
    [tpz.mob.ae.HP_DRAIN] =
    {
        chance = 10,
        ele = tpz.magic.ele.DARK,
        sub = tpz.subEffect.HP_DRAIN,
        msg = tpz.msg.basic.ADD_EFFECT_HP_DRAIN,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
        code = function(mob, target, power) mob:addHP(power) end,
    },
    [tpz.mob.ae.MP_DRAIN] =
    {
        chance = 10,
        ele = tpz.magic.ele.DARK,
        sub = tpz.subEffect.MP_DRAIN,
        msg = tpz.msg.basic.ADD_EFFECT_MP_DRAIN,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
        code = function(mob, target, power) local mp = math.min(power, target:getMP()) target:delMP(mp) mob:addMP(mp) end,
    },
    [tpz.mob.ae.PARALYZE] =
    {
        chance = 25,
        ele = tpz.magic.ele.ICE,
        sub = tpz.subEffect.PARALYSIS,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.PARALYSIS,
        power = 20,
        duration = 30,
        minDuration = 1,
        maxDuration = 60,
    },
    [tpz.mob.ae.PETRIFY] =
    {
        chance = 20,
        ele = tpz.magic.ele.EARTH,
        sub = tpz.subEffect.PETRIFY,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.PETRIFICATION,
        power = 1,
        duration = 30,
        minDuration = 1,
        maxDuration = 45,
    },
    [tpz.mob.ae.PLAGUE] =
    {
        chance = 25,
        ele = tpz.magic.ele.WATER,
        sub = tpz.subEffect.PLAGUE,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.PLAGUE,
        power = 1,
        duration = 60,
        minDuration = 1,
        maxDuration = 60,
    },
    [tpz.mob.ae.POISON] =
    {
        chance = 25,
        ele = tpz.magic.ele.WATER,
        sub = tpz.subEffect.POISON,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.POISON,
        power = 1,
        duration = 30,
        minDuration = 1,
        maxDuration = 30,
        tick = 3,
    },
    [tpz.mob.ae.SILENCE] =
    {
        chance = 25,
        ele = tpz.magic.ele.WIND,
        sub = tpz.subEffect.SILENCE,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.SILENCE,
        power = 1,
        duration = 30,
        minDuration = 1,
        maxDuration = 30,
    },
    [tpz.mob.ae.SLOW] =
    {
        chance = 25,
        ele = tpz.magic.ele.EARTH,
        sub = tpz.subEffect.DEFENSE_DOWN,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.SLOW,
        power = 1000,
        duration = 30,
        minDuration = 1,
        maxDuration = 45,
    },
    [tpz.mob.ae.STUN] =
    {
        chance = 20,
        ele = tpz.magic.ele.LIGHTNING,
        sub = tpz.subEffect.STUN,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.STUN,
        duration = 5,
    },
    [tpz.mob.ae.TERROR] =
    {
        chance = 20,
        sub = tpz.subEffect.PARALYSIS,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.TERROR,
        duration = 5,
        code = function(mob, target, power) mob:resetEnmity(target) end,
    },
    [tpz.mob.ae.TP_DRAIN] =
    {
        chance = 25,
        ele = tpz.magic.ele.DARK,
        sub = tpz.subEffect.TP_DRAIN,
        msg = tpz.msg.basic.ADD_EFFECT_TP_DRAIN,
        mod = tpz.mod.INT,
        bonusAbilityParams = {bonusmab = 0, includemab = false},
        code = function(mob, target, power) local tp = math.min(power, target:getTP()) target:delTP(tp) mob:addTP(tp) end,
    },
	[tpz.mob.ae.HASTE] =
    {
        chance = 25,
        sub = tpz.subEffect.HASTE,
        msg = tpz.msg.basic.NONE,
        selfBuff = true,
        eff = tpz.effect.HASTE,
        power = 3000,
        duration = 30,
        minDuration = 30,
        maxDuration = 30,
    },
	[tpz.mob.ae.BIND] =
    {
        chance = 25,
        ele = tpz.magic.ele.DARK,
        sub = tpz.subEffect.BIND,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.BIND,
        power = 1,
        duration = 30,
        minDuration = 1,
        maxDuration = 30,
    },
	[tpz.mob.ae.DOOM] =
    {
        chance = 10,
        ele = tpz.magic.ele.DARK,
        sub = tpz.subEffect.DOOM,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.DOOM,
        power = 10,
        duration = 30,
        minDuration = 30,
        maxDuration = 30,
		tick = 3,
    },
	[tpz.mob.ae.CHARM] =
    {
        chance = 10,
        ele = tpz.magic.ele.LIGHT,
        sub = tpz.subEffect.CHARM,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.CHARM_I,
        power = 1,
        duration = 60,
        minDuration = 60,
        maxDuration = 60,
    },
    [tpz.mob.ae.AMNESIA] =
    {
        chance = 10,
        ele = tpz.magic.ele.FIRE,
        sub = tpz.subEffect.AMNESIA,
        msg = tpz.msg.basic.ADD_EFFECT_STATUS,
        applyEffect = true,
        eff = tpz.effect.AMNESIA,
        power = 1,
        duration = 30,
        minDuration = 30,
        maxDuration = 30,
    },
}

--[[
    mob, target, and damage are passed from core into mob script's onAdditionalEffect
    effect should be of type tpz.mob.additionalEffect (see above)
    params is a table that can contain any of:
        chance: percent chance that effect procs on hit (default 20)
        power: power of effect
        duration: duration of effect, in seconds
        code: additional code that will run when effect procs, of form function(mob, target, power)
    params will override effect's default settings
--]]
tpz.mob.onAddEffect = function(mob, target, damage, effect, params)
    if type(params) ~= "table" then params = {} end

    local ae = additionalEffects[effect]

    if ae then
        local chance = params.chance or ae.chance or 100
        local dLevel = target:getMainLvl() - mob:getMainLvl()

        if dLevel > 0 then
            chance = chance - 5 * dLevel
            chance = utils.clamp(chance, 5, 95)
        end

        -- target:PrintToPlayer(string.format("Chance: %i", chance)) -- DEBUG

        if math.random(100) <= chance then

            -- STATUS EFFECT
            if ae.applyEffect then
                local resist = 1
                if ae.ele then
                    resist = applyResistanceAddEffect(mob, target, ae.ele, ae.eff)
                end

                if resist > 0.5 and not target:hasStatusEffect(ae.eff) then
                    local power    = params.power or ae.power or 0
                    local tick     = ae.tick or 0
                    local duration = params.duration or ae.duration

                    if dLevel < 0 and ae.eff ~= tpz.effect.TERROR and ae.eff ~= tpz.effect.STUN and ae.eff ~= tpz.effect.PETRIFICATION then
                        duration = duration - dLevel
                    end

                    if ae.minDuration and duration < ae.minDuration then
                        duration = ae.minDuration
                    elseif ae.maxDuration and duration > ae.maxDuration then
                        duration = ae.maxDuration
                    end

                    duration = duration * resist

                    target:addStatusEffect(ae.eff, power, tick, duration)
					
					if (ae.eff == tpz.effect.CHARM_I) then
						mob:charm(target)
					end
					
                    if params.code then
                        params.code(mob, target, power)
                    elseif ae.code then
                        ae.code(mob, target, power)
                    end

                    return ae.sub, ae.msg, ae.eff
                end
			
			elseif ae.selfBuff then
				local power = params.power or ae.power or 0
				local tick = ae.tick or 0
				local duration = params.duration or ae.duration
				
				mob:addStatusEffect(ae.eff, power, tick, duration)
				
				return ae.sub, ae.msg, ae.eff
				
            -- IMMEDIATE EFFECT
            else
                local power = 0

                if params.power then
                    power = params.power
                elseif ae.mod then
                    local dMod = mob:getStat(ae.mod) - target:getStat(ae.mod)

                    if dMod > 20 then
                        dMod = 20 + (dMod - 20) / 2
                    end

                    power = dMod + target:getMainLvl() - mob:getMainLvl() + damage / 2
                end

                -- target:PrintToPlayer(string.format("Initial Power: %f", power)) -- DEBUG

                power = addBonusesAbility(mob, ae.ele, target, power, ae.bonusAbilityParams)
                power = power * applyResistanceAddEffect(mob, target, ae.ele, 0)
                power = adjustForTarget(target, power, ae.ele)
                power = finalMagicNonSpellAdjustments(mob, target, ae.ele, power)

                -- target:PrintToPlayer(string.format("Adjusted Power: %f", power)) -- DEBUG

                local message = ae.msg
                if power < 0 then
                    -- if ae.negMsg then
                        -- message = ae.negMsg
                    -- else
                        power = 0
                    -- end
                end

                if power ~= 0 then
                    if params.code then
                        params.code(mob, target, power)
                    elseif ae.code then
                        ae.code(mob, target, power)
                    end

                    return ae.sub, message, power
                end
            end
        end
    else
        printf("invalid additional effect for mobId %i", mob:getID())
    end

    return 0, 0, 0
end
