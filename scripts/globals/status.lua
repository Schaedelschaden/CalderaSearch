require("scripts/globals/world")

------------------------------------
--
-- STATUSES AND MODS
--
-- Contains variable-ized definitions of things like core enums for use in lua scripts.
------------------------------------
tpz = tpz or {}

------------------------------------
-- Zone Misc Flags
------------------------------------

tpz.zoneMisc =
{
    NONE       = 0x0000, -- Able to be used in any area
    ESCAPE     = 0x0001, -- Ability to use Escape Spell
    FELLOW     = 0x0002, -- Ability to summon Fellow NPC
    MOUNT      = 0x0004, -- Ability to use Chocobos and mounts
    MAZURKA    = 0x0008, -- Ability to use Mazurka Spell
    TRACTOR    = 0x0010, -- Ability to use Tractor Spell
    MOGMENU    = 0x0020, -- Ability to communicate with Nomad Moogle (menu access mog house)
    COSTUME    = 0x0040, -- Ability to use a Costumes
    PET        = 0x0080, -- Ability to summon Pets
    TREASURE   = 0x0100, -- Presence in the global zone TreasurePool
    AH         = 0x0200, -- Ability to use the auction house
    YELL       = 0x0400, -- Send and receive /yell commands
    TRUST      = 0x0800, -- Ability to cast trust magic
}

------------------------------------
-- Job IDs
------------------------------------

tpz.job =
{
    NONE            =  0,
    WAR             =  1,
    MNK             =  2,
    WHM             =  3,
    BLM             =  4,
    RDM             =  5,
    THF             =  6,
    PLD             =  7,
    DRK             =  8,
    BST             =  9,
    BRD             = 10,
    RNG             = 11,
    SAM             = 12,
    NIN             = 13,
    DRG             = 14,
    SMN             = 15,
    BLU             = 16,
    COR             = 17,
    PUP             = 18,
    DNC             = 19,
    SCH             = 20,
    GEO             = 21,
    RUN             = 22,
}
tpz.MAX_JOB_TYPE = 23

------------------------------------
-- Race IDs
------------------------------------

tpz.race =
{
    HUME_M   = 1,
    HUME_F   = 2,
    ELVAAN_M = 3,
    ELVAAN_F = 4,
    TARU_M   = 5,
    TARU_F   = 6,
    MITHRA   = 7,
    GALKA    = 8,
}

------------------------------------
-- STATUSES
------------------------------------

tpz.status =
{
    NORMAL          =  0,
    UPDATE          =  1,
    DISAPPEAR       =  2,
    INVISIBLE       =  3,
    STATUS_4        =  4,
    CUTSCENE_ONLY   =  6,
    STATUS_18       = 18,
    SHUTDOWN        = 20,
}

------------------------------------
-- These codes represent the subeffects for
-- additional effects animations from battleentity.h
------------------------------------

tpz.subEffect =
{
    -- ATTACKS
    FIRE_DAMAGE         = 1,   -- 110000        3
    ICE_DAMAGE          = 2,   -- 1-01000       5
    WIND_DAMAGE         = 3,   -- 111000        7
    CHOKE               = 3,   -- Shares subeffect
    EARTH_DAMAGE        = 4,   -- 1-00100       9
    LIGHTNING_DAMAGE    = 5,   -- 110100       11
    WATER_DAMAGE        = 6,   -- 1-01100      13
    LIGHT_DAMAGE        = 7,   -- 111100       15
    DARKNESS_DAMAGE     = 8,   -- 1-00010      17
    DISPEL              = 8,   -- Verified with video of Lockheart Greatsword proc.
    SLEEP               = 9,   -- 110010       19
    POISON              = 10,  -- 1-01010      21
    PARALYSIS           = 11,
    AMNESIA             = 11,  -- Verified uses same animation as para
    BLIND               = 12,  -- 1-00110      25
    SILENCE             = 13,
    PETRIFY             = 14,
    PLAGUE              = 15,
    STUN                = 16,
    CURSE               = 17,
    DEFENSE_DOWN        = 18,  -- 1-01001      37
    EVASION_DOWN        = 18,  -- Same subeffect as DEFENSE_DOWN
    ATTACK_DOWN         = 18,  -- Same subeffect as DEFENSE_DOWN
    DEATH               = 19,
    SHIELD              = 20,
    HP_DRAIN            = 21,  -- 1-10101      43
    MP_DRAIN            = 22,  -- This is correct animation
    TP_DRAIN            = 22,  -- Verified this should look exactly like Aspir Samba.
    HASTE               = 23,
    -- There are no additional attack effect animations beyond 23. Some effects share subeffect/animations.

    -- SPIKES
    BLAZE_SPIKES        = 1,   -- 01-1000       6
    ICE_SPIKES          = 2,   -- 01-0100      10
    DREAD_SPIKES        = 3,   -- 01-1100      14
    CURSE_SPIKES        = 4,   -- 01-0010      18
    SHOCK_SPIKES        = 5,   -- 01-1010      22
    REPRISAL            = 6,   -- 01-0110      26
    GLINT_SPIKES        = 6,   --
    GALE_SPIKES         = 7,   -- Used by enchantment "Cool Breeze" http://www.ffxiah.com/item/22018/
    CLOD_SPIKES         = 8,   --
    DELUGE_SPIKES       = 9,   --
    DEATH_SPIKES        = 10,  -- yes really: http://www.ffxiah.com/item/26944/
    COUNTER             = 63,
    -- There are no spikes effect animations beyond 63. Some effects share subeffect/animations.
    -- "Damage Spikes" use the Blaze Spikes animation even though they are different status.

    -- SKILLCHAINS
    NONE                = 0,
    LIGHT               = 1,
    DARKNESS            = 2,
    GRAVITATION         = 3,
    FRAGMENTATION       = 4,
    DISTORTION          = 5,
    FUSION              = 6,
    COMPRESSION         = 7,
    LIQUEFACATION       = 8,
    INDURATION          = 9,
    REVERBERATION       = 10,
    TRANSFIXION         = 11,
    SCISSION            = 12,
    DETONATION          = 13,
    IMPACTION           = 14,
}

------------------------------------
-- These codes represent the actual status effects.
-- They are simply for convenience.
------------------------------------

tpz.effect =
{
    KO                       = 0,
    WEAKNESS                 = 1,
    SLEEP_I                  = 2,
    POISON                   = 3,
    PARALYSIS                = 4,
    BLINDNESS                = 5,
    SILENCE                  = 6,
    PETRIFICATION            = 7,
    DISEASE                  = 8,
    CURSE_I                  = 9,
    STUN                     = 10,
    BIND                     = 11,
    WEIGHT                   = 12,
    SLOW                     = 13,
    CHARM_I                  = 14,
    DOOM                     = 15,
    AMNESIA                  = 16,
    CHARM_II                 = 17,
    GRADUAL_PETRIFICATION    = 18,
    SLEEP_II                 = 19,
    CURSE_II                 = 20,
    ADDLE                    = 21,
    INTIMIDATE               = 22,
    KAUSTRA                  = 23,
--	ST24                     = 24, -- MP Icon, ST24, .
--	ST25                     = 25, -- Song Icon, ST25, .
--	ST26                     = 26, -- SP Icon, ST26, .
--	ST27                     = 27, -- Food Icon, ST27, .
    TERROR                   = 28,
    MUTE                     = 29,
    BANE                     = 30,
    PLAGUE                   = 31,
    FLEE                     = 32,
    HASTE                    = 33,
    BLAZE_SPIKES             = 34,
    ICE_SPIKES               = 35,
    BLINK                    = 36,
    STONESKIN                = 37,
    SHOCK_SPIKES             = 38,
    AQUAVEIL                 = 39,
    PROTECT                  = 40,
    SHELL                    = 41,
    REGEN                    = 42,
    REFRESH                  = 43,
    MIGHTY_STRIKES           = 44,
    BOOST                    = 45,
    HUNDRED_FISTS            = 46,
    MANAFONT                 = 47,
    CHAINSPELL               = 48,
    PERFECT_DODGE            = 49,
    INVINCIBLE               = 50,
    BLOOD_WEAPON             = 51,
    SOUL_VOICE               = 52,
    EAGLE_EYE_SHOT           = 53,
    MEIKYO_SHISUI            = 54,
    ASTRAL_FLOW              = 55,
    BERSERK                  = 56,
    DEFENDER                 = 57,
    AGGRESSOR                = 58,
    FOCUS                    = 59,
    DODGE                    = 60,
    COUNTERSTANCE            = 61,
    SENTINEL                 = 62,
    SOULEATER                = 63,
    LAST_RESORT              = 64,
    SNEAK_ATTACK             = 65,
    COPY_IMAGE               = 66,
    THIRD_EYE                = 67,
    WARCRY                   = 68,
    INVISIBLE                = 69,
    DEODORIZE                = 70,
    SNEAK                    = 71,
    SHARPSHOT                = 72,
    BARRAGE                  = 73,
    HOLY_CIRCLE              = 74,
    ARCANE_CIRCLE            = 75,
    HIDE                     = 76,
    CAMOUFLAGE               = 77,
    DIVINE_SEAL              = 78,
    ELEMENTAL_SEAL           = 79,
    STR_BOOST                = 80,
    DEX_BOOST                = 81,
    VIT_BOOST                = 82,
    AGI_BOOST                = 83,
    INT_BOOST                = 84,
    MND_BOOST                = 85,
    CHR_BOOST                = 86,
    TRICK_ATTACK             = 87,
    MAX_HP_BOOST             = 88,
    MAX_MP_BOOST             = 89,
    ACCURACY_BOOST           = 90,
    ATTACK_BOOST             = 91,
    EVASION_BOOST            = 92,
    DEFENSE_BOOST            = 93,
    ENFIRE                   = 94,
    ENBLIZZARD               = 95,
    ENAERO                   = 96,
    ENSTONE                  = 97,
    ENTHUNDER                = 98,
    ENWATER                  = 99,
    BARFIRE                  = 100,
    BARBLIZZARD              = 101,
    BARAERO                  = 102,
    BARSTONE                 = 103,
    BARTHUNDER               = 104,
    BARWATER                 = 105,
    BARSLEEP                 = 106,
    BARPOISON                = 107,
    BARPARALYZE              = 108,
    BARBLIND                 = 109,
    BARSILENCE               = 110,
    BARPETRIFY               = 111,
    BARVIRUS                 = 112,
    RERAISE                  = 113,
    COVER                    = 114,
    UNLIMITED_SHOT           = 115,
    PHALANX                  = 116,
    WARDING_CIRCLE           = 117,
    ANCIENT_CIRCLE           = 118,
    STR_BOOST_II             = 119,
    DEX_BOOST_II             = 120,
    VIT_BOOST_II             = 121,
    AGI_BOOST_II             = 122,
    INT_BOOST_II             = 123,
    MND_BOOST_II             = 124,
    CHR_BOOST_II             = 125,
    SPIRIT_SURGE             = 126,
    COSTUME                  = 127,
    BURN                     = 128,
    FROST                    = 129,
    CHOKE                    = 130,
    RASP                     = 131,
    SHOCK                    = 132,
    DROWN                    = 133,
    DIA                      = 134,
    BIO                      = 135,
    STR_DOWN                 = 136,
    DEX_DOWN                 = 137,
    VIT_DOWN                 = 138,
    AGI_DOWN                 = 139,
    INT_DOWN                 = 140,
    MND_DOWN                 = 141,
    CHR_DOWN                 = 142,
    LEVEL_RESTRICTION        = 143,
    MAX_HP_DOWN              = 144,
    MAX_MP_DOWN              = 145,
    ACCURACY_DOWN            = 146,
    ATTACK_DOWN              = 147,
    EVASION_DOWN             = 148,
    DEFENSE_DOWN             = 149,
    PHYSICAL_SHIELD          = 150,
    ARROW_SHIELD             = 151,
    MAGIC_SHIELD             = 152,
    DAMAGE_SPIKES            = 153,
    SHINING_RUBY             = 154,
    MEDICINE                 = 155,
    FLASH                    = 156,
    SJ_RESTRICTION           = 157,
    PROVOKE                  = 158,
    PENALTY                  = 159,
    PREPARATIONS             = 160,
    SPRINT                   = 161,
    ENCHANTMENT              = 162,
    AZURE_LORE               = 163,
    CHAIN_AFFINITY           = 164,
    BURST_AFFINITY           = 165,
    OVERDRIVE                = 166,
    MAGIC_DEF_DOWN           = 167,
    INHIBIT_TP               = 168,
    POTENCY                  = 169,
    REGAIN                   = 170,
    PAX                      = 171,
    INTENSION                = 172,
    DREAD_SPIKES             = 173,
    MAGIC_ACC_DOWN           = 174,
    MAGIC_ATK_DOWN           = 175,
    QUICKENING               = 176,
    ENCUMBRANCE_II           = 177,
    FIRESTORM                = 178,
    HAILSTORM                = 179,
    WINDSTORM                = 180,
    SANDSTORM                = 181,
    THUNDERSTORM             = 182,
    RAINSTORM                = 183,
    AURORASTORM              = 184,
    VOIDSTORM                = 185,
    HELIX                    = 186,
    SUBLIMATION_ACTIVATED    = 187,
    SUBLIMATION_COMPLETE     = 188,
    MAX_TP_DOWN              = 189,
    MAGIC_ATK_BOOST          = 190,
    MAGIC_DEF_BOOST          = 191,
    REQUIEM                  = 192,
    LULLABY                  = 193,
    ELEGY                    = 194,
    PAEON                    = 195,
    BALLAD                   = 196,
    MINNE                    = 197,
    MINUET                   = 198,
    MADRIGAL                 = 199,
    PRELUDE                  = 200,
    MAMBO                    = 201,
    AUBADE                   = 202,
    PASTORAL                 = 203,
    HUM                      = 204,
    FANTASIA                 = 205,
    OPERETTA                 = 206,
    CAPRICCIO                = 207,
    SERENADE                 = 208,
    ROUND                    = 209,
    GAVOTTE                  = 210,
    FUGUE                    = 211,
    RHAPSODY                 = 212,
    ARIA                     = 213,
    MARCH                    = 214,
    ETUDE                    = 215,
    CAROL                    = 216,
    THRENODY                 = 217,
    HYMNUS                   = 218,
    MAZURKA                  = 219,
    SIRVENTE                 = 220,
    DIRGE                    = 221,
    SCHERZO                  = 222,
    NOCTURNE                 = 223,
--	ST224                    = 224, -- Song icon, ST224, (You are benefitting from song effects)
--	ST225                    = 225, -- Song icon, ST225, (You are benefitting from song effects)
--	ST226                    = 226, -- Song icon, ST226, (You are benefitting from song effects)
    STORE_TP                 = 227,
    EMBRAVA                  = 228,
    MANAWELL                 = 229,
    SPONTANEITY              = 230,
    MARCATO                  = 231,
    NA                       = 232,
    AUTO_REGEN               = 233,
    AUTO_REFRESH             = 234,
    FISHING_IMAGERY          = 235,
    WOODWORKING_IMAGERY      = 236,
    SMITHING_IMAGERY         = 237,
    GOLDSMITHING_IMAGERY     = 238,
    CLOTHCRAFT_IMAGERY       = 239,
    LEATHERCRAFT_IMAGERY     = 240,
    BONECRAFT_IMAGERY        = 241,
    ALCHEMY_IMAGERY          = 242,
    COOKING_IMAGERY          = 243,
    IMAGERY_1                = 244,
    IMAGERY_2                = 245,
    IMAGERY_3                = 246,
    IMAGERY_4                = 247,
    IMAGERY_5                = 248,
    DEDICATION               = 249,
    EF_BADGE                 = 250,
    FOOD                     = 251,
    MOUNTED                  = 252,
    SIGNET                   = 253,
    BATTLEFIELD              = 254,
    NONE                     = 255,
    SANCTION                 = 256,
    BESIEGED                 = 257,
    ILLUSION                 = 258,
    ENCUMBRANCE_I            = 259,
    OBLIVISCENCE             = 260,
    IMPAIRMENT               = 261,
    OMERTA                   = 262,
    DEBILITATION             = 263,
    PATHOS                   = 264,
    FLURRY                   = 265,
    CONCENTRATION            = 266,
    ALLIED_TAGS              = 267,
    SIGIL                    = 268,
    LEVEL_SYNC               = 269,
    AFTERMATH_LV1            = 270,
    AFTERMATH_LV2            = 271,
    AFTERMATH_LV3            = 272,
    AFTERMATH                = 273,
    ENLIGHT                  = 274,
    AUSPICE                  = 275,
    CONFRONTATION            = 276,
    ENFIRE_II                = 277,
    ENBLIZZARD_II            = 278,
    ENAERO_II                = 279,
    ENSTONE_II               = 280,
    ENTHUNDER_II             = 281,
    ENWATER_II               = 282,
    PERFECT_DEFENSE          = 283,
    EGG                      = 284,
    VISITANT                 = 285,
    BARAMNESIA               = 286,
    ATMA                     = 287,
    ENDARK                   = 288,
    ENMITY_BOOST             = 289,
    SUBTLE_BLOW_PLUS         = 290,
    ENMITY_DOWN              = 291,
    PENNANT                  = 292,
    NEGATE_PETRIFY           = 293,
    NEGATE_TERROR            = 294,
    NEGATE_AMNESIA           = 295,
    NEGATE_DOOM              = 296,
    NEGATE_POISON            = 297,
    CRIT_HIT_EVASION_DOWN    = 298,
    OVERLOAD                 = 299,
    FIRE_MANEUVER            = 300,
    ICE_MANEUVER             = 301,
    WIND_MANEUVER            = 302,
    EARTH_MANEUVER           = 303,
    THUNDER_MANEUVER         = 304,
    WATER_MANEUVER           = 305,
    LIGHT_MANEUVER           = 306,
    DARK_MANEUVER            = 307,
    DOUBLE_UP_CHANCE         = 308,
    BUST                     = 309,
    FIGHTERS_ROLL            = 310,
    MONKS_ROLL               = 311,
    HEALERS_ROLL             = 312,
    WIZARDS_ROLL             = 313,
    WARLOCKS_ROLL            = 314,
    ROGUES_ROLL              = 315,
    GALLANTS_ROLL            = 316,
    CHAOS_ROLL               = 317,
    BEAST_ROLL               = 318,
    CHORAL_ROLL              = 319,
    HUNTERS_ROLL             = 320,
    SAMURAI_ROLL             = 321,
    NINJA_ROLL               = 322,
    DRACHEN_ROLL             = 323,
    EVOKERS_ROLL             = 324,
    MAGUSS_ROLL              = 325,
    CORSAIRS_ROLL            = 326,
    PUPPET_ROLL              = 327,
    DANCERS_ROLL             = 328,
    SCHOLARS_ROLL            = 329,
    BOLTERS_ROLL             = 330,
    CASTERS_ROLL             = 331,
    COURSERS_ROLL            = 332,
    BLITZERS_ROLL            = 333,
    TACTICIANS_ROLL          = 334,
    ALLIES_ROLL              = 335,
    MISERS_ROLL              = 336,
    COMPANIONS_ROLL          = 337,
    AVENGERS_ROLL            = 338,
    NATURALISTS_ROLL         = 339,
    WARRIOR_S_CHARGE         = 340,
    FORMLESS_STRIKES         = 341,
    ASSASSINS_CHARGE         = 342,
    FEINT                    = 343,
    FEALTY                   = 344,
    DARK_SEAL                = 345,
    DIABOLIC_EYE             = 346,
    NIGHTINGALE              = 347,
    TROUBADOUR               = 348,
    KILLER_INSTINCT          = 349,
    STEALTH_SHOT             = 350,
    FLASHY_SHOT              = 351,
    SANGE                    = 352,
    HASSO                    = 353,
    SEIGAN                   = 354,
    CONVERGENCE              = 355,
    DIFFUSION                = 356,
    SNAKE_EYE                = 357,
    LIGHT_ARTS               = 358,
    DARK_ARTS                = 359,
    PENURY                   = 360,
    PARSIMONY                = 361,
    CELERITY                 = 362,
    ALACRITY                 = 363,
    RAPTURE                  = 364,
    EBULLIENCE               = 365,
    ACCESSION                = 366,
    MANIFESTATION            = 367,
    DRAIN_SAMBA              = 368,
    ASPIR_SAMBA              = 369,
    HASTE_SAMBA              = 370,
    VELOCITY_SHOT            = 371,
--	.                        = 372, -- Battlefield icon, ., Evasion is reduced
--	.                        = 373, -- Battlefield icon, ., Defense is reduced
--	.                        = 374, -- Battlefield icon, ., Magic resistance is reduced
    BUILDING_FLOURISH        = 375,
    TRANCE                   = 376,
    TABULA_RASA              = 377,
    DRAIN_DAZE               = 378,
    ASPIR_DAZE               = 379,
    HASTE_DAZE               = 380,
    FINISHING_MOVE_1         = 381,
    FINISHING_MOVE_2         = 382,
    FINISHING_MOVE_3         = 383,
    FINISHING_MOVE_4         = 384,
    FINISHING_MOVE_5         = 385,
    LETHARGIC_DAZE_1         = 386,
    LETHARGIC_DAZE_2         = 387,
    LETHARGIC_DAZE_3         = 388,
    LETHARGIC_DAZE_4         = 389,
    LETHARGIC_DAZE_5         = 390,
    SLUGGISH_DAZE_1          = 391,
    SLUGGISH_DAZE_2          = 392,
    SLUGGISH_DAZE_3          = 393,
    SLUGGISH_DAZE_4          = 394,
    SLUGGISH_DAZE_5          = 395,
    WEAKENED_DAZE_1          = 396,
    WEAKENED_DAZE_2          = 397,
    WEAKENED_DAZE_3          = 398,
    WEAKENED_DAZE_4          = 399,
    WEAKENED_DAZE_5          = 400,
    ADDENDUM_WHITE           = 401,
    ADDENDUM_BLACK           = 402,
    REPRISAL                 = 403,
    MAGIC_EVASION_DOWN       = 404,
    RETALIATION              = 405,
    FOOTWORK                 = 406,
    KLIMAFORM                = 407,
    SEKKANOKI                = 408,
    PIANISSIMO               = 409,
    SABER_DANCE              = 410,
    FAN_DANCE                = 411,
    ALTRUISM                 = 412,
    FOCALIZATION             = 413,
    TRANQUILITY              = 414,
    EQUANIMITY               = 415,
    ENLIGHTENMENT            = 416,
    AFFLATUS_SOLACE          = 417,
    AFFLATUS_MISERY          = 418,
    COMPOSURE                = 419,
    YONIN                    = 420,
    INNIN                    = 421,
    CARBUNCLE_S_FAVOR        = 422,
    IFRIT_S_FAVOR            = 423,
    SHIVA_S_FAVOR            = 424,
    GARUDA_S_FAVOR           = 425,
    TITAN_S_FAVOR            = 426,
    RAMUH_S_FAVOR            = 427,
    LEVIATHAN_S_FAVOR        = 428,
    FENRIR_S_FAVOR           = 429,
    DIABOLOS_S_FAVOR         = 430,
    AVATAR_S_FAVOR           = 431,
    MULTI_STRIKES            = 432,
    DOUBLE_SHOT              = 433,
    TRANSCENDENCY            = 434,
    RESTRAINT                = 435,
    PERFECT_COUNTER          = 436,
    MANA_WALL                = 437,
    DIVINE_EMBLEM            = 438,
    NETHER_VOID              = 439,
    SENGIKORI                = 440,
    FUTAE                    = 441,
    PRESTO                   = 442,
    CLIMACTIC_FLOURISH       = 443,
    COPY_IMAGE_2             = 444,
    COPY_IMAGE_3             = 445,
    COPY_IMAGE_4             = 446,
    MULTI_SHOTS              = 447,
    BEWILDERED_DAZE_1        = 448,
    BEWILDERED_DAZE_2        = 449,
    BEWILDERED_DAZE_3        = 450,
    BEWILDERED_DAZE_4        = 451,
    BEWILDERED_DAZE_5        = 452,
    DIVINE_CARESS_I          = 453,
    SABOTEUR                 = 454,
    TENUTO                   = 455,
    SPUR                     = 456,
    EFFLUX                   = 457,
    EARTHEN_ARMOR            = 458,
    DIVINE_CARESS_II         = 459,
    BLOOD_RAGE               = 460,
    IMPETUS                  = 461,
    CONSPIRATOR              = 462,
    SEPULCHER                = 463,
    ARCANE_CREST             = 464,
    HAMANOHA                 = 465,
    DRAGON_BREAKER           = 466,
    TRIPLE_SHOT              = 467,
    STRIKING_FLOURISH        = 468,
    PERPETUANCE              = 469,
    IMMANENCE                = 470,
    MIGAWARI                 = 471,
    TERNARY_FLOURISH         = 472, -- DNC 93
    MUDDLE                   = 473, -- MOB EFFECT
    PROWESS                  = 474, -- GROUNDS OF VALOR
    VOIDWATCHER              = 475, -- VOIDWATCH
    ENSPHERE                 = 476, -- ATMACITE
    SACROSANCTITY            = 477, -- WHM 95
    PALISADE                 = 478, -- PLD 95
    SCARLET_DELIRIUM         = 479, -- DRK 95
    SCARLET_DELIRIUM_1       = 480, -- DRK 95
	ABDHALJS_SEAL            = 481,
    DECOY_SHOT               = 482, -- RNG 95
    HAGAKURE                 = 483, -- SAM 95
    ISSEKIGAN                = 484, -- NIN 95
    UNBRIDLED_LEARNING       = 485, -- BLU 95
    COUNTER_BOOST            = 486, --
    ENDRAIN                  = 487, -- FENRIR 96
    ENASPIR                  = 488, -- FENRIR 96
    AFTERGLOW                = 489, -- WS AFTEREFFECT
    BRAZEN_STRENGTH          = 490, --
    INNER_STRENGTH           = 491,
    ASYLUM                   = 492,
    SUBTLE_SORCERY           = 493,
    STYMIE                   = 494,
	RUN_WILD                 = 495, -- (None) DEBUG: Please report. Assigned to Run Wild
    INTERVENE                = 496,
    SOUL_ENSLAVEMENT         = 497,
    UNLEASH                  = 498,
    CLARION_CALL             = 499,
    OVERKILL                 = 500,
    YAEGASUMI                = 501,
    MIKAGE                   = 502,
    FLY_HIGH                 = 503,
    ASTRAL_CONDUIT           = 504,
    UNBRIDLED_WISDOM         = 505,
	BOUNTY_SHOT              = 506, -- (None) DEBUG: Please report. Assigned to Bounty Shot
    GRAND_PAS                = 507,
    WIDENED_COMPASS          = 508,
    ODYLLIC_SUBTERFUGE       = 509,
    ERGON_MIGHT              = 510,
    REIVE_MARK               = 511,
    IONIS                    = 512,
    BOLSTER                  = 513,
	NIGHTMARE                = 514, -- (None) DEBUG: Please report. Assigned to Nightmare
    LASTING_EMANATION        = 515,
    ECLIPTIC_ATTRITION       = 516,
    COLLIMATED_FERVOR        = 517,
    DEMATERIALIZE            = 518,
    THEURGIC_FOCUS           = 519,
	HEADY_ARTIFICE           = 520, -- (None) DEBUG: Please Report. Assigned to Heady Artifice
--  NONE                     = 521,
    ELEMENTAL_SFORZO         = 522,
    IGNIS                    = 523,
    GELUS                    = 524,
    FLABRA                   = 525,
    TELLUS                   = 526,
    SULPOR                   = 527,
    UNDA                     = 528,
    LUX                      = 529,
    TENEBRAE                 = 530,
    VALLATION                = 531,
    SWORDPLAY                = 532,
    PFLUG                    = 533,
    EMBOLDEN                 = 534,
    VALIANCE                 = 535,
    GAMBIT                   = 536,
    LIEMENT                  = 537,
    ONE_FOR_ALL              = 538,
    GEO_REGEN                = 539,
    GEO_POISON               = 540,
    GEO_REFRESH              = 541,
    GEO_STR_BOOST            = 542,
    GEO_DEX_BOOST            = 543,
    GEO_VIT_BOOST            = 544,
    GEO_AGI_BOOST            = 545,
    GEO_INT_BOOST            = 546,
    GEO_MND_BOOST            = 547,
    GEO_CHR_BOOST            = 548,
    GEO_ATTACK_BOOST         = 549,
    GEO_DEFENSE_BOOST        = 550,
    GEO_MAGIC_ATK_BOOST      = 551,
    GEO_MAGIC_DEF_BOOST      = 552,
    GEO_ACCURACY_BOOST       = 553,
    GEO_EVASION_BOOST        = 554,
    GEO_MAGIC_ACC_BOOST      = 555,
    GEO_MAGIC_EVASION_BOOST  = 556,
    GEO_ATTACK_DOWN          = 557,
    GEO_DEFENSE_DOWN         = 558,
    GEO_MAGIC_ATK_DOWN       = 559,
    GEO_MAGIC_DEF_DOWN       = 560,
    GEO_ACCURACY_DOWN        = 561,
    GEO_EVASION_DOWN         = 562,
    GEO_MAGIC_ACC_DOWN       = 563,
    GEO_MAGIC_EVASION_DOWN   = 564,
    GEO_SLOW                 = 565,
    GEO_PARALYSIS            = 566,
    GEO_WEIGHT               = 567,
    FOIL                     = 568,
    BLAZE_OF_GLORY           = 569,
    BATTUTA                  = 570,
    RAYKE                    = 571,
    AVOIDANCE_DOWN           = 572,
    DELUGE_SPIKES            = 573,
    FAST_CAST                = 574,
    GESTATION                = 575,
    DOUBT                    = 576, -- Bully: Intimidation Enfeeble status
    CAIT_SITH_S_FAVOR        = 577,
    FISHY_INTUITION          = 578,
    COMMITMENT               = 579,
    GEO_HASTE                = 580,
    FLURRY_II                = 581,
	CONTRADANCE              = 582,
    APOGEE                   = 583,
    ENTRUST                  = 584,
    COSTUME_II               = 585,
    CURING_CONDUIT           = 586,
    TP_BONUS                 = 587,
    FINISHING_MOVE_6         = 588,
    FIRESTORM_II             = 589,
    HAILSTORM_II             = 590,
    WINDSTORM_II             = 591,
    SANDSTORM_II             = 592,
    THUNDERSTORM_II          = 593,
    RAINSTORM_II             = 594,
    AURORASTORM_II           = 595,
    VOIDSTORM_II             = 596,
    INUNDATION               = 597,
    CASCADE                  = 598,
    CONSUME_MANA             = 599,
    RUNEISTS_ROLL            = 600,
    CROOKED_CARDS            = 601,
    VORSEAL                  = 602,
    ELVORSEAL                = 603,
    MIGHTY_GUARD             = 604,
    GALE_SPIKES              = 605,
    CLOD_SPIKES              = 606,
    GLINT_SPIKES             = 607,
    NEGATE_VIRUS             = 608,
    NEGATE_CURSE             = 609,
    NEGATE_CHARM             = 610,
    MAGIC_EVASION_BOOST_II   = 611,
    COLURE_ACTIVE            = 612,
	MUMORS_RADIANCE          = 613,
	ULLEGORES_GLOOM          = 614,
	BOOST_II                 = 615,
	ARTISANAL_KNOWLEDGE      = 616,
	SACRIFICE                = 617,
	EMPOROXS_GIFT            = 618,
	SPIRIT_BOND              = 619,
	AWAKEN                   = 620,
	MAJESTY                  = 621,
	GUARDING_RATE_BOOST      = 622,
    RAMPART                  = 623,
	WINDS_BLESSING           = 624,
	SIRENS_FAVOR             = 625,
	NEGATE_SLEEP             = 626,
	MOBILIZATION             = 627,
	HOVER_SHOT               = 628,
    MOOGLE_AMPLIFIER         = 629,
	ZEALOUS_SNORT            = 630, -- (None) DEBUG: Please report. Assigned to Zealous Snort
	FAMILIAR                 = 631, -- (None) DEBUG: Please report. Assigned to Familiar
--	NONE                     = 632, -- (None) DEBUG: Please report.
--	NONE                     = 633, -- (None) DEBUG: Please report.
--	NONE                     = 634, -- (None) DEBUG: Please report.
--	NONE                     = 635, -- (None) DEBUG: Please report.
--	NONE                     = 636, -- (None) DEBUG: Please report.
--	NONE                     = 637, -- (None) DEBUG: Please report.
--	NONE                     = 638, -- (None) DEBUG: Please report.

--	NONE                     = 767, -- (None) DEBUG: Please report.
    -- Effect icons in packet can go from 0-767, so no custom effects should go in that range.

    -- Purchased from Cruor Prospector
    ABYSSEA_STR              = 768,
    ABYSSEA_DEX              = 769,
    ABYSSEA_VIT              = 770,
    ABYSSEA_AGI              = 771,
    ABYSSEA_INT              = 772,
    ABYSSEA_MND              = 773,
    ABYSSEA_CHR              = 774,
    ABYSSEA_HP               = 775,
    ABYSSEA_MP               = 776,

    -- *Prowess increases not currently retail accurate.
    -- GoV Prowess bonus effects, real effect at ID 474
    PROWESS_CASKET_RATE      = 777, -- (Unimplemented)
    PROWESS_SKILL_RATE       = 778, -- (Unimplemented)
    PROWESS_CRYSTAL_YIELD    = 779, -- (Unimplemented)
    PROWESS_TH               = 780, -- +1 per tier
    PROWESS_ATTACK_SPEED     = 781, -- *flat 4% for now
    PROWESS_HP_MP            = 782, -- Base 3% and another 1% per tier.
    PROWESS_ACC_RACC         = 783, -- *flat 4% for now
    PROWESS_ATT_RATT         = 784, -- *flat 4% for now
    PROWESS_MACC_MATK        = 785, -- *flat 4% for now
    PROWESS_CURE_POTENCY     = 786, -- *flat 4% for now
    PROWESS_WS_DMG           = 787, -- +2% per tier
    PROWESS_KILLER           = 788, -- *flat +4 for now
    -- End GoV Prowess fakery
    FIELD_SUPPORT_FOOD       = 789, -- Used by Fov/GoV food buff.
    MARK_OF_SEED             = 790, -- Tracks 30 min timer in ACP mission "Those Who Lurk in Shadows (II)"
    TOO_HIGH                 = 791, -- Indicates a target is airborne and unable to be hit by normal melee attacks
    SUPER_BUFF               = 792,
    NINJUTSU_ELE_DEBUFF      = 793,
    HEALING                  = 794,
    LEAVEGAME                = 795,
    HASTE_SAMBA_HASTE        = 796,
    TELEPORT                 = 797,
    CHAINBOUND               = 798,
    SKILLCHAIN               = 799,
    DYNAMIS                  = 800,
    MEDITATE                 = 801, -- Dummy effect for SAM Meditate JA
    ELEMENTALRES_DOWN        = 802, -- Elemental resistance down
    FULL_SPEED_AHEAD         = 803, -- Helper for quest: Full Speed Ahead!
    -- PLACEHOLDER           = 804, -- Description
    TOMAHAWK                 = 805,
    -- 806-1022
    -- PLACEHOLDER             = 1023 -- The client dat file seems to have only this many "slots", results of exceeding that are untested.
}

----------------------------------
-- SC masks (not currently used in code base)
----------------------------------

-- EFFECT_SKILLCHAIN0    = 0x200
-- EFFECT_SKILLCHAIN1    = 0x400
-- EFFECT_SKILLCHAIN2    = 0x800
-- EFFECT_SKILLCHAIN3    = 0x1000
-- EFFECT_SKILLCHAIN4    = 0x2000
-- EFFECT_SKILLCHAIN5    = 0x4000
-- EFFECT_SKILLCHAINMASK = 0x7C00

------------------------------------
-- Effect Flags
------------------------------------

tpz.effectFlag =
{
    NONE            = 0x0000,
    DISPELABLE      = 0x0001,
    ERASABLE        = 0x0002,
    ATTACK          = 0x0004,
    EMPATHY         = 0x0008,
    DAMAGE          = 0x0010,
    DEATH           = 0x0020,
    MAGIC_BEGIN     = 0x0040,
    MAGIC_END       = 0x0080,
    ON_ZONE         = 0x0100,
    NO_LOSS_MESSAGE = 0x0200,
    INVISIBLE       = 0x0400,
    DETECTABLE      = 0x0800,
    NO_REST         = 0x1000,
    PREVENT_ACTION  = 0x2000,
    WALTZABLE       = 0x4000,
    FOOD            = 0x8000,
    SONG            = 0x10000,
    ROLL            = 0x20000,
    SYNTH_SUPPORT   = 0x40000,
    CONFRONTATION   = 0x80000,
    LOGOUT          = 0x100000,
    BLOODPACT       = 0x200000,
    ON_JOBCHANGE    = 0x400000,
    NO_CANCEL       = 0x800000,
    INFLUENCE       = 0x1000000,
    OFFLINE_TICK    = 0x2000000,
    AURA            = 0x4000000,
}

------------------------------------

function removeSleepEffects(target)
    target:delStatusEffect(tpz.effect.SLEEP_I)
    target:delStatusEffect(tpz.effect.SLEEP_II)
    target:delStatusEffect(tpz.effect.LULLABY)
end

function hasSleepEffects(target)
    return target:hasStatusEffect(tpz.effect.SLEEP_I) or target:hasStatusEffect(tpz.effect.SLEEP_II) or target:hasStatusEffect(tpz.effect.LULLABY)
end

------------------------------------
-- These values are the codes that represent any statistic possible on an entity.
-- These are NOT the actual status effects such as weakness or silence,
-- but rather arbitrary codes chosen to represent different modifiers to the effected characters and mobs.
--
-- Even if the particular mod is not completely (or at all) implemented yet, you can still script the effects using these codes.
--
-- Example: target:getMod(tpz.mod.STR) will get the sum of STR bonuses/penalties from gear, food, STR Etude, Absorb-STR, and any other STR-related buff/debuff.
-- Note that the above will ignore base statistics, and that getStat() should be used for stats, Attack, and Defense, while getACC(), getRACC(), and getEVA() also exist.
------------------------------------

tpz.mod =
{
    NONE                            = 0,
    DEF                             = 1,
    HP                              = 2,
    HPP                             = 3,
    CONVMPTOHP                      = 4,
    MP                              = 5,
    MPP                             = 6,
    CONVHPTOMP                      = 7,
    STR                             = 8,
    DEX                             = 9,
    VIT                             = 10,
    AGI                             = 11,
    INT                             = 12,
    MND                             = 13,
    CHR                             = 14,
    FIREDEF                         = 15,
    ICEDEF                          = 16,
    WINDDEF                         = 17,
    EARTHDEF                        = 18,
    THUNDERDEF                      = 19,
    WATERDEF                        = 20,
    LIGHTDEF                        = 21,
    DARKDEF                         = 22,
    ATT                             = 23,
    RATT                            = 24,
    ACC                             = 25,
    RACC                            = 26,
    ENMITY                          = 27,
    ENMITY_LOSS_REDUCTION           = 427,
    MATT                            = 28,
    MDEF                            = 29,
    MACC                            = 30,
    MEVA                            = 31,

    -- Elemental "Magic Attack Bonus" e.g. Pixie Hairpin +1, Archon Ring, Zamzummim staff, Weatherspoon Ring, etc.
    -- Value of these mods is added to the Elemental Affinity: Magice Damage mods
    -- Mod value 15 = +15% base damage, Mod value 28 = +28% base damage, etc.
    FIREATT                         = 32,
    ICEATT                          = 33,
    WINDATT                         = 34,
    EARTHATT                        = 35,
    THUNDERATT                      = 36,
    WATERATT                        = 37,
    LIGHTATT                        = 38,
    DARKATT                         = 39,

    FIREACC                         = 40,
    ICEACC                          = 41,
    WINDACC                         = 42,
    EARTHACC                        = 43,
    THUNDERACC                      = 44,
    WATERACC                        = 45,
    LIGHTACC                        = 46,
    DARKACC                         = 47,

    WSACC                           = 48,
    SLASHRES                        = 49,
    PIERCERES                       = 50,
    IMPACTRES                       = 51,
    HTHRES                          = 52,
    FIRERES                         = 54,
    ICERES                          = 55,
    WINDRES                         = 56,
    EARTHRES                        = 57,
    THUNDERRES                      = 58,
    WATERRES                        = 59,
    LIGHTRES                        = 60,
    DARKRES                         = 61,
    ATTP                            = 62,
    DEFP                            = 63,
    COMBAT_SKILLUP_RATE             = 64, -- % increase in skillup combat rate
    MAGIC_SKILLUP_RATE              = 65, -- % increase in skillup magic rate
    RATTP                           = 66,
    EVA                             = 68,
    RDEF                            = 69,
    REVA                            = 70,
    MPHEAL                          = 71,
    HPHEAL                          = 72,
    STORETP                         = 73,
    HTH                             = 80,
    DAGGER                          = 81,
    SWORD                           = 82,
    GSWORD                          = 83,
    AXE                             = 84,
    GAXE                            = 85,
    SCYTHE                          = 86,
    POLEARM                         = 87,
    KATANA                          = 88,
    GKATANA                         = 89,
    CLUB                            = 90,
    STAFF                           = 91,
    RAMPART_DURATION                = 92,  -- Rampart duration in seconds
    FLEE_DURATION                   = 93,  -- Flee duration in seconds
    MEDITATE_DURATION               = 94,  -- Meditate duration in seconds
    WARDING_CIRCLE_DURATION         = 95,  -- Warding Circle duration in seconds
    SOULEATER_EFFECT                = 96,  -- Souleater power in percents
    DESPERATE_BLOWS                 = 906, -- Adds ability haste to Last Resort
    STALWART_SOUL                   = 907, -- Reduces damage taken from Souleater
    BOOST_EFFECT                    = 97,  -- Boost power in tenths
    CAMOUFLAGE_DURATION             = 98,  -- Camouflage duration in percents
    AUTO_MELEE_SKILL                = 101,
    AUTO_RANGED_SKILL               = 102,
    AUTO_MAGIC_SKILL                = 103,
    ARCHERY                         = 104,
    MARKSMAN                        = 105,
    THROW                           = 106,
    GUARD                           = 107,
    EVASION                         = 108,
    SHIELD                          = 109,
    PARRY                           = 110,
    DIVINE                          = 111,
    HEALING                         = 112,
    ENHANCE                         = 113,
    ENFEEBLE                        = 114,
    ELEM                            = 115,
    DARK                            = 116,
    SUMMONING                       = 117,
    NINJUTSU                        = 118,
    SINGING                         = 119,
    STRING                          = 120,
    WIND                            = 121,
    BLUE                            = 122,
    CHAKRA_MULT                     = 123, -- Chakra multiplier increase
    CHAKRA_REMOVAL                  = 124, -- Extra statuses removed by Chakra
    SUPPRESS_OVERLOAD               = 125, -- Kenkonken "Suppresses Overload" mod. Unclear how this works exactly. Requires testing on retail.
    BP_DAMAGE                       = 126, -- Blood Pact: Rage Damage increase percentage
    FISH                            = 127,
    WOOD                            = 128,
    SMITH                           = 129,
    GOLDSMITH                       = 130,
    CLOTH                           = 131,
    LEATHER                         = 132,
    BONE                            = 133,
    ALCHEMY                         = 134,
    COOK                            = 135,
    SYNERGY                         = 136,
    RIDING                          = 137,
    ANTIHQ_WOOD                     = 144,
    ANTIHQ_SMITH                    = 145,
    ANTIHQ_GOLDSMITH                = 146,
    ANTIHQ_CLOTH                    = 147,
    ANTIHQ_LEATHER                  = 148,
    ANTIHQ_BONE                     = 149,
    ANTIHQ_ALCHEMY                  = 150,
    ANTIHQ_COOK                     = 151,
    DMG                             = 160,
    DMGPHYS                         = 161,
    DMGPHYS_II                      = 190, -- Physical Damage Taken II % (Burtgang)
    DMGBREATH                       = 162,
    DMGMAGIC                        = 163,
    DMGMAGIC_II                     = 831, -- Magic Damage Taken II % (Aegis)
    DMGRANGE                        = 164,
    UDMGPHYS                        = 387,
    UDMGBREATH                      = 388,
    UDMGMAGIC                       = 389,
    UDMGRANGE                       = 390,
    CRITHITRATE                     = 165,
    CRIT_DMG_INCREASE               = 421,
    RANGED_CRIT_DMG_INCREASE        = 964, -- Increases ranged critical damage by a percent
    ENEMYCRITRATE                   = 166,
    CRIT_DEF_BONUS                  = 908, -- Reduces crit hit damage
    MAGIC_CRITHITRATE               = 562,
    MAGIC_CRIT_DMG_INCREASE         = 563,
    HASTE_MAGIC                     = 167,
    SPELLINTERRUPT                  = 168,
    MOVE                            = 169, -- % Movement Speed
    MOUNT_MOVE                      = 972, -- % Mount Movement Speed
    FASTCAST                        = 170,
    UFASTCAST                       = 407,
    CURE_CAST_TIME                  = 519,
    ELEMENTAL_CELERITY              = 901, -- Quickens Elemental Magic Casting
    DELAY                           = 171,
    RANGED_DELAY                    = 172,
    MARTIAL_ARTS                    = 173,
    SKILLCHAINBONUS                 = 174,
    SKILLCHAINDMG                   = 175,
    MAX_SWINGS                      = 978,
    ADDITIONAL_SWING_CHANCE         = 979,
    FOOD_HPP                        = 176,
    FOOD_HP_CAP                     = 177,
    FOOD_MPP                        = 178,
    FOOD_MP_CAP                     = 179,
    FOOD_ATTP                       = 180,
    FOOD_ATT_CAP                    = 181,
    FOOD_DEFP                       = 182,
    FOOD_DEF_CAP                    = 183,
    FOOD_ACCP                       = 184,
    FOOD_ACC_CAP                    = 185,
    FOOD_RATTP                      = 186,
    FOOD_RATT_CAP                   = 187,
    FOOD_RACCP                      = 188,
    FOOD_RACC_CAP                   = 189,
    FOOD_MACCP                      =  99,
    FOOD_MACC_CAP                   = 100,
    FOOD_DURATION                   = 937, -- Percentage to increase food duration
    VERMIN_KILLER                   = 224,
    BIRD_KILLER                     = 225,
    AMORPH_KILLER                   = 226,
    LIZARD_KILLER                   = 227,
    AQUAN_KILLER                    = 228,
    PLANTOID_KILLER                 = 229,
    BEAST_KILLER                    = 230,
    UNDEAD_KILLER                   = 231,
    ARCANA_KILLER                   = 232,
    DRAGON_KILLER                   = 233,
    DEMON_KILLER                    = 234,
    EMPTY_KILLER                    = 235,
    HUMANOID_KILLER                 = 236,
    LUMORIAN_KILLER                 = 237,
    LUMINION_KILLER                 = 238,
    SLEEPRES                        = 240, -- Dark based
    POISONRES                       = 241, -- Water based
    PARALYZERES                     = 242, -- Ice based
    BLINDRES                        = 243, -- Dark based
    SILENCERES                      = 244, -- Wind based
    VIRUSRES                        = 245, -- Water based
    PETRIFYRES                      = 246, -- Earth based
    BINDRES                         = 247, -- Ice based
    CURSERES                        = 248, -- Dark based
    GRAVITYRES                      = 249, -- Wind based
    SLOWRES                         = 250, -- Earth based
    STUNRES                         = 251, -- Lightning based
    CHARMRES                        = 252, -- Light based
    AMNESIARES                      = 253, -- Fire based
    LULLABYRES                      = 254, -- Light based
    DEATHRES                        = 255, -- Dark based
    ALLSTATUSRES                    = 958, -- "Resistance to All Status Ailments"
    AFTERMATH                       = 256,
    PARALYZE                        = 257,
    MIJIN_RERAISE                   = 258,
    DUAL_WIELD                      = 259,
    DOUBLE_ATTACK                   = 288,
	DOUBLE_ATTACK_DMG               = 1038, -- Increases "Double Attack" damage/"Double Attack" damage + (in percents, e.g. +20 = +20% damage)
    SUBTLE_BLOW                     = 289,
    SUBTLE_BLOW_II                  = 973, -- Subtle Blow II Effect (Cap 50%) Total Effect (SB + SB_II cap 75%)
    ENF_MAG_POTENCY                 = 290, -- Increases Enfeebling magic potency %
    COUNTER                         = 291,
    KICK_ATTACK_RATE                = 292,
    AFFLATUS_SOLACE                 = 293,
    AFFLATUS_MISERY                 = 294,
    CLEAR_MIND                      = 295,
    CONSERVE_MP                     = 296,
    ENHANCES_SABOTEUR               = 297, -- Increases Saboteur Potency %
    STEAL                           = 298,
    DESPOIL                         = 896, -- Increases THF Despoil chance
    PERFECT_DODGE                   = 883, -- Increases Perfect Dodge duration in seconds
    BLINK                           = 299,
    STONESKIN                       = 300,
    PHALANX                         = 301,
    TRIPLE_ATTACK                   = 302,
	TRIPLE_ATTACK_DMG               = 1039, -- Increases "Triple Attack" damage/"Triple Attack" damage + (in percents, e.g. +20 = +20% damage)
    TREASURE_HUNTER                 = 303,
    TAME                            = 304,
    RECYCLE                         = 305,
    ZANSHIN                         = 306,
    UTSUSEMI                        = 307,
    UTSUSEMI_BONUS                  = 900, -- Extra shadows from gear
    NINJA_TOOL                      = 308,
    BLUE_POINTS                     = 309, -- Tracks extra blue points
    BLUE_LEARN_CHANCE               = 945, -- Additional chance to learn blue magic
    DMG_REFLECT                     = 316,
    ROLL_ROGUES                     = 317,
    ROLL_GALLANTS                   = 318,
    ROLL_CHAOS                      = 319,
    ROLL_BEAST                      = 320,
    ROLL_CHORAL                     = 321,
    ROLL_HUNTERS                    = 322,
    ROLL_SAMURAI                    = 323,
    ROLL_NINJA                      = 324,
    ROLL_DRACHEN                    = 325,
    ROLL_EVOKERS                    = 326,
    ROLL_MAGUS                      = 327,
    ROLL_CORSAIRS                   = 328,
    ROLL_PUPPET                     = 329,
    ROLL_DANCERS                    = 330,
    ROLL_SCHOLARS                   = 331,
    -- Corsair Rolls Level 65+
    ROLL_BOLTERS                    = 869,
    ROLL_CASTERS                    = 870,
    ROLL_COURSERS                   = 871,
    ROLL_BLITZERS                   = 872,
    ROLL_TACTICIANS                 = 873,
    ROLL_ALLIES                     = 874,
    ROLL_MISERS                     = 875,
    ROLL_COMPANIONS                 = 876,
    ROLL_AVENGERS                   = 877,
    ROLL_NATURALISTS                = 878,
    ROLL_RUNEISTS                   = 879,
    BUST                            = 332,
    FINISHING_MOVES                 = 333,
    SAMBA_DURATION                  = 490, -- Samba duration bonus
    WALTZ_POTENTCY                  = 491, -- Waltz Potency Bonus
    JIG_DURATION                    = 492, -- Jig duration bonus in percents
    VFLOURISH_MACC                  = 493, -- Violent Flourish accuracy bonus
    STEP_FINISH                     = 494, -- Bonus finishing moves from steps
    STEP_ACCURACY                   = 403, -- Accuracy bonus for steps
    WALTZ_DELAY                     = 497, -- Waltz Ability Delay modifier (-1 mod is -1 second)
    SAMBA_PDURATION                 = 498, -- Samba percent duration bonus
    WIDESCAN                        = 340,
    BARRAGE_ACC                     = 420,
    ENSPELL                         = 341,
    SPIKES                          = 342,
    ENSPELL_DMG                     = 343,
    ENSPELL_CHANCE                  = 856,
    SPIKES_DMG                      = 344,
    TP_BONUS                        = 345,
    PERPETUATION_REDUCTION          = 346,

    -- Paladin
    ENHANCES_CHIVALRY               = 1061, -- Enhances "Chivalry" effect (increases the base TP modifier by the provided value / 100, e.g. mod value 5 = +0.05)
    ENHANCES_DIVINE_EMBLEM          = 1062, -- Enhances "Divine Emblem" effect/"Divine Emblem" + (increases the ability's special enmity bonus by the provided value)
    ENHANCES_FEALTY                 = 1063, -- Enhances "Fealty" effect (increases Fealty's duration by 4 seconds per Fealty merit)
    ENHANCES_IRON_WILL              = 1064, -- Enhances "Iron Will" effect (adds +3% Fast Cast per Iron Will merit to Rampart)
    ENHANCES_GUARDIAN               = 1065, -- Enhances "Guardian" effect (increases Sentinel's duration by 2 seconds per Guardian merit)
    PALISADE_BLOCK_BONUS            = 1066, -- Increases base block rate while under the effects of Palisade (additive, not multiplicative)
    REPRISAL_BLOCK_BONUS            = 1067, -- Increases block rate while under the effects of Reprisal (multiplicative, not additive)
    REPRISAL_SPIKES_BONUS           = 1068, -- Increases Reprisal spikes damage by percentage (e.g. mod value of 50 will increase spikes damage by 50%)

    -- Dark Knight
    ARCANE_CIRCLE_POTENCY           = 1069, -- Increases the potency of the Arcane Circle effect (e.g. mod value 2 = +2% Arcana Killer)
    SOULEATER_EFFECT_POTENCY        = 1079, -- Enhances "Souleater" effect augment power in percents (Additive and stacks with Enhances "Souleater" effect gear)
    ENHANCES_BLOOD_WEAPON           = 1070, -- Enhances "Blood Weapon" effect (increases Blood Weapon's duration in seconds)
    DARK_MAGIC_CAST                 = 1071, -- Reduces Dark Magic Casting Time by percentage (e.g. mod value -10 = -10% cast time)
    DARK_MAGIC_DURATION             = 1072, -- Increases Dark Magic spell durations by percentage (e.g. mod value 10 = +10% duration)
    ENHANCES_DARK_SEAL              = 1073, -- Enhances "Dark Seal" effect (Increases Dark Magic spell durations by 10% per Dark Seal merit while Dark Seal active)
    ENHANCES_ABSORB_TP              = 1074, -- Enhances "Absorb-TP" effect (Increases TP absorbed by percentage, e.g. mod value 5 = +5% TP absorbed)
    ENHANCES_DIABOLIC_EYE           = 1075, -- Enhances "Diabolic Eye" effect (Increases duration by <value> seconds per merit, e.g. mod value 6 = +6s)
    LAST_RESORT_DURATION            = 1076, -- "Last Resort" effect duration + (Increases duration by <value> seconds, e.g. mod value 15 = +15s)
    ABSORB_DURATION                 = 1077, -- "Absorb" effect duration +% (Increases duration by <value>%, e.g. mod value 10 = +10%)
    ENHANCES_NETHER_VOID            = 1078, -- Enhances "Nether Void" effect (Increases the potency of the next Absorb or Drain Dark Magic by <value>%, e.g. mod value 50 = +50%)
    ENHANCES_MUTED_SOUL             = 1080, -- Enhances "Muted Soul" effect (Adds 3% Zanshin rate per MUTED_SOUL merit level)
    ENHANCES_DESPERATE_BLOWS        = 1081, -- Enhances "Desperate Blows" effect (Adds +3 Subtle Blow per DESPERATE_BLOWS merit level)
    WEAPON_BASH_CHAINBOUND          = 1082, -- Augments "Weapon Bash" (Grants Chainbound status effect similar to Konzen-ittai)

    -- Elemental Affinity: Magic Damage e.g. Magian Trial staves
    -- Value of these mods is multiplied by 0.05 (Adds +5% base magical damage per "tier"/"level")
    -- Mod value 1 = +5% base damage, Mod value 2 = +10% base damage, etc.
    FIRE_AFFINITY_DMG               = 347,
    ICE_AFFINITY_DMG                = 348,
    WIND_AFFINITY_DMG               = 349,
    EARTH_AFFINITY_DMG              = 350,
    THUNDER_AFFINITY_DMG            = 351,
    WATER_AFFINITY_DMG              = 352,
    LIGHT_AFFINITY_DMG              = 353,
    DARK_AFFINITY_DMG               = 354,

    -- Elemental Affinity: Magic Accuracy e.g. Magian Trial staves
    -- Value of these mods is multiplied by 10 (Adds +10 base Magic Accuracy per "tier"/"level")
    -- Mod value 1 = +10 Magic Accuracy, Mod Value 5 = +50 Magic Accuracy, etc.
    FIRE_AFFINITY_ACC               = 544,
    ICE_AFFINITY_ACC                = 545,
    WIND_AFFINITY_ACC               = 546,
    EARTH_AFFINITY_ACC              = 547,
    THUNDER_AFFINITY_ACC            = 548,
    WATER_AFFINITY_ACC              = 549,
    LIGHT_AFFINITY_ACC              = 550,
    DARK_AFFINITY_ACC               = 551,

    -- Elemental Affinity: Avatar Perp. Cost e.g. Magian Trial staves
    -- Value of these mods is added to the PERPETUATION_REDUCTION mod
    -- Mod value -3 = -3 Perpetuation Cost for summons matching the element
    FIRE_AFFINITY_PERP              = 553,
    ICE_AFFINITY_PERP               = 554,
    WIND_AFFINITY_PERP              = 555,
    EARTH_AFFINITY_PERP             = 556,
    THUNDER_AFFINITY_PERP           = 557,
    WATER_AFFINITY_PERP             = 558,
    LIGHT_AFFINITY_PERP             = 559,
    DARK_AFFINITY_PERP              = 560,

    ADDS_WEAPONSKILL                = 355,
    ADDS_WEAPONSKILL_DYN            = 356,
    BP_DELAY                        = 357,
    STEALTH                         = 358,
    RAPID_SHOT                      = 359,
    CHARM_TIME                      = 360,
    JUMP_TP_BONUS                   = 361,
    JUMP_ATT_BONUS                  = 362,
    HIGH_JUMP_ENMITY_REDUCTION      = 363,
    REWARD_HP_BONUS                 = 364,
    SNAP_SHOT                       = 365,
    MAIN_DMG_RATING                 = 366,
    SUB_DMG_RATING                  = 367,
    REGAIN                          = 368,
    REFRESH                         = 369,
    REGEN                           = 370,
    AVATAR_PERPETUATION             = 371,
    WEATHER_REDUCTION               = 372,
    DAY_REDUCTION                   = 373,
    CURE_POTENCY                    = 374,
    CURE_POTENCY_II                 = 260, -- % cure potency II | bonus from gear is capped at 30
    CURE_POTENCY_RCVD               = 375,
    RANGED_DMG_RATING               = 376,
    DELAYP                          = 380,
    RANGED_DELAYP                   = 381,
    EXP_BONUS                       = 382,
    HASTE_ABILITY                   = 383,
    HASTE_GEAR                      = 384,
    SHIELD_BASH                     = 385,
    KICK_DMG                        = 386,
    CHARM_CHANCE                    = 391,
    WEAPON_BASH                     = 392,
    BLACK_MAGIC_COST                = 393,
    WHITE_MAGIC_COST                = 394,
    BLACK_MAGIC_CAST                = 395,
    WHITE_MAGIC_CAST                = 396,
    BLACK_MAGIC_RECAST              = 397,
    WHITE_MAGIC_RECAST              = 398,
    ALACRITY_CELERITY_EFFECT        = 399,
    LIGHT_ARTS_EFFECT               = 334,
    DARK_ARTS_EFFECT                = 335,
    LIGHT_ARTS_SKILL                = 336,
    DARK_ARTS_SKILL                 = 337,
    LIGHT_ARTS_REGEN                = 338, -- Regen bonus HP from Light Arts and Tabula Rasa
    REGEN_DURATION                  = 339,
    HELIX_EFFECT                    = 478,
    HELIX_DURATION                  = 477,
    STORMSURGE_EFFECT               = 400,
    SUBLIMATION_BONUS               = 401,
    GRIMOIRE_SPELLCASTING           = 489, -- "Grimoire: Reduces spellcasting time" bonus
    WYVERN_BREATH                   = 402,
    REGEN_DOWN                      = 404, -- poison
    REFRESH_DOWN                    = 405, -- plague, reduce mp
    REGAIN_DOWN                     = 406, -- plague, reduce tp
    MAGIC_DAMAGE                    = 311, --  Magic damage added directly to the spell's base damage

    -- Gear set modifiers
    DA_DOUBLE_DAMAGE                = 408, -- Double attack's double damage chance %.
    TA_TRIPLE_DAMAGE                = 409, -- Triple attack's triple damage chance %.
    ZANSHIN_DOUBLE_DAMAGE           = 410, -- Zanshin's double damage chance %.
    RAPID_SHOT_DOUBLE_DAMAGE        = 479, -- Rapid shot's double damage chance %.
    ABSORB_DMG_CHANCE               = 480, -- Chance to absorb damage %
    EXTRA_DUAL_WIELD_ATTACK         = 481, -- Chance to land an extra attack when dual wielding
    EXTRA_KICK_ATTACK               = 482, -- Occasionally allows a second Kick Attack during an attack round without the use of Footwork.
    SAMBA_DOUBLE_DAMAGE             = 415, -- Double damage chance when samba is up.
    NULL_PHYSICAL_DAMAGE            = 416, -- Occasionally annuls damage from physical attacks, in percents
    QUICK_DRAW_TRIPLE_DAMAGE        = 417, -- Chance to do triple damage with quick draw.
    BAR_ELEMENT_NULL_CHANCE         = 418, -- Bar Elemental spells will occasionally nullify damage of the same element.
    GRIMOIRE_INSTANT_CAST           = 419, -- Spells that match your current Arts will occasionally cast instantly, without recast.
    COUNTERSTANCE_EFFECT            = 543, -- Counterstance effect in percents
    DODGE_EFFECT                    = 552, -- Dodge effect in percents
    FOCUS_EFFECT                    = 561, -- Focus effect in percents
	ENH_ELEMENTAL_SEAL              = 756, -- Adds a Magic Damage bonus to Elemental Seal
    MUG_EFFECT                      = 835, -- Mug effect as multiplier
    ACC_COLLAB_EFFECT               = 884, -- Increases amount of enmity transferred
    HIDE_DURATION                   = 885, -- Hide duration increase (percentage based
    GILFINDER                       = 897, -- Gil % increase
    REVERSE_FLOURISH_EFFECT         = 836, -- Reverse Flourish effect in tenths of squared term multiplier
    SENTINEL_EFFECT                 = 837, -- Sentinel effect in percents
    REGEN_MULTIPLIER                = 838, -- Regen base multiplier

    DOUBLE_SHOT_RATE                = 422, -- The rate that double shot can proc
    VELOCITY_SNAPSHOT_BONUS         = 423, -- Increases Snapshot whilst Velocity Shot is up.
    VELOCITY_RATT_BONUS             = 424, -- Increases Ranged Attack whilst Velocity Shot is up.
    SHADOW_BIND_EXT                 = 425, -- Extends the time of shadowbind
    ABSORB_PHYSDMG_TO_MP            = 426, -- Absorbs a percentage of physical damage taken to MP.
    SHIELD_MASTERY_TP               = 485, -- Shield mastery TP bonus when blocking with a shield
    PERFECT_COUNTER_ATT             = 428, -- Raises weapon damage when countering while under the Perfect Counter effects. This also affects Weapon Rank (though not if fighting barehanded).
    FOOTWORK_ATT_BONUS              = 429, -- Raises the attack bonus of Footwork. (Tantra Gaiters +2 raise 100/1024 to 152/1024)

    MINNE_EFFECT                    = 433, --
    MINUET_EFFECT                   = 434, --
    PAEON_EFFECT                    = 435, --
    REQUIEM_EFFECT                  = 436, --
    THRENODY_EFFECT                 = 437, --
    MADRIGAL_EFFECT                 = 438, --
    MAMBO_EFFECT                    = 439, --
    LULLABY_EFFECT                  = 440, --
    ETUDE_EFFECT                    = 441, --
    BALLAD_EFFECT                   = 442, --
    MARCH_EFFECT                    = 443, --
    FINALE_EFFECT                   = 444, --
    CAROL_EFFECT                    = 445, --
    MAZURKA_EFFECT                  = 446, --
    ELEGY_EFFECT                    = 447, --
    PRELUDE_EFFECT                  = 448, --
    HYMNUS_EFFECT                   = 449, --
    VIRELAI_EFFECT                  = 450, --
    SCHERZO_EFFECT                  = 451, --
    ALL_SONGS_EFFECT                = 452, --
    MAXIMUM_SONGS_BONUS             = 453, --
    SONG_DURATION_BONUS             = 454, --
    SONG_SPELLCASTING_TIME          = 455, --

    QUICK_DRAW_DMG                  = 411, --
    QUICK_DRAW_MACC                 = 191, -- Quick draw magic accuracy
    QUAD_ATTACK                     = 430, -- Quadruple attack chance.

    ENSPELL_DMG_BONUS               = 432,

    FIRE_ABSORB                     = 459, -- Occasionally absorbs fire elemental damage, in percents
    ICE_ABSORB                      = 460, -- Occasionally absorbs ice elemental damage, in percents
    WIND_ABSORB                     = 461, -- Occasionally absorbs wind elemental damage, in percents
    EARTH_ABSORB                    = 462, -- Occasionally absorbs earth elemental damage, in percents
    LTNG_ABSORB                     = 463, -- Occasionally absorbs thunder elemental damage, in percents
    WATER_ABSORB                    = 464, -- Occasionally absorbs water elemental damage, in percents
    LIGHT_ABSORB                    = 465, -- Occasionally absorbs light elemental damage, in percents
    DARK_ABSORB                     = 466, -- Occasionally absorbs dark elemental damage, in percents

    FIRE_NULL                       = 467, --
    ICE_NULL                        = 468, --
    WIND_NULL                       = 469, --
    EARTH_NULL                      = 470, --
    LTNG_NULL                       = 471, --
    WATER_NULL                      = 472, --
    LIGHT_NULL                      = 473, --
    DARK_NULL                       = 474, --

    MAGIC_ABSORB                    = 475, -- Occasionally absorbs magic damage taken, in percents
    MAGIC_NULL                      = 476, -- Occasionally annuls magic damage taken, in percents
    PHYS_ABSORB                     = 512, -- Occasionally absorbs physical damage taken, in percents
    ABSORB_DMG_TO_MP                = 516, -- Unlike PLD gear mod, works on all damage types (Ethereal Earring)

    WARCRY_DURATION                 = 483, -- Warcy duration bonus from gear
    AUSPICE_EFFECT                  = 484, -- Auspice Subtle Blow Bonus
    TACTICAL_PARRY                  = 486, -- Tactical Parry TP Bonus
    MAG_BURST_BONUS                 = 487, -- Magic Burst Bonus
    INHIBIT_TP                      = 488, -- Inhibits TP Gain (percent)

    GOV_CLEARS                      = 496, -- Tracks GoV page completion (for 4% bonus on rewards).

    -- Reraise (Auto Reraise, will be used by ATMA)
    RERAISE_I                       = 456, -- Reraise.
    RERAISE_II                      = 457, -- Reraise II.
    RERAISE_III                     = 458, -- Reraise III.

    ADDITIONAL_EFFECT               = 431, -- All additional effects
    ITEM_SPIKES_TYPE                = 499, -- Type spikes an item has
    ITEM_SPIKES_DMG                 = 500, -- Damage of an items spikes
    ITEM_SPIKES_CHANCE              = 501, -- Chance of an items spike proc
    -- ITEM_ADDEFFECT_TYPE     = 431, -- 1 = Status Effect/DMG/HP Drain, 2 = MP Drain, 3 = TP Drain, 4 = Dispel, 5 = Self-Buff, 6 = Instant Death
    -- ITEM_SUBEFFECT          = 499, -- Animation ID of Spikes and Additional Effects
    -- ITEM_ADDEFFECT_DMG      = 500, -- Damage of an items Additional Effect or Spikes
    -- ITEM_ADDEFFECT_CHANCE   = 501, -- Chance of an items Additional Effect or Spikes
    -- ITEM_ADDEFFECT_ELEMENT  = 950, -- Element of the Additional Effect or Spikes, for resist purposes
    -- ITEM_ADDEFFECT_STATUS   = 951, -- Status Effect ID to try to apply via Additional Effect or Spikes
    -- ITEM_ADDEFFECT_POWER    = 952, -- Base Power for effect in MOD_ITEM_ADDEFFECT_STATUS
    -- ITEM_ADDEFFECT_DURATION = 953, -- Base Duration for effect in MOD_ITEM_ADDEFFECT_STATUS

    FERAL_HOWL_DURATION             = 503, -- +20% duration per merit when wearing augmented Monster Jackcoat +2
    MANEUVER_BONUS                  = 504, -- Maneuver Stat Bonus
    OVERLOAD_THRESH                 = 505, -- Overload Threshold Bonus
    BURDEN_DECAY                    = 847, -- Increases amount of burden removed per tick
    REPAIR_EFFECT                   = 853, -- Removes # of status effects from the Automaton
    REPAIR_POTENCY                  = 854, -- Note: Only affects amount regenerated by a %, not the instant restore!
    PREVENT_OVERLOAD                = 855, -- Overloading erases a water maneuver (except on water overloads) instead, if there is one
    EXTRA_DMG_CHANCE                = 506, -- Proc rate of OCC_DO_EXTRA_DMG. 111 would be 11.1%
    OCC_DO_EXTRA_DMG                = 507, -- Multiplier for "Occasionally do x times normal damage". 250 would be 2.5 times damage.

    REM_OCC_DO_DOUBLE_DMG           = 863, -- Proc rate for REM Aftermaths that apply "Occasionally do double damage"
    REM_OCC_DO_TRIPLE_DMG           = 864, -- Proc rate for REM Aftermaths that apply "Occasionally do triple damage"

    REM_OCC_DO_DOUBLE_DMG_RANGED    = 867, -- Ranged attack specific
    REM_OCC_DO_TRIPLE_DMG_RANGED    = 868, -- Ranged attack specific

    MYTHIC_OCC_ATT_TWICE            = 865, -- Proc rate for "Occasionally attacks twice"
    MYTHIC_OCC_ATT_THRICE           = 866, -- Proc rate for "Occasionally attacks thrice"

    EAT_RAW_FISH                    = 412, --
    EAT_RAW_MEAT                    = 413, --

    ENHANCES_CURSNA_RCVD            = 67,  -- Potency of "Cursna" effects received
    ENHANCES_CURSNA                 = 310, -- Raises success rate of Cursna when removing effect (like Doom) that are not 100% chance to remove
    ENHANCES_HOLYWATER              = 495, -- Used by gear with the "Enhances Holy Water" or "Holy Water+" attribute
	ENHANCES_PROT_SHELL_RCVD        = 977, -- Enhances Protect and Shell Effects Received (Binary MOD)

    RETALIATION                     = 414, -- Increases damage of Retaliation hits
    THIRD_EYE_COUNTER_RATE          = 508, -- Adds counter to 3rd eye anticipates & if using Seigan counter rate is increased by 15%
    THIRD_EYE_ANTICIPATE_RATE       = 839, -- Adds anticipate rate in percents

    CLAMMING_IMPROVED_RESULTS       = 509, --
    CLAMMING_REDUCED_INCIDENTS      = 510, --
    CHOCOBO_RIDING_TIME             = 511, -- Increases chocobo riding time
    HARVESTING_RESULT               = 513, -- Improves harvesting results
    LOGGING_RESULT                  = 514, -- Improves logging results
    MINING_RESULT                   = 515, -- Improves mining results
    EGGHELM                         = 517, -- Egg Helm (Chocobo Digging)

    SHIELDBLOCKRATE                 = 518, -- Affects shield block rate, percent based
    SCAVENGE_EFFECT                 = 312, --
    DIA_DOT                         = 313, -- Increases the DoT damage of Dia
    SHARPSHOT                       = 314, -- Sharpshot accuracy bonus
    ENH_DRAIN_ASPIR                 = 315, -- % damage boost to Drain and Aspir
    SNEAK_ATK_DEX                   = 874, -- % DEX boost to Sneak Attack (if gear mod, needs to be equipped on hit)
    TRICK_ATK_AGI                   = 520, -- % AGI boost to Trick Attack (if gear mod, needs to be equipped on hit)
    NIN_NUKE_BONUS                  = 522, -- magic attack bonus for NIN nukes
    DAKEN                           = 911, -- Chance to throw shuriken on attack
    AMMO_SWING                      = 523, -- Extra swing rate w/ ammo (ie. Jailer weapons). Use gearsets, and does nothing for non-players.
    AMMO_SWING_TYPE                 = 826, -- For the handedness of the weapon - 1h (1) vs. 2h/h2h (2). h2h can safely use the same function as 2h.
    ROLL_RANGE                      = 528, -- Additional range for COR roll abilities.
    PHANTOM_ROLL_PLUS               = 881, -- Phantom Roll+ Effect from SOA Rings.
    PHANTOM_DURATION                = 882, -- Phantom Roll Duration +.

    ENHANCES_REFRESH                = 529, -- "Enhances Refresh" adds +1 per modifier to spell's tick result.
    NO_SPELL_MP_DEPLETION           = 530, -- % to not deplete MP on spellcast.
    FORCE_FIRE_DWBONUS              = 531, -- Set to 1 to force fire day/weather spell bonus/penalty. Do not have it total more than 1.
    FORCE_ICE_DWBONUS               = 532, -- Set to 1 to force ice day/weather spell bonus/penalty. Do not have it total more than 1.
    FORCE_WIND_DWBONUS              = 533, -- Set to 1 to force wind day/weather spell bonus/penalty. Do not have it total more than 1.
    FORCE_EARTH_DWBONUS             = 534, -- Set to 1 to force earth day/weather spell bonus/penalty. Do not have it total more than 1.
    FORCE_LIGHTNING_DWBONUS         = 535, -- Set to 1 to force lightning day/weather spell bonus/penalty. Do not have it total more than 1.
    FORCE_WATER_DWBONUS             = 536, -- Set to 1 to force water day/weather spell bonus/penalty. Do not have it total more than 1.
    FORCE_LIGHT_DWBONUS             = 537, -- Set to 1 to force light day/weather spell bonus/penalty. Do not have it total more than 1.
    FORCE_DARK_DWBONUS              = 538, -- Set to 1 to force dark day/weather spell bonus/penalty. Do not have it total more than 1.
    STONESKIN_BONUS_HP              = 539, -- Bonus "HP" granted to Stoneskin spell.
    ENHANCES_ELEMENTAL_SIPHON       = 540, -- Bonus Base MP added to Elemental Siphon skill.
    BP_DELAY_II                     = 541, -- Blood Pact Delay Reduction II
    JOB_BONUS_CHANCE                = 542, -- "Phantom Roll" effects + Gear (chance to apply job bonus to Phantom Roll without having the job in the party.)
    DAY_NUKE_BONUS                  = 565, -- Bonus damage from "Elemental magic affected by day" (Sorc. Tonban)
    IRIDESCENCE                     = 566, -- Iridescence trait (additional weather damage/penalty)
    BARSPELL_AMOUNT                 = 567, -- Additional elemental resistance granted by bar- spells
    BARSPELL_MDEF_BONUS             = 827, -- Extra magic defense bonus granted to the bar- spell effect
    RAPTURE_AMOUNT                  = 568, -- Bonus amount added to Rapture effect
    EBULLIENCE_AMOUNT               = 569, -- Bonus amount added to Ebullience effect
    WYVERN_EFFECTIVE_BREATH         = 829, -- Increases the threshold for triggering healing breath
    AQUAVEIL_COUNT                  = 832, -- Modifies the amount of hits that Aquaveil absorbs before being removed
    SONG_RECAST_DELAY               = 833, -- Reduces song recast time in seconds.
    ENH_MAGIC_DURATION              = 890, -- Enhancing Magic Duration increase %
    ENHANCES_COURSERS_ROLL          = 891, -- Courser's Roll Bonus % chance
    ENHANCES_CASTERS_ROLL           = 892, -- Caster's Roll Bonus % chance
    ENHANCES_BLITZERS_ROLL          = 893, -- Blitzer's Roll Bonus % chance
    ENHANCES_ALLIES_ROLL            = 894, -- Allies' Roll Bonus % chance
    ENHANCES_TACTICIANS_ROLL        = 895, -- Tactician's Roll Bonus % chance
    OCCULT_ACUMEN                   = 902, -- Grants bonus TP when dealing damage with elemental or dark magic

    QUICK_MAGIC                     = 909, -- Percent chance spells cast instantly (also reduces recast to 0, similar to Chainspell)

    -- Automaton mods
    AUTO_DECISION_DELAY             = 842, -- Reduces the Automaton's global decision delay
    AUTO_SHIELD_BASH_DELAY          = 843, -- Reduces the Automaton's global shield bash delay
    AUTO_MAGIC_DELAY                = 844, -- Reduces the Automaton's global magic delay
    AUTO_HEALING_DELAY              = 845, -- Reduces the Automaton's global healing delay
    AUTO_HEALING_THRESHOLD          = 846, -- Increases the healing trigger threshold
    AUTO_SHIELD_BASH_SLOW           = 848, -- Adds a slow effect to Shield Bash
    AUTO_TP_EFFICIENCY              = 849, -- Causes the Automaton to wait to form a skillchain when its master is > 90% TP
    AUTO_SCAN_RESISTS               = 850, -- Causes the Automaton to scan a target's resistances
    AUTO_STEAM_JACKET               = 938, -- Causes the Automaton to mitigate damage from successive attacks of the same type
    AUTO_STEAM_JACKED_REDUCTION     = 939, -- Amount of damage reduced with Steam Jacket
    AUTO_SCHURZEN                   = 940, -- Prevents fatal damage leaving the automaton at 1HP and consumes an Earth manuever
    AUTO_EQUALIZER                  = 941, -- Reduces damage received according to damage taken
    AUTO_PERFORMANCE_BOOST          = 942, -- Increases the performance of other attachments by a percentage
    AUTO_ANALYZER                   = 943, -- Causes the Automaton to mitigate damage from a special attack a number of times

    -- Mythic Weapon Mods
    AUGMENTS_ABSORB                 = 521, -- Direct Absorb spell increase while Liberator is equipped (percentage based)
    AOE_NA                          = 524, -- Set to 1 to make -na spells/erase always AoE w/ Divine Veil
    AUGMENTS_CONVERT                = 525, -- Convert HP to MP Ratio Multiplier. Value = MP multiplier rate.
    AUGMENTS_SA                     = 526, -- Adds Critical Attack Bonus to Sneak Attack, percentage based.
    AUGMENTS_TA                     = 527, -- Adds Critical Attack Bonus to Trick Attack, percentage based.
    AUGMENTS_FEINT                  = 873, -- Feint will give another -10 Evasion per merit level
    AUGMENTS_ASSASSINS_CHARGE       = 886, -- Gives Assassin's Charge +1% Critical Hit Rate per merit level
    AUGMENTS_AMBUSH                 = 887, -- Gives +1% Triple Attack per merit level when Ambush conditions are met
    AUGMENTS_AURA_STEAL             = 889, -- 20% chance of 2 effects to be dispelled or stolen per merit level
    AUGMENTS_CONSPIRATOR            = 912, -- Adds an attack bonus to Conspirator
    JUG_LEVEL_RANGE                 = 564, -- Decreases the level range of spawned jug pets. Maxes out at 2.
    FORCE_JUMP_CRIT                 = 828, -- Critical hit rate bonus for jump and high jump
    QUICK_DRAW_DMG_PERCENT          = 834, -- Percentage increase to QD damage

    -- Crafting food effects
    SYNTH_SUCCESS                   = 851, -- Rate of synthesis success
    SYNTH_SKILL_GAIN                = 852, -- Synthesis skill gain rate
    SYNTH_FAIL_RATE                 = 861, -- Synthesis failure rate (percent)
    SYNTH_HQ_RATE                   = 862, -- High-quality success rate (not a percent)
    DESYNTH_SUCCESS                 = 916, -- Rate of desynthesis success
    SYNTH_FAIL_RATE_FIRE            = 917, -- Amount synthesis failure rate is reduced when using a fire crystal
    SYNTH_FAIL_RATE_ICE             = 918, -- Amount synthesis failure rate is reduced when using a ice crystal
    SYNTH_FAIL_RATE_WIND            = 919, -- Amount synthesis failure rate is reduced when using a wind crystal
    SYNTH_FAIL_RATE_EARTH           = 920, -- Amount synthesis failure rate is reduced when using a earth crystal
    SYNTH_FAIL_RATE_LIGHTNING       = 921, -- Amount synthesis failure rate is reduced when using a lightning crystal
    SYNTH_FAIL_RATE_WATER           = 922, -- Amount synthesis failure rate is reduced when using a water crystal
    SYNTH_FAIL_RATE_LIGHT           = 923, -- Amount synthesis failure rate is reduced when using a light crystal
    SYNTH_FAIL_RATE_DARK            = 924, -- Amount synthesis failure rate is reduced when using a dark crystal
    SYNTH_FAIL_RATE_WOOD            = 925, -- Amount synthesis failure rate is reduced when doing woodworking
    SYNTH_FAIL_RATE_SMITH           = 926, -- Amount synthesis failure rate is reduced when doing smithing
    SYNTH_FAIL_RATE_GOLDSMITH       = 927, -- Amount synthesis failure rate is reduced when doing goldsmithing
    SYNTH_FAIL_RATE_CLOTH           = 928, -- Amount synthesis failure rate is reduced when doing clothcraft
    SYNTH_FAIL_RATE_LEATHER         = 929, -- Amount synthesis failure rate is reduced when doing leathercraft
    SYNTH_FAIL_RATE_BONE            = 930, -- Amount synthesis failure rate is reduced when doing bonecraft
    SYNTH_FAIL_RATE_ALCHEMY         = 931, -- Amount synthesis failure rate is reduced when doing alchemy
    SYNTH_FAIL_RATE_COOK            = 932, -- Amount synthesis failure rate is reduced when doing cooking

    WEAPONSKILL_DAMAGE_BASE         = 570, -- Specific to 1 Weaponskill: See modifier.h for how this is used
    ALL_WSDMG_ALL_HITS              = 840, -- Generic (all Weaponskills) damage, on all hits.
    -- Per https://www.bg-wiki.com/bg/Weapon_Skill_Damage we need all 3..
    ALL_WSDMG_FIRST_HIT             = 841, -- Generic (all Weaponskills) damage, first hit only.
    WS_NO_DEPLETE                   = 949, -- % chance a Weaponskill depletes no TP.
	WS_STR_BONUS                    = 980, -- % bonus to str_wsc.
    WS_DEX_BONUS                    = 957, -- % bonus to dex_wsc.
	WS_VIT_BONUS                    = 981, -- % bonus to vit_wsc.
	WS_AGI_BONUS                    = 982, -- % bonus to agi_wsc.
	WS_INT_BONUS                    = 983, -- % bonus to int_wsc.
	WS_MND_BONUS                    = 984, -- % bonus to mnd_wsc.
	WS_CHR_BONUS                    = 985, -- % bonus to chr_wsc.

    -- Circle Abilities Extended Duration from AF/AF+1
    HOLY_CIRCLE_DURATION            = 857,
    ARCANE_CIRCLE_DURATION          = 858,
    ANCIENT_CIRCLE_DURATION         = 859,

    -- Other
    CURE2MP_PERCENT                 = 860, -- Converts % of "Cure" amount to MP
    DIVINE_BENISON                  = 910, -- Adds fast cast and enmity reduction to -Na spells (includes Erase). Enmity reduction is half of the fast cast amount
    SAVETP                          = 880, -- SAVETP Effect for Miser's Roll / ATMA / Hagakure.
	CONSERVE_TP                     = 944, -- Conserve TP trait, random chance between 10 and 200 TP
    SMITE                           = 898, -- Att increase with H2H or 2H weapons
    TACTICAL_GUARD                  = 899, -- Tp gain increase when guarding
    GUARD_PERCENT                   = 976, -- Guard Percent
    FENCER_TP_BONUS                 = 903, -- TP Bonus to weapon skills from Fencer Trait
    FENCER_CRITHITRATE              = 904, -- Increased Crit chance from Fencer Trait
    SHIELD_DEF_BONUS                = 905, -- Shield Defense Bonus
	BLOOD_BOON                      = 913, -- Occasionally cuts down MP cost of Blood Pact abilities. Does not affect abilities that require Astral Flow.
    SNEAK_DURATION                  = 946, -- Additional duration in seconds
    INVISIBLE_DURATION              = 947, -- Additional duration in seconds
    BERSERK_EFFECT                  = 948, -- Conqueror Berserk Effect
    BERSERK_DURATION                = 954, -- Berserk Duration
    AGGRESSOR_DURATION              = 955, -- Aggressor Duration
    DEFENDER_DURATION               = 956, -- Defender Duration
    CARDINAL_CHANT                  = 959,
    INDI_DURATION                   = 960,
    GEOMANCY                        = 961, -- Geomancy Skill
	HANDBELL                        = 962, -- Handbell Skill
	WIDENED_COMPASS                 = 963,
    MENDING_HALATION                = 968,
    RADIAL_ARCANA                   = 969,
    CURATIVE_RECANTATION            = 970,
    PRIMEVAL_ZEAL                   = 971,
    COVER_TO_MP                     = 965, -- Converts a successful cover's phsyical damage to MP
    COVER_MAGIC_AND_RANGED          = 966, -- Redirects ranged and single target magic attacks to the cover ability user
    COVER_DURATION                  = 967, -- Increases Cover Duration
    WYVERN_SUBJOB_TRAITS            = 974, -- Adds subjob traits to wyvern
    GARDENING_WILT_BONUS            = 975, -- Increases the number of Vanadays a plant can survive before it wilts

    -- The spares take care of finding the next ID to use so long as we don't forget to list IDs that have been freed up by refactoring.
    -- 570 - 825 used by WS DMG mods these are not spares.

	-- Caldera custom Mod IDs
    IGNORE_MANA_WALL                = 1800, -- Attacks ignore Mana Wall effect when this value is greater than 0
    AURA_RADIUS_BONUS               = 1801, -- Increases the base radius distance (6.5y) by <value> / 10 (i.e. mod value 55 = +5.5y radius)
    RAYKE_FIRE                      = 1802, -- Tracks Fire elemental reduction from Rayke
    RAYKE_ICE                       = 1803, -- Tracks Ice elemental reduction from Rayke
    RAYKE_WIND                      = 1804, -- Tracks Wind elemental reduction from Rayke
    RAYKE_EARTH                     = 1805, -- Tracks Earth elemental reduction from Rayke
    RAYKE_LIGHTNING                 = 1806, -- Tracks Lightning elemental reduction from Rayke
    RAYKE_WATER                     = 1807, -- Tracks Water elemental reduction from Rayke
    RAYKE_LIGHT                     = 1808, -- Tracks Light elemental reduction from Rayke
    RAYKE_DARK                      = 1809, -- Tracks Dark elemental reduction from Rayke
    ANULLS_DAMAGE_TAKEN             = 1810, -- Physical and magical damage anullment +<value>%

	FOOD_EVAP                       = 1901, -- Evasion +% from food
	FOOD_EVAP_CAP                   = 1902, -- Evasion +% cap from food
	FOOD_MEVAP                      = 1903, -- Magic Evasion +% from food
	FOOD_MEVAP_CAP                  = 1904, -- Magic Evasion +% cap from food
	TRAIT_MAG_BURST_BONUS           = 1905, -- Magic Burst Bonus Job Traits have to be a separate mod for calculation purposes
	ENSPELL_STAT_BONUS              = 1906, -- Adds +ACC/ATK/MACC while under the effect of an en- spell
	MEVA_II							= 1907, -- Adds Magic Evasion II
    ENDARK_DMG_BONUS                = 1908, -- Adds a <value> bonus to base Endark damage
	
	FRONTAL_DMG_REDUCTION           = 2000, -- Monster ignores DMG/DMGPHYS/DMGRANGE calculation and applies a direct reduction when taking damage from the front
	REAR_DMG_REDUCTION              = 2001, -- Monster ignores DMG/DMGPHYS/DMGRANGE calculation and applies a direct reduction when taking damage from the rear
	SIDE_DMG_REDUCTION              = 2002, -- Monster ignores DMG/DMGPHYS/DMGRANGE calculation and applies a direct reduction when taking damage from the side
	IMMUNITY_SLEEP                  = 2003, -- Tracks how much sleep resistance is accumulated from multiple castings of sleep on the target before Immunobreak triggers
	IMMUNITY_POISON                 = 2004, -- Tracks how much poison resistance is accumulated from multiple castings of poison on the target before Immunobreak triggers
	IMMUNITY_PARALYZE               = 2005, -- Tracks how much paralyze resistance is accumulated from multiple castings of paralyze on the target before Immunobreak triggers
	IMMUNITY_BLIND                  = 2006, -- Tracks how much blind resistance is accumulated from multiple castings of blind on the target before Immunobreak triggers
	IMMUNITY_SILENCE                = 2007, -- Tracks how much silence resistance is accumulated from multiple castings of silence on the target before Immunobreak triggers
	IMMUNITY_VIRUS                  = 2008, -- Tracks how much virus resistance is accumulated from multiple castings of virus on the target before Immunobreak triggers
	IMMUNITY_PETRIFY                = 2009, -- Tracks how much petrify resistance is accumulated from multiple castings of petrify on the target before Immunobreak triggers
	IMMUNITY_BIND                   = 2010, -- Tracks how much bind resistance is accumulated from multiple castings of bind on the target before Immunobreak triggers
	IMMUNITY_CURSE                  = 2011, -- Tracks how much curse resistance is accumulated from multiple castings of curse on the target before Immunobreak triggers
	IMMUNITY_GRAVITY                = 2012, -- Tracks how much gravity resistance is accumulated from multiple castings of gravity on the target before Immunobreak triggers
	IMMUNITY_SLOW                   = 2013, -- Tracks how much slow resistance is accumulated from multiple castings of slow on the target before Immunobreak triggers
	IMMUNITY_STUN                   = 2014, -- Tracks how much stun resistance is accumulated from multiple castings of stun on the target before Immunobreak triggers
	IMMUNITY_CHARM                  = 2015, -- Tracks how much charm resistance is accumulated from multiple castings of charm on the target before Immunobreak triggers
	IMMUNITY_AMNESIA                = 2016, -- Tracks how much amnesia resistance is accumulated from multiple castings of amnesia on the target before Immunobreak triggers
	IMMUNITY_LULLABY                = 2017, -- Tracks how much lullaby resistance is accumulated from multiple castings of lullaby on the target before Immunobreak triggers
	IMMUNITY_DEATH                  = 2018, -- Tracks how much death resistance is accumulated from multiple castings of death on the target before Immunobreak triggers
	IMMUNITY_TERROR                 = 2019, -- Tracks how much terror resistance is accumulated from multiple castings of terror on the target before Immunobreak triggers
	MAGIC_SHIELD                    = 2020, -- Tracks remaining magical damage before wearing off
	
	ENEMY_TP_ACCUM                  = 2800, -- Reduces enemy TP accumulation by % when player takes physical damage
	WALTZ_POTENCY_RCVD              = 2801, -- Increases the potency of Waltz's received
	CONVERT_DMG_TO_TP               = 2803, -- Converts damage taken to TP
	TANDEM_STRIKE                   = 2804, -- Grants a bonus to your and your pet's accuracy and magic accuracy when you and your pet are attacking the same target.
	TANDEM_BLOW                     = 2805, -- Reduces amount of TP gained by enemies when striking them if you and your pet are attacking the same target.
	THIRD_EYE_COUNTER_DMG           = 2806, -- Increases the damage dealt during a Third Eye counter
	CARBUNCLE_ILVL                  = 2807, -- Increases Carbuncle's level when summoned
	CAIT_SITH_ILVL                  = 2808, -- Increases Cait Sith's level when summoned
	HALVE_CARBUNCLE_PERP            = 2809, -- Halves Carbuncle's Perpetuation cost
	REDUCE_KNOCKBACK                = 2810, -- Reduces the strength of knockback effects
	PARRY_RECOVER_HP                = 2811, -- Player recovers HP when parrying attacks
	ZANSHIN_DOUBLE_ATTACK           = 2812, -- Allows Zanshin to occasionally Double Attack
	AUTOMATON_ELE_CAPACITY          = 2813, -- Increases Automaton Attachment Elemental Capacity
	REFRESH_DURATION_RCVD           = 2814, -- Increases the duration of Refresh effects received
	STONESKIN_CAST                  = 2815, -- Reduces the cast time of "Stoneskin"
	GEO_NO_SPELL_MP_DEPLETION       = 2816, -- % to not deplete MP on Geomancy spellcast
	ABSORB_EFFECT_DURATION          = 2818, -- Increases "Absorb" spell durations
	ALL_JUMPS_DOUBLE_ATTACK         = 2819, -- Adds % chance to Double Attack to Jump, High Jump, Spirit Jump, and Soul Jump
	LIFE_CYCLE_HP                   = 2820, -- Adds % to HP restored by Life Cycle
	ENH_CARDINAL_CHANT              = 2821, -- Adds % bonus to Cardinal Chant effect
	COVER_DT                        = 2822, -- Adds -% Damage Taken while using Cover (Mod value is %DT; -12 = -12% DT, 12 = +12% DT)
	ENMITY_MITIGATES_DMG            = 2823, -- Adds -% Damage Taken based on current Enmity (CE + VE)
	ENMITY_MITIGATES_DMG_DT         = 2824, -- Handles the amount of -% Damage Taken provided by ENMITY_MITIGATES_DMG
	CONVERT_ELEM_DMG_MP             = 2825, -- Converts % of elemental magic damage dealt to MP
	MAGIC_BURST_ACC                 = 2826, -- Adds value to magic burst ACC bonus
	ENSPELL_DURATION_BONUS          = 2827, -- Increases the duration of Enspells
	ENLIGHT_DMG                     = 2828, -- Increases the damage of Enlight
	TERRORRES                       = 2829, -- Increases resistance to Terror
	COUNTER_ATT_VARIES              = 2830, -- Attack during "Counter" varies in proportion to Attack of target (Jolt Counters) (Value of 1 means this effect is active)
	INSPIRATION_FASTCAST            = 2831, -- Adds "Fast Cast" when under the effects of Vallation or Valiance (Exceeds the normal 40% "Fast Cast" cap)
    TRUSTS_INCREASE_ATK             = 2832, -- Attack increases with number of alter egos in party (Mod value is per trust in party, e.g. 10 = +10 ATK per trust)
    CONSUME_MP_FOR_FOLLOWUP_MELEE   = 2833, -- SU3 Melee Weapon "Consumes 5% of MP during a regular attack: Offers a chance of follow-up attack +1 based on amount of MP consumed"
    CONSUME_MP_FOR_FOLLOWUP_RANGED  = 2834, -- SU3 Ranged Weapon "Consumes 5% of MP during a ranged attack: Offers a chance of follow-up attack +1 based on amount of MP consumed"
    CONSUME_MP_DURING_RANGED_ATK    = 2835, -- SU3 Ammunition "Consumes 2% of MP during a ranged attack: Ranged Attack+ Ranged Accuracy+"
    CONSUME_MP_RATT_RACC_BONUS      = 2836, -- Tracks the Ranged Attack/Accuracy bonuses generated by a CONSUME_MP_DURING_RANGED_ATK proc (DO NOT ASSIGN THIS MOD TO ITEMS)
    CONSUME_MP_STP_SINGLE_ATK       = 2837, -- SU3 HQ Weapon "Consumes 5% of MP during a regular attack: "Store TP"+ for a single attack"
    CURE_POTENCY_BASE               = 2838, -- "Cure" +<value> (Increases base potency of cures, e.g. Cure II hard cap is 145, "Cure" +50 = hard cap of 195)
    CURE_MP_CONSUMED                = 2839, -- "Cure" MP Consumed (Increases the base MP cost of healing magic by +<value>%, e.g. +30%)
    ELEMENTAL_MAGIC_MP_CONSUMED     = 2840, -- Elemental Magic MP Consumed (Increases the base MP cost of elemental magic by +<value>%, e.g. +30%)
    CONSUME_MP_ELEM_BONUS           = 2841, -- Elemental Magic MP Consumed: "Magic Atk. Bonus"+ (value = 1) OR Elemental Magic MP Consumed: Magic Damage+ & "Magic Atk. Bonus"+ (value = 2)

	REGEN_BASE                      = 2934, -- Adds # to the base regen effect (similar to WHM Regen merits)
	PHANTOM_ROLL_RECAST             = 2935, -- Reduces the recast time of Phantom Roll
	REVERSE_FLOURISH_BONUS          = 2936, -- Adds to the base TP returned by Reverse Flourish
	SMN_SPELLINTERRUPT              = 2937, -- Summoning magic interruption rate down %
	ELEMENTAL_MAGIC_RECAST          = 2938, -- Reduces the recast of elemental magic spells
	AUGMENT_VIVACIOUS_PULSE         = 2939, -- Augments "Vivacious Pulse" (Grants Vivacious Pulse the ability to remove status ailments associated with a -na spell)
	ENH_KLIMAFORM                   = 2940, -- Enhances "Klimaform" effect (Increases damage of spells under matching weather while Klimaform is active)
	ENH_PARSIMONY                   = 2941, -- Enhances "Parsimony" effect (Further reduces MP cost by % of associated Black Magic spell)
	ENH_PENURY                      = 2942, -- Enhances "Penury" effect (Further reduces MP cost by % of associated White Magic spell)
	GRIMOIRE_MACC                   = 2943, -- Increases magic accuracy when casting magic associated with active grimoire
	ENH_IMMANENCE                   = 2944, -- Enhances "Immanence" effect (Increases skillchain damage)
	ENH_PERPETUANCE                 = 2945, -- Enhances "Perpetuance" effect (Increases spell duration by %)
	ENH_ADDENDUM_BLACK              = 2946, -- Enhances "Addendum: Black" effect (Reduces enmity generated while under the effect of Addendum: Black)
	ENH_ADDENDUM_WHITE              = 2947, -- Enhances "Addendum: White" effect (Reduces enmity generated while under the effect of Addendum: White)
	ENH_FEATHER_STEP                = 2948, -- Enhances "Feather Step" effect (Adds additional crit evasion down to Feather Step)
	ENH_STRIKING_FLOURISH           = 2949, -- Enhances "Striking Flourish" effect (Adds a crit hit chance bonus to Striking Flourish) 
	ENH_CLIMACTIC_FLOURISH          = 2950, -- Enhances "Climactic Flourish" effect (Increases the number of crits by 1 and adds % damage)
	QUICK_DRAW_ENH_DMG              = 2951, -- Increases the next elemental damage taken matching the Quick Draw card used
	ENH_EFFLUX                      = 2952, -- Enhances "Efflux" effect (Increases TP Bonus from Efflux)
	BLUE_MAGIC_CAST_TIME            = 2953, -- Reduces the casting time of blue magic spells
	BLUE_MAGIC_RECAST               = 2954, -- Reduces the recast of blue magic spells
	AUGMENT_BLUE_MAGIC              = 2955, -- Occ. augments blue magic spells (% chance to triple WSC component of blue magic spells)
	AUGMENT_BLOOD_BOON              = 2956, -- Augments "Blood Boon" (Sometimes causes Blood Pacts to deal increased damage when Blood Boon activates)
	SPIRIT_JUMP_TP_BONUS            = 2957, -- "Spirit Jump" TP Bonus (Increases the amount of TP gained by Spirit Jump)
	SOUL_JUMP_ATT_BONUS             = 2958, -- Enhances "Soul Jump" effect (Adds additional attack as a %)
	SPIRIT_JUMP_ATT_BONUS           = 2959, -- Enhances "Spirit Jump" effect (Adds additional attack as a %)
	SPIRIT_LINK_POTENCY             = 2960, -- Increases the amount healed by Spirit Link (%) and allows multiple debuffs to be removed
	SPIRIT_LINK_HP_COST             = 2961, -- Reduces the player's HP consumed by Spirit Link (% based)
	FOOD_AFFECTS_WYVERN             = 2962, -- Gives your wyvern your food effects
	AUGMENT_YONIN                   = 2963, -- Adds % Counter chance to Yonin when attacked from the front
	ENH_FUTAE                       = 2964, -- Enhances "Futae" effect (Increases the damage bonus % from Futae)
	ENH_MIGAWARI                    = 2965, -- Enhances "Migawari" effect (Reduces the threshold for activation)
	AUGMENT_INNIN                   = 2966, -- Adds % Double Attack to Innin when attacking from behind
	HASSO_PLUS                      = 2967, -- Hasso + gear mod (Increases STR bonus (not from retail/BGWiki))
	ENH_HASSO                       = 2968, -- Enhances "Hasso" effect (Adds additional job ability haste)
	ENH_SEKKANOKI                   = 2969, -- Enhances "Sekkanoki" effect (Weaponskill stacked with Sekkanoki has the fTP of 1000TP + % of remaining TP)
	ENH_SEIGAN                      = 2970, -- Enhances "Seigan" effect (Adds chance to Counter when using Seigan without Third Eye)
	ENH_UNLIMITED_SHOT              = 2971, -- Enhances "Unlimited Shot" effect (Ignores the ranged distance correction requirement)
	ENH_DOUBLE_SHOT                 = 2972, -- Enhances "Double Shot" effect (Reduces enmity when Double Shot activates)
	AUGMENT_SONGS                   = 2973, -- Augments songs (Adds attributes or MP to songs depending on song element)
	ENH_SIC_READY                   = 2974, -- Enhances "Sic" and "Ready" effects (Adds TP Bonus to Sic and Ready abilities)
	ENH_MONSTER_CORRELATION         = 2975, -- Pet: Enhances monster correlation effects (Adds +100 ATT and +20 ACC when monster correlation triggered)
	AUGMENT_KILLER_EFFECTS          = 2976, -- Augments "Killer" effects (Adds Killer effect (strength / 2)% as damage and -PDT)
	ENH_SPUR                        = 2977, -- Enhances "Spur" effect (Adds additional Store TP to Spur)
	STOUT_SERVANT                   = 2978, -- Enhances "Stout Servant" effect
	OCC_VARIES_ATT_PET_HP           = 2979, -- "Attack occasionally varies with pet's HP" set bonus
	ENH_DESPOIL                     = 2980, -- Enhances "Despoil" effect (Increases power of debuff effect)
	ENFEEBLING_MAGIC_CAST           = 2981, -- Reduces enfeebling magic cast time -%
	ENH_MANA_WALL                   = 2982, -- Enhances "Mana Wall" effect (Further reduces the damage taken while under the effect of Mana Wall)
	CUMULATIVE_THUNDER_DMG          = 2983, -- Tracks the cumulative elemental damage for thunder magic spells
	CUMULATIVE_ICE_DMG              = 2984, -- Tracks the cumulative elemental damage for ice magic spells
	CUMULATIVE_FIRE_DMG             = 2985, -- Tracks the cumulative elemental damage for fire magic spells
	CUMULATIVE_WIND_DMG             = 2986, -- Tracks the cumulative elemental damage for wind magic spells
	CUMULATIVE_WATER_DMG            = 2987, -- Tracks the cumulative elemental damage for water magic spells
	CUMULATIVE_EARTH_DMG            = 2988, -- Tracks the cumulative elemental damage for earth magic spells
	ENH_AFFLATUS_SOLACE             = 2989, -- Enhances "Afflatus Solace" effect (Increases the amount of Stoneskin and adds additional MDB to barspells)
	ENH_DIVINE_VEIL                 = 2990, -- Enhances "Divine Veil" effect (Percent chance to make -na spells AoE without Divine Seal)
	AUGMENT_IMPETUS                 = 2991, -- Augments "Impetus" (Adds +ACC and +Crit Hit DMG to Impetus)
	ENH_RESTRAINT                   = 2992, -- Enhances "Restraint" effect
	ENH_BLOOD_RAGE                  = 2993, -- Enhances "Blood Rage" effect (Increases Blood Rage duration)
	ENH_NETHER_VOID                 = 2994, -- Enhances "Nether Void" effect
	ENH_ABSORB_TP                   = 2995, -- Enhances "Absorb-TP" effect
	ENH_DREAD_SPIKES                = 2996, -- Enhances "Dread Spikes" effect as a percentage (Divided by 1000 to allow for floating decimal values)
	OCC_VARIES_ATT_HP               = 2997, -- "Attack occasionally varies with HP" set bonus
	AUGMENT_COMPOSURE               = 2998, -- Percent duration increase from Augments "Composure" set bonus
	AUGMENT_CONSERVE_MP             = 2999, -- Percent chance to activate Augments "Conserve MP" set bonus
	
    COUNTER_DMG                     = 3001, -- Increases Counter Damage
    COUNTER_CRIT_HIT_RATE           = 3002, -- Increases Counter Critical Hit Rate
    MAG_BURST_BONUS_II              = 3003, -- Magic Burst Bonus II
    POT_BANISH_UNDEAD               = 3004, -- Potency of "Banish" on Undead
    ELEM_DOT_EFFECT                 = 3005, -- Potency of Black Magic Elemental DOT
    GAIN_MAGIC_EFFECT               = 3006, -- Potency of White Magic Gain Spells
	PET_BREATH                      = 3007, -- Increases effects of Pet Breath moves
	CALL_BEAST_RECAST               = 3008, -- "Call Beast" Ability Delay
    SHIELD_BASH_DISPEL              = 3009, -- Shield Bash: Adds Dispel
	DIVINE_ENMITY_BONUS             = 3010, -- Divine Magic Special Enmity Bonus
	LAST_RESORT_DEF                 = 3012, -- Last Resort Defense Penalty -%
	NETHER_VOID_BONUS               = 3013, -- Nether Void Absorb Bonus
	DAMAGE_LIMIT_TRAIT              = 3014, -- Damage Limit+ Job Trait (Flat pDIF Bonus, value of 1 to 6)
	DAMAGE_LIMIT_GEAR               = 3015, -- Physical Damage Limit +% from gear (pDIF multiplier)
	ALL_KILLER_EFFECTS              = 3016, -- All Killer Effects + (caps at 100%)
	AUGMENT_REWARD                  = 3017, -- Augments "Reward", II, and III
    WYVERN_ILVL                     = 3018, -- Wyvern: Lv. gear
	BEAST_AFFINITY                  = 3019, -- Increases Jug Pet level by 1 (maxed at 15)
	REWARD_RECAST					= 3020, -- Reduces Reward's recast by x seconds
	DOUBLE_SHOT_AMMO                = 3021, -- Tracks Double Shot Ammo Requirement
	DOUBLE_SHOT_DAMAGE              = 3022, -- Double Shot Damage +
	BOUNTY_SHOT_RATE                = 3023, -- Bounty Shot +Treasure Hunter (base of 2 when active)
	SENGIKORI_BONUS                 = 3024, -- % Bonus to Skillchains and Magic Burst II
	YAEGASUMI_WS_BONUS              = 3025, -- Tracks bonus to WS damage from Yaegasumi SP attack cancellations
	UTSUSEMI_CAST                   = 3026, -- Utsusemi Spellcasting Time -%
	ALL_JUMPS_WYVERN_HP             = 3027, -- All Jumps: Adds % of wyvern's max HP as additional damage
	ENHANCES_AVATARS_FAVOR          = 3028, -- Enhances the effects of Avatar's Favor by 1 tier
	MANA_CEDE_STRENGTH				= 3029, -- Enhances "Mana Cede" effect
	AVATAR_ILVL						= 3030, -- Avatar: Lv. gear
	SPIRIT_RECAST                   = 3031, -- Shortens magic recast time for Elemental Spirits gear
	AVATARS_FAVOR_BP_DELAY          = 3032, -- Blood Pact Delay Reduction from Avatar's Favor
	BREATH_DMG_DEALT				= 3033, -- Increases Breath Damage Dealt +%
	CHAIN_AFFINITY_EFFECT			= 3034, -- Enhances "Chain Affinity" effect
	BURST_AFFINITY_EFFECT			= 3035, -- Enhances "Burst Affinity" effect
	RANDOM_DEAL_EFFECT              = 3036, -- Enhances "Random Deal" effect (+% chance to restore two Job Abilities)
	TRIPLE_SHOT_RATE                = 3037, -- Activation Rate for Triple Shot
	TRIPLE_SHOT_AMMO                = 3038, -- Tracks Triple Shot Ammo Requirement
	TRPL_OCC_QUAD_SHOT              = 3039, -- Triple Shot: Occasionally becomes Quad Shot
	QUICK_DRAW_TP                   = 3040, -- "Quick Draw" TP Bonus
	QUAD_SHOT_RATE                  = 3041, -- Activation Rate for Quad Shot
	REM_OCC_DO_QUAD_DMG_RANGED      = 3042, -- Proc rate for REM Aftermaths that apply "Occasionally do quadruple damage" (Mainly provided for "Quad Shot")
	TRIPLE_SHOT_DAMAGE              = 3043, -- Triple Shot Damage + Gear
	PHANTOM_ROLL_EFFECT             = 3044, -- + Phantom Roll Effect from Crooked Cards
	DBL_OCC_TRPL_SHOT               = 3045, -- Double Shot: Occasionally becomes Triple Shot
	TRUE_SHOT                       = 3046, -- "True Shot" + Gear
	AUTOMATON_ILVL                  = 3047, -- Automaton: Lv. Gear
	BARRAGE_TURBINE_SHOTS           = 3048, -- Barrage Turbine additional shot counter
	TACTICAL_SWITCH_BONUS           = 3049, -- "Tactical Switch" + Gear (Adds % TP Bonus when using Tactical Switch)
	STEP_TP_CONSUMED                = 3050, -- "Step" TP Consumed - Gear
	CRIT_HIT_EVASION                = 3051, -- Adjusts the % chance that a critical hit will land (Feather Step)
	TP_MOVE_EVASION                 = 3052, -- Chance to evade special/TP moves (Foil)
	PARRY_RATE_BONUS                = 3053, -- Inquartata and Parrying Rate +% Gear
	LIEMENT_DURATION                = 3054, -- "Liement" Duration + Gear
	SWORDPLAY                       = 3055, -- Number of ticks to increase starting value of Swordplay by
	ENH_MAGIC_CAST_TIME             = 3056, -- Enhancing Magic Casting Time
	VALLATION_DURATION              = 3057, -- Increases the duration of Vallation
	LUNGE_BONUS                     = 3058, -- n multiplier from gear and job points for Swipe and Lunge
	PFLUG_BONUS                     = 3059, -- Improves Pflug base value
	PHALANX_RCVD                    = 3060, -- Enhances Phalanx Effect Received
	GAMBIT_DURATION                 = 3061, -- Increases the duration of Gambit
	BATTUTA_EFFECT                  = 3062, -- Increases the Counter damage of Battuta
	ONE_FOR_ALL_EFFECT              = 3063, -- Tracks the total amount of magic reduction from One For All
	LUOPAN_POTENCY                  = 3064, -- Luopan potency from Ecliptic Attrition/Blaze of Glory
	ENH_FULL_CIRCLE                 = 3065, -- Full Circle + Gear (Enhances the base MP return multiplier)
	AUGMENT_CONCENTRIC_PULSE        = 3066, -- Augments "Concentric Pulse"
	GEOMANCY_POTENCY                = 3067, -- +Geomancy potency from Eminent Bell/Dunna/etc
	DEFENDER_BLOCK_CHANCE			= 3068, -- Defender: Chance of Successful Block
    ALL_JUMPS_ATT_BONUS             = 3069, -- All Jumps: Attack +<value>%
    ALL_JUMPS_ACC_BONUS             = 3070, -- All Jumps: Accuracy +<value>

	-- Add +fTP to weaponskills based on Skillchain property (Elemental Gorgets, Elemental Obis, Fotia Neck/Waist)
	SC_FTP_TRANSFIXION              = 3100, -- Lv1 Light
    SC_FTP_COMPRESSION              = 3101, -- Lv1 Dark
    SC_FTP_LIQUEFACTION             = 3102, -- Lv1 Fire
    SC_FTP_SCISSION                 = 3103, -- Lv1 Earth
    SC_FTP_REVERBERATION            = 3104, -- Lv1 Water
    SC_FTP_DETONATION               = 3105, -- Lv1 Wind
    SC_FTP_INDURATION               = 3106, -- Lv1 Ice
    SC_FTP_IMPACTION                = 3107, -- Lv1 Thunder
    SC_FTP_GRAVITATION              = 3108, -- Lv2 Dark & Earth
    SC_FTP_DISTORTION               = 3109, -- Lv2 Water & Ice
    SC_FTP_FUSION                   = 3110, -- Lv2 Fire & Light
    SC_FTP_FRAGMENTATION            = 3111, -- Lv2 Wind & Thunder
    SC_FTP_LIGHT                    = 3112, -- Lv3 Fire, Light, Wind, Thunder
    SC_FTP_DARKNESS                 = 3113, -- Lv3 Dark, Earth, Water, Ice
    SC_FTP_LIGHT_II                 = 3114, -- Lv4 Light
    SC_FTP_DARKNESS_II              = 3115, -- Lv4 Darkness
	SC_FTP_ALL                      = 3116, -- All skillchains
	
	-- Add +fTP to weaponskills based on Day element (Athos's Gloves, Mekira-oto, Gavialis Helm)
	WS_DAY_FTP_TRANSFIXION          = 3117, -- Lv1 Light
    WS_DAY_FTP_COMPRESSION          = 3118, -- Lv1 Dark
    WS_DAY_FTP_LIQUEFACTION         = 3119, -- Lv1 Fire
    WS_DAY_FTP_SCISSION             = 3120, -- Lv1 Earth
    WS_DAY_FTP_REVERBERATION        = 3121, -- Lv1 Water
    WS_DAY_FTP_DETONATION           = 3122, -- Lv1 Wind
    WS_DAY_FTP_INDURATION           = 3123, -- Lv1 Ice
    WS_DAY_FTP_IMPACTION            = 3124, -- Lv1 Thunder
    WS_DAY_FTP_GRAVITATION          = 3125, -- Lv2 Dark & Earth
    WS_DAY_FTP_DISTORTION           = 3126, -- Lv2 Water & Ice
    WS_DAY_FTP_FUSION               = 3127, -- Lv2 Fire & Light
    WS_DAY_FTP_FRAGMENTATION        = 3128, -- Lv2 Wind & Thunder
    WS_DAY_FTP_LIGHT                = 3129, -- Lv3 Fire, Light, Wind, Thunder
    WS_DAY_FTP_DARKNESS             = 3130, -- Lv3 Dark, Earth, Water, Ice
    WS_DAY_FTP_LIGHT_II             = 3131, -- Lv4 Light
    WS_DAY_FTP_DARKNESS_II          = 3132, -- Lv4 Darkness
	WS_DAY_FTP_ALL                  = 3133, -- All skillchains
	
	SDT_FIRE                        = 3200, -- Fire Specific Damage Taken
    SDT_ICE                         = 3201, -- Ice Specific Damage Taken
    SDT_WIND                        = 3202, -- Wind Specific Damage Taken
    SDT_EARTH                       = 3203, -- Earth Specific Damage Taken
    SDT_LIGHTNING                   = 3204, -- Thunder Specific Damage Taken
    SDT_WATER                       = 3205, -- Water Specific Damage Taken
    SDT_LIGHT                       = 3206, -- Light Specific Damage Taken
    SDT_DARK                        = 3207, -- Dark Specific Damage Taken
	SDT_PHYS						= 3208, -- Physical Specific Damage Taken
	SDT_RANGED						= 3209, -- Ranged Specific Damage Taken
	SDT_MAGIC						= 3210, -- Magic Specific Damage Taken
	SDT_BREATH						= 3211, -- Breath Specific Damage Taken
	
	ENH_ERASE                       = 3208, -- Increases the number of effects removed by Erase (Cleric's Torque/+1/+2)
	ENH_DISPEL                      = 3209, -- Increases the number of effects removed by Dispel (Duelist's Torque/+1/+2)
	ENH_ENFEEBLE                    = 3210, -- Increases Enfeebling magic potency + (Duelist's Torque/+1/+2)
	UTSU_ATK_SHADOWS                = 3211, -- Adds Attack for each Utsusemi Shadow Image present
	
	-- ASURAN_FISTS_DMG                = 3300, -- Asuran Fists Damage (H2H)
	-- EVISCERATION_DMG                = 3301, -- Evisceration Damage (Dagger)
	-- SAVAGE_BLADE_DMG                = 3302, -- Savage Blade Damage (Sword)
	-- GROUND_STRIKE_DMG               = 3303, -- Ground Strike Damage (GSword)
	-- DECIMATION_DMG                  = 3304, -- Decimation Damage (Axe)
	-- STEEL_CYCLONE_DMG               = 3305, -- Steel Cycle Damage (GAxe)
	-- SPIRAL_HELL_DMG                 = 3306, -- Spiral Hell Damage (Scythe)
	-- IMPULSE_DRIVE_DMG               = 3307, -- Impulse Drive Damage (Polearm)
	-- BLADE_KU_DMG                    = 3308, -- Blade: Ku Damage (Katana)
	-- TACHI_KASHA_DMG                 = 3309, -- Tachi: Kasha Damage (GKatana)
	-- BLACK_HALO_DMG                  = 3310, -- Black Halo Damage (Club)
	-- RETRIBUTION_DMG                 = 3311, -- Retribution Damage (Staff)
	-- EMPYREAL_ARROW_DMG              = 3312, -- Empyreal Arrow Damage (Archery)
	-- DETONATOR_DMG                   = 3313, -- Detonator Damage (Marksmanship)
	-- SPINNING_SLASH_DMG              = 3314, -- Spinning Slash Damage (Great Sword)
	-- RED_LOTUS_BLADE_DMG             = 3315, -- Red Lotus Blade Damage (Sword)
	-- HERCULEAN_SLASH_DMG             = 3316, -- Herculean Slash Damage (Great Sword)
	-- GUST_SLASH_DMG                  = 3317, -- Gust Slash Damage (Dagger)
	-- CLOUDSPLITTER_DMG				= 3318, -- Cloudsplitter Damage (Axe)
	-- SERAPH_STRIKE_DMG               = 3319, -- Seraph Strike Damage (Club)
	-- BLAST_SHOT_DMG                  = 3320, -- Blast Shot Damage (Marksmanship)
	-- RAIDEN_THRUST_DMG               = 3321, -- Raiden Thrust Damage (Polearm)
	-- TACHI_KAGERO_DMG                = 3322, -- Tachi: Kagero Damage (Great Katana)

    TRUST_GENERIC_SPELL_RECAST      = 4000, -- Generic spell recast modifier for trusts
    TRUST_CURE_SPELL_RECAST         = 4001, -- Healing spell recast modifier for trusts
    TRUST_BUFF_SPELL_RECAST         = 4002, -- Enhancing spell recast modifier for trusts
    TRUST_DEBUFF_SPELL_RECAST       = 4003, -- Enfeebling spell recast modifier for trusts
    TRUST_NA_SPELL_RECAST           = 4004, -- -na spell recast modifier for trusts
    TRUST_BLUEMAGIC_SPELL_RECAST    = 4005, -- Blue Magic recast modifier for trusts
}

tpz.latent =
{
    HP_UNDER_PERCENT         = 0,  -- hp less than or equal to % - PARAM: HP PERCENT
    HP_OVER_PERCENT          = 1,  -- hp more than % - PARAM: HP PERCENT
    HP_UNDER_TP_UNDER_100    = 2,  -- hp less than or equal to %, tp under 100 - PARAM: HP PERCENT
    HP_OVER_TP_UNDER_100     = 3,  -- hp more than %, tp over 100 - PARAM: HP PERCENT
    MP_UNDER_PERCENT         = 4,  -- mp less than or equal to % - PARAM: MP PERCENT
    MP_UNDER                 = 5,  -- mp less than # - PARAM: MP #
    TP_UNDER                 = 6,  -- tp under # and during WS - PARAM: TP VALUE
    TP_OVER                  = 7,  -- tp over # - PARAM: TP VALUE
    SUBJOB                   = 8,  -- subjob - PARAM: JOBTYPE
    PET_ID                   = 9,  -- pettype - PARAM: PETID
    WEAPON_DRAWN             = 10, -- weapon drawn
    WEAPON_SHEATHED          = 11, -- weapon sheathed
    SIGNET_BONUS             = 12, -- While in conquest region and engaged to an even match or less target
    STATUS_EFFECT_ACTIVE     = 13, -- status effect on player - PARAM: EFFECTID
    NO_FOOD_ACTIVE           = 14, -- no food effects active on player
    PARTY_MEMBERS            = 15, -- party size # - PARAM: # OF MEMBERS
    PARTY_MEMBERS_IN_ZONE    = 16, -- party size # and members in zone - PARAM: # OF MEMBERS
    SANCTION_REGEN_BONUS     = 17, -- While in besieged region and HP is less than PARAM%
    SANCTION_REFRESH_BONUS   = 18, -- While in besieged region and MP is less than PARAM%
    SIGIL_REGEN_BONUS        = 19, -- While in campaign region and HP is less than PARAM%
    SIGIL_REFRESH_BONUS      = 20, -- While in campaign region and MP is less than PARAM%
    AVATAR_IN_PARTY          = 21, -- party has a specific avatar - PARAM: same as globals/pets.lua (21 for any avatar)
    JOB_IN_PARTY             = 22, -- party has job - PARAM: JOBTYPE
    ZONE                     = 23, -- in zone - PARAM: zoneid
    SYNTH_TRAINEE            = 24, -- synth skill under 40 + no support
    SONG_ROLL_ACTIVE         = 25, -- any song or roll active
    TIME_OF_DAY              = 26, -- PARAM: 0: DAYTIME 1: NIGHTTIME 2: DUSK-DAWN
    HOUR_OF_DAY              = 27, -- PARAM: 1: NEW DAY, 2: DAWN, 3: DAY, 4: DUSK, 5: EVENING, 6: DEAD OF NIGHT
    FIRESDAY                 = 28,
    EARTHSDAY                = 29,
    WATERSDAY                = 30,
    WINDSDAY                 = 31,
    DARKSDAY                 = 32,
    ICEDAY                   = 34,
    LIGHTNINGSDAY            = 35,
    LIGHTSDAY                = 36,
    MOON_PHASE               = 37, -- PARAM: 0: New Moon, 1: Waxing Crescent, 2: First Quarter, 3: Waxing Gibbous, 4: Full Moon, 5: Waning Gibbous, 6: Last Quarter, 7: Waning Crescent
    JOB_MULTIPLE             = 38, -- PARAM: 0: ODD, 2: EVEN, 3-99: DIVISOR
    JOB_MULTIPLE_AT_NIGHT    = 39, -- PARAM: 0: ODD, 2: EVEN, 3-99: DIVISOR
    -- 40 free to use
	-- 41 free to use
    -- 42 free to use
    WEAPON_DRAWN_HP_UNDER    = 43, -- PARAM: HP PERCENT
    STATUS_ACTIVE_NO_JOBSP   = 44, -- PARAM: EFFECTID - When status effect active, but without a 1hr/2hr Job Special active
    MP_UNDER_VISIBLE_GEAR    = 45, -- mp less than or equal to %, calculated using MP bonuses from visible gear only
    HP_OVER_VISIBLE_GEAR     = 46, -- hp more than or equal to %, calculated using HP bonuses from visible gear only
    WEAPON_BROKEN            = 47,
    IN_DYNAMIS               = 48,
    FOOD_ACTIVE              = 49, -- food effect (foodId) active - PARAM: FOOD ITEMID
    JOB_LEVEL_BELOW          = 50, -- PARAM: level
    JOB_LEVEL_ABOVE          = 51, -- PARAM: level
    WEATHER_ELEMENT          = 52, -- PARAM: 0: NONE, 1: FIRE, 2: ICE, 3: WIND, 4: EARTH, 5: THUNDER, 6: WATER, 7: LIGHT, 8: DARK
    NATION_CONTROL           = 53, -- checks if player region is under nation's control - PARAM: 0: Under own nation's control, 1: Outside own nation's control
    ZONE_HOME_NATION         = 54, -- in zone and citizen of nation (aketons)
    MP_OVER                  = 55, -- mp greater than # - PARAM: MP #
    WEAPON_DRAWN_MP_OVER     = 56, -- while weapon is drawn and mp greater than # - PARAM: MP #
    ELEVEN_ROLL_ACTIVE       = 57, -- corsair roll of 11 active
    IN_ASSAULT               = 58, -- is in an Instance battle in a TOAU zone
    VS_ECOSYSTEM             = 59, -- Vs. Specific Ecosystem ID (e.g. Vs. Birds: Accuracy+3)
    VS_FAMILY                = 60, -- Vs. Specific Family ID (e.g. Vs. Apkallu: Accuracy+3)
}

------------------------------------
-- Merits
------------------------------------

local MCATEGORY_HP_MP      = 0x0040
local MCATEGORY_ATTRIBUTES = 0x0080
local MCATEGORY_COMBAT     = 0x00C0
local MCATEGORY_MAGIC      = 0x0100
local MCATEGORY_OTHERS     = 0x0140

local MCATEGORY_WAR_1 = 0x0180
local MCATEGORY_MNK_1 = 0x01C0
local MCATEGORY_WHM_1 = 0x0200
local MCATEGORY_BLM_1 = 0x0240
local MCATEGORY_RDM_1 = 0x0280
local MCATEGORY_THF_1 = 0x02C0
local MCATEGORY_PLD_1 = 0x0300
local MCATEGORY_DRK_1 = 0x0340
local MCATEGORY_BST_1 = 0x0380
local MCATEGORY_BRD_1 = 0x03C0
local MCATEGORY_RNG_1 = 0x0400
local MCATEGORY_SAM_1 = 0x0440
local MCATEGORY_NIN_1 = 0x0480
local MCATEGORY_DRG_1 = 0x04C0
local MCATEGORY_SMN_1 = 0x0500
local MCATEGORY_BLU_1 = 0x0540
local MCATEGORY_COR_1 = 0x0580
local MCATEGORY_PUP_1 = 0x05C0
local MCATEGORY_DNC_1 = 0x0600
local MCATEGORY_SCH_1 = 0x0640

local MCATEGORY_WS = 0x0680

local MCATEGORY_GEO_1 = 0x06C0
local MCATEGORY_RUN_1 = 0x0700

local MCATEGORY_UNK_1 = 0x0740
local MCATEGORY_UNK_2 = 0x0780
local MCATEGORY_UNK_3 = 0x07C0

local MCATEGORY_WAR_2 = 0x0800
local MCATEGORY_MNK_2 = 0x0840
local MCATEGORY_WHM_2 = 0x0880
local MCATEGORY_BLM_2 = 0x08C0
local MCATEGORY_RDM_2 = 0x0900
local MCATEGORY_THF_2 = 0x0940
local MCATEGORY_PLD_2 = 0x0980
local MCATEGORY_DRK_2 = 0x09C0
local MCATEGORY_BST_2 = 0x0A00
local MCATEGORY_BRD_2 = 0x0A40
local MCATEGORY_RNG_2 = 0x0A80
local MCATEGORY_SAM_2 = 0x0AC0
local MCATEGORY_NIN_2 = 0x0B00
local MCATEGORY_DRG_2 = 0x0B40
local MCATEGORY_SMN_2 = 0x0B80
local MCATEGORY_BLU_2 = 0x0BC0
local MCATEGORY_COR_2 = 0x0C00
local MCATEGORY_PUP_2 = 0x0C40
local MCATEGORY_DNC_2 = 0x0C80
local MCATEGORY_SCH_2 = 0x0CC0
local MCATEGORY_UNK_2 = 0x0D00
local MCATEGORY_GEO_2 = 0x0D40
local MCATEGORY_RUN_2 = 0x0D80

local MCATEGORY_START = 0x0040
local MCATEGORY_COUNT = 0x0D80

tpz.merit =
{
    -- HP
    MAX_HP                      = MCATEGORY_HP_MP + 0x00,
    MAX_MP                      = MCATEGORY_HP_MP + 0x02,

    -- ATTRIBUTES
    STR                         = MCATEGORY_ATTRIBUTES + 0x00,
    DEX                         = MCATEGORY_ATTRIBUTES + 0x02,
    VIT                         = MCATEGORY_ATTRIBUTES + 0x04,
    AGI                         = MCATEGORY_ATTRIBUTES + 0x08,
    INT                         = MCATEGORY_ATTRIBUTES + 0x0A,
    MND                         = MCATEGORY_ATTRIBUTES + 0x0C,
    CHR                         = MCATEGORY_ATTRIBUTES + 0x0E,

    -- COMBAT SKILLS
    H2H                         = MCATEGORY_COMBAT + 0x00,
    DAGGER                      = MCATEGORY_COMBAT + 0x02,
    SWORD                       = MCATEGORY_COMBAT + 0x04,
    GSWORD                      = MCATEGORY_COMBAT + 0x06,
    AXE                         = MCATEGORY_COMBAT + 0x08,
    GAXE                        = MCATEGORY_COMBAT + 0x0A,
    SCYTHE                      = MCATEGORY_COMBAT + 0x0C,
    POLEARM                     = MCATEGORY_COMBAT + 0x0E,
    KATANA                      = MCATEGORY_COMBAT + 0x10,
    GKATANA                     = MCATEGORY_COMBAT + 0x12,
    CLUB                        = MCATEGORY_COMBAT + 0x14,
    STAFF                       = MCATEGORY_COMBAT + 0x16,
    ARCHERY                     = MCATEGORY_COMBAT + 0x18,
    MARKSMANSHIP                = MCATEGORY_COMBAT + 0x1A,
    THROWING                    = MCATEGORY_COMBAT + 0x1C,
    GUARDING                    = MCATEGORY_COMBAT + 0x1E,
    EVASION                     = MCATEGORY_COMBAT + 0x20,
    SHIELD                      = MCATEGORY_COMBAT + 0x22,
    PARRYING                    = MCATEGORY_COMBAT + 0x24,

    -- MAGIC SKILLS
    DIVINE                      = MCATEGORY_MAGIC + 0x00,
    HEALING                     = MCATEGORY_MAGIC + 0x02,
    ENHANCING                   = MCATEGORY_MAGIC + 0x04,
    ENFEEBLING                  = MCATEGORY_MAGIC + 0x06,
    ELEMENTAL                   = MCATEGORY_MAGIC + 0x08,
    DARK                        = MCATEGORY_MAGIC + 0x0A,
    SUMMONING                   = MCATEGORY_MAGIC + 0x0C,
    NINJITSU                    = MCATEGORY_MAGIC + 0x0E,
    SINGING                     = MCATEGORY_MAGIC + 0x10,
    STRING                      = MCATEGORY_MAGIC + 0x12,
    WIND                        = MCATEGORY_MAGIC + 0x14,
    BLUE                        = MCATEGORY_MAGIC + 0x16,

    -- OTHERS
    ENMITY_INCREASE             = MCATEGORY_OTHERS + 0x00,
    ENMITY_DECREASE             = MCATEGORY_OTHERS + 0x02,
    CRIT_HIT_RATE               = MCATEGORY_OTHERS + 0x04,
    ENEMY_CRIT_RATE             = MCATEGORY_OTHERS + 0x06,
    SPELL_INTERUPTION_RATE      = MCATEGORY_OTHERS + 0x08,

    -- WAR 1
    BERSERK_RECAST              = MCATEGORY_WAR_1 + 0x00,
    DEFENDER_RECAST             = MCATEGORY_WAR_1 + 0x02,
    WARCRY_RECAST               = MCATEGORY_WAR_1 + 0x04,
    AGGRESSOR_RECAST            = MCATEGORY_WAR_1 + 0x06,
    DOUBLE_ATTACK_RATE          = MCATEGORY_WAR_1 + 0x08,

    -- MNK 1
    FOCUS_RECAST                = MCATEGORY_MNK_1 + 0x00,
    DODGE_RECAST                = MCATEGORY_MNK_1 + 0x02,
    CHAKRA_RECAST               = MCATEGORY_MNK_1 + 0x04,
    COUNTER_RATE                = MCATEGORY_MNK_1 + 0x06,
    KICK_ATTACK_RATE            = MCATEGORY_MNK_1 + 0x08,

    -- WHM 1
    DIVINE_SEAL_RECAST          = MCATEGORY_WHM_1 + 0x00,
    CURE_CAST_TIME              = MCATEGORY_WHM_1 + 0x02,
    BAR_SPELL_EFFECT            = MCATEGORY_WHM_1 + 0x04,
    BANISH_EFFECT               = MCATEGORY_WHM_1 + 0x06,
    REGEN_EFFECT                = MCATEGORY_WHM_1 + 0x08,

    -- BLM 1
    ELEMENTAL_SEAL_RECAST       = MCATEGORY_BLM_1 + 0x00,
    FIRE_MAGIC_POTENCY          = MCATEGORY_BLM_1 + 0x02,
    ICE_MAGIC_POTENCY           = MCATEGORY_BLM_1 + 0x04,
    WIND_MAGIC_POTENCY          = MCATEGORY_BLM_1 + 0x06,
    EARTH_MAGIC_POTENCY         = MCATEGORY_BLM_1 + 0x08,
    LIGHTNING_MAGIC_POTENCY     = MCATEGORY_BLM_1 + 0x0A,
    WATER_MAGIC_POTENCY         = MCATEGORY_BLM_1 + 0x0C,

    -- RDM 1
    CONVERT_RECAST              = MCATEGORY_RDM_1 + 0x00,
    FIRE_MAGIC_ACCURACY         = MCATEGORY_RDM_1 + 0x02,
    ICE_MAGIC_ACCURACY          = MCATEGORY_RDM_1 + 0x04,
    WIND_MAGIC_ACCURACY         = MCATEGORY_RDM_1 + 0x06,
    EARTH_MAGIC_ACCURACY        = MCATEGORY_RDM_1 + 0x08,
    LIGHTNING_MAGIC_ACCURACY    = MCATEGORY_RDM_1 + 0x0A,
    WATER_MAGIC_ACCURACY        = MCATEGORY_RDM_1 + 0x0C,

    -- THF 1
    FLEE_RECAST                 = MCATEGORY_THF_1 + 0x00,
    HIDE_RECAST                 = MCATEGORY_THF_1 + 0x02,
    SNEAK_ATTACK_RECAST         = MCATEGORY_THF_1 + 0x04,
    TRICK_ATTACK_RECAST         = MCATEGORY_THF_1 + 0x06,
    TRIPLE_ATTACK_RATE          = MCATEGORY_THF_1 + 0x08,

    -- PLD 1
    SHIELD_BASH_RECAST          = MCATEGORY_PLD_1 + 0x00,
    HOLY_CIRCLE_RECAST          = MCATEGORY_PLD_1 + 0x02,
    SENTINEL_RECAST             = MCATEGORY_PLD_1 + 0x04,
    COVER_EFFECT_LENGTH         = MCATEGORY_PLD_1 + 0x06,
    RAMPART_RECAST              = MCATEGORY_PLD_1 + 0x08,

    -- DRK 1
    SOULEATER_RECAST            = MCATEGORY_DRK_1 + 0x00,
    ARCANE_CIRCLE_RECAST        = MCATEGORY_DRK_1 + 0x02,
    LAST_RESORT_RECAST          = MCATEGORY_DRK_1 + 0x04,
    LAST_RESORT_EFFECT          = MCATEGORY_DRK_1 + 0x06,
    WEAPON_BASH_EFFECT          = MCATEGORY_DRK_1 + 0x08,

    -- BST 1
    KILLER_EFFECTS              = MCATEGORY_BST_1 + 0x00,
    REWARD_RECAST               = MCATEGORY_BST_1 + 0x02,
    CALL_BEAST_RECAST           = MCATEGORY_BST_1 + 0x04,
    SIC_RECAST                  = MCATEGORY_BST_1 + 0x06,
    TAME_RECAST                 = MCATEGORY_BST_1 + 0x08,

    -- BRD 1
    LULLABY_RECAST              = MCATEGORY_BRD_1 + 0x00,
    FINALE_RECAST               = MCATEGORY_BRD_1 + 0x02,
    MINNE_EFFECT                = MCATEGORY_BRD_1 + 0x04,
    MINUET_EFFECT               = MCATEGORY_BRD_1 + 0x06,
    MADRIGAL_EFFECT             = MCATEGORY_BRD_1 + 0x08,

    -- RNG 1
    SCAVENGE_EFFECT             = MCATEGORY_RNG_1 + 0x00,
    CAMOUFLAGE_RECAST           = MCATEGORY_RNG_1 + 0x02,
    SHARPSHOT_RECAST            = MCATEGORY_RNG_1 + 0x04,
    UNLIMITED_SHOT_RECAST       = MCATEGORY_RNG_1 + 0x06,
    RAPID_SHOT_RATE             = MCATEGORY_RNG_1 + 0x08,

    -- SAM 1
    THIRD_EYE_RECAST            = MCATEGORY_SAM_1 + 0x00,
    WARDING_CIRCLE_RECAST       = MCATEGORY_SAM_1 + 0x02,
    STORE_TP_EFFECT             = MCATEGORY_SAM_1 + 0x04,
    MEDITATE_RECAST             = MCATEGORY_SAM_1 + 0x06,
    ZASHIN_ATTACK_RATE          = MCATEGORY_SAM_1 + 0x08,

    -- NIN 1
    SUBTLE_BLOW_EFFECT          = MCATEGORY_NIN_1 + 0x00,
    KATON_EFFECT                = MCATEGORY_NIN_1 + 0x02,
    HYOTON_EFFECT               = MCATEGORY_NIN_1 + 0x04,
    HUTON_EFFECT                = MCATEGORY_NIN_1 + 0x06,
    DOTON_EFFECT                = MCATEGORY_NIN_1 + 0x08,
    RAITON_EFFECT               = MCATEGORY_NIN_1 + 0x0A,
    SUITON_EFFECT               = MCATEGORY_NIN_1 + 0x0C,

    -- DRG 1
    ANCIENT_CIRCLE_RECAST       = MCATEGORY_DRG_1 + 0x00,
    JUMP_RECAST                 = MCATEGORY_DRG_1 + 0x02,
    HIGH_JUMP_RECAST            = MCATEGORY_DRG_1 + 0x04,
    SUPER_JUMP_RECAST           = MCATEGORY_DRG_1 + 0x05,
    SPIRIT_LINK_RECAST          = MCATEGORY_DRG_1 + 0x08,

    -- SMN 1
    AVATAR_PHYSICAL_ACCURACY    = MCATEGORY_SMN_1 + 0x00,
    AVATAR_PHYSICAL_ATTACK      = MCATEGORY_SMN_1 + 0x02,
    AVATAR_MAGICAL_ACCURACY     = MCATEGORY_SMN_1 + 0x04,
    AVATAR_MAGICAL_ATTACK       = MCATEGORY_SMN_1 + 0x06,
    SUMMONING_MAGIC_CAST_TIME   = MCATEGORY_SMN_1 + 0x08,

    -- BLU 1
    CHAIN_AFFINITY_RECAST       = MCATEGORY_BLU_1 + 0x00,
    BURST_AFFINITY_RECAST       = MCATEGORY_BLU_1 + 0x02,
    MONSTER_CORRELATION         = MCATEGORY_BLU_1 + 0x04,
    PHYSICAL_POTENCY            = MCATEGORY_BLU_1 + 0x06,
    MAGICAL_ACCURACY            = MCATEGORY_BLU_1 + 0x08,

    -- COR 1
    PHANTOM_ROLL_RECAST         = MCATEGORY_COR_1 + 0x00,
    QUICK_DRAW_RECAST           = MCATEGORY_COR_1 + 0x02,
    QUICK_DRAW_ACCURACY         = MCATEGORY_COR_1 + 0x04,
    RANDOM_DEAL_RECAST          = MCATEGORY_COR_1 + 0x06,
    BUST_DURATION               = MCATEGORY_COR_1 + 0x08,

    -- PUP 1
    AUTOMATON_SKILLS            = MCATEGORY_PUP_1 + 0x00,
    MAINTENACE_RECAST           = MCATEGORY_PUP_1 + 0x02,
    REPAIR_EFFECT               = MCATEGORY_PUP_1 + 0x04,
    ACTIVATE_RECAST             = MCATEGORY_PUP_1 + 0x06,
    REPAIR_RECAST               = MCATEGORY_PUP_1 + 0x08,

    -- DNC 1
    STEP_ACCURACY               = MCATEGORY_DNC_1 + 0x00,
    HASTE_SAMBA_EFFECT          = MCATEGORY_DNC_1 + 0x02,
    REVERSE_FLOURISH_EFFECT     = MCATEGORY_DNC_1 + 0x04,
    BUILDING_FLOURISH_EFFECT    = MCATEGORY_DNC_1 + 0x06,

    -- SCH 1
    GRIMOIRE_RECAST             = MCATEGORY_SCH_1 + 0x00,
    MODUS_VERITAS_DURATION      = MCATEGORY_SCH_1 + 0x02,
    HELIX_MAGIC_ACC_ATT         = MCATEGORY_SCH_1 + 0x04,
    MAX_SUBLIMATION             = MCATEGORY_SCH_1 + 0x06,

    -- GEO 1
    FULL_CIRCLE_EFFECT          = MCATEGORY_GEO_1 + 0x00,
    ECLIPTIC_ATT_RECAST         = MCATEGORY_GEO_1 + 0x02,
    LIFE_CYCLE_RECAST           = MCATEGORY_GEO_1 + 0x04,
    BLAZE_OF_GLORY_RECAST       = MCATEGORY_GEO_1 + 0x06,
    DEMATERIALIZE_RECAST        = MCATEGORY_GEO_1 + 0x08,
	
	-- RUN 1
	RUNE_ENHANCE                = MCATEGORY_RUN_1 + 0x00,
    VALLATION_EFFECT            = MCATEGORY_RUN_1 + 0x02,
    LUNGE_EFFECT                = MCATEGORY_RUN_1 + 0x04,
    PFLUG_EFFECT                = MCATEGORY_RUN_1 + 0x06,
    GAMBIT_EFFECT               = MCATEGORY_RUN_1 + 0x08,

    -- WEAPON SKILLS
    SHIJIN_SPIRAL               = MCATEGORY_WS + 0x00,
    EXENTERATOR                 = MCATEGORY_WS + 0x02,
    REQUIESCAT                  = MCATEGORY_WS + 0x04,
    RESOLUTION                  = MCATEGORY_WS + 0x06,
    RUINATOR                    = MCATEGORY_WS + 0x08,
    UPHEAVAL                    = MCATEGORY_WS + 0x0A,
    ENTROPY                     = MCATEGORY_WS + 0x0C,
    STARDIVER                   = MCATEGORY_WS + 0x0E,
    BLADE_SHUN                  = MCATEGORY_WS + 0x10,
    TACHI_SHOHA                 = MCATEGORY_WS + 0x12,
    REALMRAZER                  = MCATEGORY_WS + 0x14,
    SHATTERSOUL                 = MCATEGORY_WS + 0x16,
    APEX_ARROW                  = MCATEGORY_WS + 0x18,
    LAST_STAND                  = MCATEGORY_WS + 0x1A,

    -- WAR 2
    WARRIORS_CHARGE             = MCATEGORY_WAR_2 + 0x00,
    TOMAHAWK                    = MCATEGORY_WAR_2 + 0x02,
    SAVAGERY                    = MCATEGORY_WAR_2 + 0x04,
    AGGRESSIVE_AIM              = MCATEGORY_WAR_2 + 0x06,

    -- MNK 2
    MANTRA                      = MCATEGORY_MNK_2 + 0x00,
    FORMLESS_STRIKES            = MCATEGORY_MNK_2 + 0x02,
    INVIGORATE                  = MCATEGORY_MNK_2 + 0x04,
    PENANCE                     = MCATEGORY_MNK_2 + 0x06,

    -- WHM 2
    MARTYR                      = MCATEGORY_WHM_2 + 0x00,
    DEVOTION                    = MCATEGORY_WHM_2 + 0x02,
    PROTECTRA_V                 = MCATEGORY_WHM_2 + 0x04,
    SHELLRA_V                   = MCATEGORY_WHM_2 + 0x06,
    ANIMUS_SOLACE               = MCATEGORY_WHM_2 + 0x08,
    ANIMUS_MISERY               = MCATEGORY_WHM_2 + 0x0A,

    -- BLM 2
    FLARE_II                    = MCATEGORY_BLM_2 + 0x00,
    FREEZE_II                   = MCATEGORY_BLM_2 + 0x02,
    TORNADO_II                  = MCATEGORY_BLM_2 + 0x04,
    QUAKE_II                    = MCATEGORY_BLM_2 + 0x06,
    BURST_II                    = MCATEGORY_BLM_2 + 0x08,
    FLOOD_II                    = MCATEGORY_BLM_2 + 0x0A,
    ANCIENT_MAGIC_ATK_BONUS     = MCATEGORY_BLM_2 + 0x0C,
    ANCIENT_MAGIC_BURST_DMG     = MCATEGORY_BLM_2 + 0x0E,
    ELEMENTAL_MAGIC_ACCURACY    = MCATEGORY_BLM_2 + 0x10,
    ELEMENTAL_DEBUFF_DURATION   = MCATEGORY_BLM_2 + 0x12,
    ELEMENTAL_DEBUFF_EFFECT     = MCATEGORY_BLM_2 + 0x14,
    ASPIR_ABSORPTION_AMOUNT     = MCATEGORY_BLM_2 + 0x16,

    -- RDM 2
    DIA_III                     = MCATEGORY_RDM_2 + 0x00,
    SLOW_II                     = MCATEGORY_RDM_2 + 0x02,
    PARALYZE_II                 = MCATEGORY_RDM_2 + 0x04,
    PHALANX_II                  = MCATEGORY_RDM_2 + 0x06,
    BIO_III                     = MCATEGORY_RDM_2 + 0x08,
    BLIND_II                    = MCATEGORY_RDM_2 + 0x0A,
    ENFEEBLING_MAGIC_DURATION   = MCATEGORY_RDM_2 + 0x0C,
    MAGIC_ACCURACY              = MCATEGORY_RDM_2 + 0x0E,
    ENHANCING_MAGIC_DURATION    = MCATEGORY_RDM_2 + 0x10,
    IMMUNOBREAK_CHANCE          = MCATEGORY_RDM_2 + 0x12,
    ENSPELL_DAMAGE              = MCATEGORY_RDM_2 + 0x14,
    ACCURACY                    = MCATEGORY_RDM_2 + 0x16,

    -- THF 2
    ASSASSINS_CHARGE            = MCATEGORY_THF_2 + 0x00,
    FEINT                       = MCATEGORY_THF_2 + 0x02,
    AURA_STEAL                  = MCATEGORY_THF_2 + 0x04,
    AMBUSH                      = MCATEGORY_THF_2 + 0x06,

    -- PLD 2
    FEALTY                      = MCATEGORY_PLD_2 + 0x00,
    CHIVALRY                    = MCATEGORY_PLD_2 + 0x02,
    IRON_WILL                   = MCATEGORY_PLD_2 + 0x04,
    GUARDIAN                    = MCATEGORY_PLD_2 + 0x06,

    -- DRK 2
    DARK_SEAL                   = MCATEGORY_DRK_2 + 0x00,
    DIABOLIC_EYE                = MCATEGORY_DRK_2 + 0x02,
    MUTED_SOUL                  = MCATEGORY_DRK_2 + 0x04,
    DESPERATE_BLOWS             = MCATEGORY_DRK_2 + 0x06,

    -- BST 2
    FERAL_HOWL                  = MCATEGORY_BST_2 + 0x00,
    KILLER_INSTINCT             = MCATEGORY_BST_2 + 0x02,
    BEAST_AFFINITY              = MCATEGORY_BST_2 + 0x04,
    BEAST_HEALER                = MCATEGORY_BST_2 + 0x06,

    -- BRD 2
    NIGHTINGALE                 = MCATEGORY_BRD_2 + 0x00,
    TROUBADOUR                  = MCATEGORY_BRD_2 + 0x02,
    FOE_SIRVENTE                = MCATEGORY_BRD_2 + 0x04,
    ADVENTURERS_DIRGE           = MCATEGORY_BRD_2 + 0x06,
    CON_ANIMA                   = MCATEGORY_BRD_2 + 0x08,
    CON_BRIO                    = MCATEGORY_BRD_2 + 0x0A,

    -- RNG 2
    STEALTH_SHOT                = MCATEGORY_RNG_2 + 0x00,
    FLASHY_SHOT                 = MCATEGORY_RNG_2 + 0x02,
    SNAPSHOT                    = MCATEGORY_RNG_2 + 0x04,
    RECYCLE                     = MCATEGORY_RNG_2 + 0x06,

    -- SAM 2
    SHIKIKOYO                   = MCATEGORY_SAM_2 + 0x00,
    BLADE_BASH                  = MCATEGORY_SAM_2 + 0x02,
    IKISHOTEN                   = MCATEGORY_SAM_2 + 0x04,
    OVERWHELM                   = MCATEGORY_SAM_2 + 0x06,

    -- NIN 2
    SANGE                       = MCATEGORY_NIN_2 + 0x00,
    NINJA_TOOL_EXPERTISE        = MCATEGORY_NIN_2 + 0x02,
    KATON_SAN                   = MCATEGORY_NIN_2 + 0x04,
    HYOTON_SAN                  = MCATEGORY_NIN_2 + 0x06,
    HUTON_SAN                   = MCATEGORY_NIN_2 + 0x08,
    DOTON_SAN                   = MCATEGORY_NIN_2 + 0x0A,
    RAITON_SAN                  = MCATEGORY_NIN_2 + 0x0C,
    SUITON_SAN                  = MCATEGORY_NIN_2 + 0x0E,
    YONIN_EFFECT                = MCATEGORY_NIN_2 + 0x10,
    INNIN_EFFECT                = MCATEGORY_NIN_2 + 0x12,
    NIN_MAGIC_ACCURACY          = MCATEGORY_NIN_2 + 0x14,
    NIN_MAGIC_BONUS             = MCATEGORY_NIN_2 + 0x16,

    -- DRG 2
    DEEP_BREATHING              = MCATEGORY_DRG_2 + 0x00,
    ANGON                       = MCATEGORY_DRG_2 + 0x02,
    EMPATHY                     = MCATEGORY_DRG_2 + 0x04,
    STRAFE                      = MCATEGORY_DRG_2 + 0x06,

    -- SMN 2
    METEOR_STRIKE               = MCATEGORY_SMN_2 + 0x00,
    HEAVENLY_STRIKE             = MCATEGORY_SMN_2 + 0x02,
    WIND_BLADE                  = MCATEGORY_SMN_2 + 0x04,
    GEOCRUSH                    = MCATEGORY_SMN_2 + 0x06,
    THUNDERSTORM                = MCATEGORY_SMN_2 + 0x08,
    GRANDFALL                   = MCATEGORY_SMN_2 + 0x0A,

    -- BLU 2
    CONVERGENCE                 = MCATEGORY_BLU_2 + 0x00,
    DIFFUSION                   = MCATEGORY_BLU_2 + 0x02,
    ENCHAINMENT                 = MCATEGORY_BLU_2 + 0x04,
    ASSIMILATION                = MCATEGORY_BLU_2 + 0x06,

    -- COR 2
    SNAKE_EYE                   = MCATEGORY_COR_2 + 0x00,
    FOLD                        = MCATEGORY_COR_2 + 0x02,
    WINNING_STREAK              = MCATEGORY_COR_2 + 0x04,
    LOADED_DECK                 = MCATEGORY_COR_2 + 0x06,

    -- PUP 2
    ROLE_REVERSAL               = MCATEGORY_PUP_2 + 0x00,
    VENTRILOQUY                 = MCATEGORY_PUP_2 + 0x02,
    FINE_TUNING                 = MCATEGORY_PUP_2 + 0x04,
    OPTIMIZATION                = MCATEGORY_PUP_2 + 0x06,

    -- DNC 2
    SABER_DANCE                 = MCATEGORY_DNC_2 + 0x00,
    FAN_DANCE                   = MCATEGORY_DNC_2 + 0x02,
    NO_FOOT_RISE                = MCATEGORY_DNC_2 + 0x04,
    CLOSED_POSITION             = MCATEGORY_DNC_2 + 0x06,

    -- SCH 2
    ALTRUISM                    = MCATEGORY_SCH_2 + 0x00,
    FOCALIZATION                = MCATEGORY_SCH_2 + 0x02,
    TRANQUILITY                 = MCATEGORY_SCH_2 + 0x04,
    EQUANIMITY                  = MCATEGORY_SCH_2 + 0x06,
    ENLIGHTENMENT               = MCATEGORY_SCH_2 + 0x08,
    STORMSURGE                  = MCATEGORY_SCH_2 + 0x0A,

    -- GEO 2
    MENDING_HALATION            = MCATEGORY_GEO_2 + 0x00,
    RADIAL_ARCANA               = MCATEGORY_GEO_2 + 0x02,
    CURATIVE_RECANTATION        = MCATEGORY_GEO_2 + 0x04,
    PRIMEVAL_ZEAL               = MCATEGORY_GEO_2 + 0x06,
	
	-- RUN 2
    BATTUTA                     = MCATEGORY_RUN_2 + 0x00,
    RAYKE                       = MCATEGORY_RUN_2 + 0x02,
    INSPIRATION                 = MCATEGORY_RUN_2 + 0x04,
    SLEIGHT_OF_SWORD            = MCATEGORY_RUN_2 + 0x06,
}

------------------------------------
-- Inventory locations
------------------------------------

tpz.inventoryLocation =
{
    INVENTORY        = 0,
    MOGSAFE          = 1,
    STORAGE          = 2,
    TEMPITEMS        = 3,
    MOGLOCKER        = 4,
    MOGSATCHEL       = 5,
    MOGSACK          = 6,
    MOGCASE          = 7,
    WARDROBE         = 8,
    MOGSAFE2         = 9,
    WARDROBE2        = 10,
    WARDROBE3        = 11,
    WARDROBE4        = 12,
    WARDROBE5        = 13,
    WARDROBE6        = 14,
    WARDROBE7        = 15,
    WARDROBE8        = 16,
    RECYCLEBIN       = 17,
    MAX_CONTAINER_ID = 18,
}
tpz.inv = tpz.inventoryLocation

------------------------------------
-- Equipment Slots
------------------------------------

tpz.slot =
{
    MAIN   = 0,
    SUB    = 1,
    RANGED = 2,
    AMMO   = 3,
    HEAD   = 4,
    BODY   = 5,
    HANDS  = 6,
    LEGS   = 7,
    FEET   = 8,
    NECK   = 9,
    WAIST  = 10,
    EAR1   = 11,
    EAR2   = 12,
    RING1  = 13,
    RING2  = 14,
    BACK   = 15,
}
tpz.MAX_SLOTID  = 15

----------------------------------
-- Objtype Definitions
----------------------------------

tpz.objType =
{
    PC     = 0x01,
    NPC    = 0x02,
    MOB    = 0x04,
    PET    = 0x08,
    SHIP   = 0x10,
    TRUST  = 0x20,
    FELLOW = 0x40,
}

----------------------------------
-- Attack Type
----------------------------------

tpz.attackType =
{
    NONE     = 0,
    PHYSICAL = 1,
    MAGICAL  = 2,
    RANGED   = 3,
    SPECIAL  = 4,
    BREATH   = 5,
}

----------------------------------
-- Damage Type
----------------------------------

tpz.damageType =
{
    NONE      = 0,
    PIERCING  = 1,
    SLASHING  = 2,
    BLUNT     = 3,
    HTH       = 4,
    ELEMENTAL = 5,
    FIRE      = 6,
    ICE       = 7,
    WIND      = 8,
    EARTH     = 9,
    LIGHTNING = 10,
    WATER     = 11,
    LIGHT     = 12,
    DARK      = 13,
}

----------------------------------
-- Drop Type (not currently used in code base)
----------------------------------

-- DROP_NORMAL  = 0x00
-- DROP_GROUPED = 0x01
-- DROP_STEAL   = 0x02
-- DROP_DESPOIL = 0x04

----------------------------------
-- Allegiance
----------------------------------

tpz.allegiance =
{
    MOB       = 0,
    PLAYER    = 1,
    SAN_DORIA = 2,
    BASTOK    = 3,
    WINDURST  = 4,
}

----------------------------------
-- Targetting for auras relative to objtype
----------------------------------

tpz.auraTarget =
{
    ALLIES  = 0,
    ENEMIES = 1,
};

------------------------------------
-- MOBMODs
-- maps src/map/mob_modifier.h
-- always edit both
------------------------------------

tpz.mobMod =
{
    NONE                = 0,
    GIL_MIN             = 1,  -- minimum gil drop -- spawn mod only
    GIL_MAX             = 2,  -- maximum gil drop -- spawn mod only
    MP_BASE             = 3,  -- Give mob mp. Used for mobs that are not mages, wyverns, avatars
    SIGHT_RANGE         = 4,  -- sight range
    SOUND_RANGE         = 5,  -- sound range
    BUFF_CHANCE         = 6,  -- % chance to buff (combat only)
    GA_CHANCE           = 7,  -- % chance to use -ga spell
    HEAL_CHANCE         = 8,  -- % chance to use heal
    HP_HEAL_CHANCE      = 9,  -- can cast cures below this HP %
    SUBLINK             = 10, -- sub link group
    LINK_RADIUS         = 11, -- link radius
    DRAW_IN             = 12, -- 1 - player draw in, 2 - alliance draw in -- only add as a spawn mod!
    SEVERE_SPELL_CHANCE = 13, -- % chance to use a severe spell like death or impact
    SKILL_LIST          = 14, -- uses given mob skill list
    MUG_GIL             = 15, -- amount gil carried for mugging
    -- 16 Available for use
    NO_DESPAWN          = 17, -- do not despawn when too far from spawn. Gob Diggers have this.
    VAR                 = 18, -- temp var for whatever. Gets cleared on spawn
    CAN_SHIELD_BLOCK    = 19, -- Toggle shield use for mobs without physical shields (trusts)
    TP_USE_CHANCE       = 20, -- % chance to use tp
    PET_SPELL_LIST      = 21, -- set pet spell list
    NA_CHANCE           = 22, -- % chance to cast -na
    IMMUNITY            = 23, -- immune to set status effects. This only works from the db, not scripts
    GRADUAL_RAGE        = 24, -- (!) TODO: NOT YET IMPLEMENTED -- gradually rages
    BUILD_RESIST        = 25, -- (!) TODO: NOT YET IMPLEMENTED -- builds resistance to given effects
    SUPERLINK           = 26, -- super link group. Only use this in mob_spawn_mods / scripts!
    SPELL_LIST          = 27, -- set spell list
    EXP_BONUS           = 28, -- bonus exp (bonus / 100) negative values reduce exp.
    ASSIST              = 29, -- mobs will assist me
    SPECIAL_SKILL       = 30, -- give special skill
    ROAM_DISTANCE       = 31, -- distance allowed to roam from spawn
    -- 32 Available for use
    SPECIAL_COOL        = 33, -- cool down for special
    MAGIC_COOL          = 34, -- cool down for magic
    STANDBACK_COOL      = 35, -- cool down time for standing back (casting spell while not in attack range)
    ROAM_COOL           = 36, -- cool down time in seconds after roaming
    ALWAYS_AGGRO        = 37, -- aggro regardless of level. Spheroids
    NO_DROPS            = 38, -- If set monster cannot drop any items, not even seals.
    SHARE_POS           = 39, -- share a pos with another mob (eald'narche exoplates)
    TELEPORT_CD         = 40, -- cooldown for teleport abilities (tarutaru AA, angra mainyu, eald'narche)
    TELEPORT_START      = 41, -- mobskill ID to begin teleport
    TELEPORT_END        = 42, -- mobskill ID to end teleport
    TELEPORT_TYPE       = 43, -- teleport type - 1: on cooldown, 2 - to close distance
    DUAL_WIELD          = 44, -- enables a mob to use their offhand in attacks
    ADD_EFFECT          = 45, -- enables additional effect script to process on mobs attacks
    AUTO_SPIKES         = 46, -- enables additional effect script to process when mob is attacked
    SPAWN_LEASH         = 47, -- forces a mob to not move farther from its spawn than its leash distance
    SHARE_TARGET        = 48, -- mob always targets same target as ID in this var
    CHECK_AS_NM         = 49, -- If set, a mob will check as a NM.
    -- 50 Available for use
    ROAM_TURNS          = 51, -- Maximum amount of turns during a roam
    ROAM_RATE           = 52, -- Roaming frequency. roam_cool - rand(roam_cool / (roam_rate / 10))
    BEHAVIOR            = 53, -- Add behaviors to mob
    GIL_BONUS           = 54, -- Allow mob to drop gil. Multiplier to gil dropped by mob (bonus / 100) * total
    IDLE_DESPAWN        = 55, -- Time (in seconds) to despawn after being idle
    HP_STANDBACK        = 56, -- mob will always standback with hp % higher to value
    MAGIC_DELAY         = 57, -- Amount of seconds mob waits before casting first spell
    SPECIAL_DELAY       = 58, -- Amount of seconds mob waits before using first special
    WEAPON_BONUS        = 59, -- Add a bonus percentage to mob weapon damage ( bonus / 100 )
    SPAWN_ANIMATIONSUB  = 60, -- reset animationsub to this on spawn
    HP_SCALE            = 61, -- Scale the mobs max HP. ( hp_scale / 100 ) * maxhp
    NO_STANDBACK        = 62, -- Mob will never standback
    ATTACK_SKILL_LIST   = 63, -- skill list to use in place of regular attacks
    CHARMABLE           = 64, -- mob is charmable
    NO_MOVE             = 65, -- Mob will not be able to move
    MULTI_HIT           = 66, -- Mob will have as many swings as defined.
    NO_AGGRO            = 67, -- If set, mob cannot aggro until unset.
    ALLI_HATE           = 68, -- Range around target to add alliance member to enmity list.
    NO_LINK             = 69, -- If set, mob cannot link until unset.
    NO_REST             = 70, -- Mob cannot regain hp (e.g. re-burrowing antlions during ENM).
}

------------------------------------
-- Job Specials (1hr / 2hr moves)
------------------------------------

tpz.jobSpecialAbility =
{
    MIGHTY_STRIKES      = 688,
    MIGHTY_STRIKES_MAAT = 1008,
    -- MIGHTY_STRIKES      = 2242,
    -- MIGHTY_STRIKES      = 2939,
    BENEDICTION         = 689,
    BENEDICTION_MAAT    = 1010,
    BENEDICTION_PRISHE  = 1486,
    -- BENEDICTION         = 2244,
    -- BENEDICTION         = 2777,
    -- BENEDICTION         = 2943,
    -- HUNDRED_FISTS       = 303,
    HUNDRED_FISTS        = 690,
    HUNDRED_FISTS_MAAT   = 1009,
    HUNDRED_FISTS_PRISHE = 1485,
    -- HUNDRED_FISTS       = 2020,
    -- HUNDRED_FISTS       = 2243,
    MANAFONT             = 691 ,
    MANAFONT_MAAT        = 1011,
    -- MANAFONT            = 2245,
    -- MANAFONT            = 2944,
    CHAINSPELL           = 692,
    CHAINSPELL_MAAT      = 1012,
    -- CHAINSPELL          = 2246,
    -- CHAINSPELL          = 2942,
    PERFECT_DODGE        = 693,
    PERFECT_DODGE_MAAT   = 1013,
    -- PERFECT_DODGE       = 2247,
    INVINCIBLE           = 694,
    INVINCIBLE_MAAT      = 1014,
    -- INVINCIBLE          = 2248,
    -- INVINCIBLE          = 2379,
    -- INVINCIBLE          = 2940,
    BLOOD_WEAPON         = 695,
    BLOOD_WEAPON_MAAT    = 1015,
    BLOOD_WEAPON_IXDRK   = 2249,
    SOUL_VOICE           = 696,
    SOUL_VOICE_MAAT      = 1018,
    -- SOUL_VOICE          = 2251,
    MEIKYO_SHISUI        = 730,
    MEIKYO_SHISUI_MAAT   = 1020,
    -- MEIKYO_SHISUI        = 2253,
    -- MEIKYO_SHISUI        = 3175,
    MIJIN_GAKURE         = 731,
    MIJIN_GAKURE_MAAT    = 1021,
    -- MIJIN_GAKURE         = 2105,
    -- MIJIN_GAKURE         = 2254,
    -- MIJIN_GAKURE         = 2382,
    CALL_WYVERN          = 732,
    CALL_WYVERN_MAAT     = 1022,
    FAMILIAR             = 740,
    FAMILIAR_MAAT        = 1016,
    -- FAMILIAR             = 2250,
    ASTRAL_FLOW          = 734,
    ASTRAL_FLOW_MAAT     = 1023,
    -- ASTRAL_FLOW          = 2256,
    -- Eagle Eye Shot has a TON of duplicates because mob models animate differently
    -- EES_?                = 413,
    -- EES_?                = 711,
    -- EES_?                = 712,
    EES_GOBLIN           = 735,
    EES_ANTICA           = 736,
    EES_ORC              = 737,
    EES_SHADE            = 738,
    EES_GIGA             = 739,
    EES_MAAT             = 1019,
    -- EES_?                = 1065,
    -- EES_?                = 1091,
    EES_YAGUDO           = 1121,
    EES_QUADAV           = 1122,
    EES_KINDRED          = 1151,
    -- EES_?                = 1153,
    -- EES_?                = 1327,
    EES_AERN             = 1389,
    -- EES_?                = 1557,
    -- EES_?                = 1641,
    EES_LAMIA            = 1931,
    EES_MERROW           = 1932,
    -- EES_?                = 2148,
    EES_TROLL            = 2252,
    -- EES_?                = 2941,
    -- SPIRIT_SURGE         = 1893,
    -- SPIRIT_SURGE         = 2255,
    AZURE_LORE           = 1933,
    -- AZURE_LORE           = 2006,
    -- AZURE_LORE           = 2257,
    -- AZURE_LORE           = 3481,
    -- WILD_CARD            = 1934,
    -- WILD_CARD            = 2007,
    -- WILD_CARD            = 2258,
    -- OVERDRIVE            = 1935,
    -- OVERDRIVE            = 2008,
    -- OVERDRIVE            = 2259,
    -- TABULA_RASA          = 2358,
    -- TABULA_RASA          = 2261,
    -- TABULA_RASA          = 2358,
    -- TRANCE               = 2260,
    -- TRANCE               = 2710,
    -- ELEMENTAL_SFORZO     = 3265,
    -- ELEMENTAL_SFORZO     = 3479,
     BOLSTER              = 3482,
}
tpz.jsa = tpz.jobSpecialAbility

------------------------------------
-- Skills
------------------------------------

tpz.skill =
{
    -- Combat Skills
    NONE = 0,
    HAND_TO_HAND = 1,
    DAGGER = 2,
    SWORD = 3,
    GREAT_SWORD = 4,
    AXE = 5,
    GREAT_AXE = 6,
    SCYTHE = 7,
    POLEARM = 8,
    KATANA = 9,
    GREAT_KATANA = 10,
    CLUB = 11,
    STAFF = 12,
    -- 13~21 unused
    AUTOMATON_MELEE = 22,
    AUTOMATON_RANGED = 23,
    AUTOMATON_MAGIC = 24,
    ARCHERY = 25,
    MARKSMANSHIP = 26,
    THROWING = 27,

    -- Defensive Skills
    GUARD = 28,
    EVASION = 29,
    SHIELD = 30,
    PARRY = 31,

    -- Magic Skills
    DIVINE_MAGIC = 32,
    HEALING_MAGIC = 33,
    ENHANCING_MAGIC = 34,
    ENFEEBLING_MAGIC = 35,
    ELEMENTAL_MAGIC = 36,
    DARK_MAGIC = 37,
    SUMMONING_MAGIC = 38,
    NINJUTSU = 39,
    SINGING = 40,
    STRING_INSTRUMENT = 41,
    WIND_INSTRUMENT = 42,
    BLUE_MAGIC = 43,
    GEOMANCY = 44,
    HANDBELL = 45,
    -- 45~47 unused

    -- Crafting Skills
    FISHING      = 48,
    WOODWORKING  = 49,
    SMITHING     = 50,
    GOLDSMITHING = 51,
    CLOTHCRAFT   = 52,
    LEATHERCRAFT = 53,
    BONECRAFT    = 54,
    ALCHEMY      = 55,
    COOKING      = 56,
    SYNERGY      = 57,

    -- Other Skills
    RID          = 58,
    DIG          = 59,
    -- 60~63 unused
    -- MAX_SKILLTYPE = 64
}

------------------------------------
-- Craft Skill Ranks
------------------------------------

tpz.craftRank =
{
    AMATEUR     = 0,
    RECRUIT     = 1,
    INITIATE    = 2,
    NOVICE      = 3,
    APPRENTICE  = 4,
    JOURNEYMAN  = 5,
    CRAFTSMAN   = 6,
    ARTISAN     = 7,
    ADEPT       = 8,
    VETERAN     = 9,
    EXPERT      = 10,
    AUTHORITY   = 11,
    LUMINARY    = 12,
    MASTER      = 13,
    GRANDMASTER = 14,
    LEGEND      = 15
    -- 16+ invalid
}

------------------------------------
-- Recast IDs
------------------------------------

tpz.recast =
{
    ITEM     = 0,
    MAGIC    = 1,
    ABILITY  = 2,
}

------------------------------------
-- ACTION IDs
------------------------------------

tpz.action =
{
    NONE                 = 0,
    ATTACK               = 1,
    RANGED_FINISH        = 2,
    WEAPONSKILL_FINISH   = 3,
    MAGIC_FINISH         = 4,
    ITEM_FINISH          = 5,
    JOBABILITY_FINISH    = 6,
    WEAPONSKILL_START    = 7,
    MAGIC_START          = 8,
    ITEM_START           = 9,
    JOBABILITY_START     = 10,
    MOBABILITY_FINISH    = 11,
    RANGED_START         = 12,
    RAISE_MENU_SELECTION = 13,
    DANCE                = 14,
    UNKNOWN_15           = 15,
    ROAMING              = 16,
    ENGAGE               = 17,
    DISENGAGE            = 18,
    CHANGE_TARGET        = 19,
    FALL                 = 20,
    DROPITEMS            = 21,
    DEATH                = 22,
    FADE_OUT             = 23,
    DESPAWN              = 24,
    SPAWN                = 25,
    STUN                 = 26,
    SLEEP                = 27,
    ITEM_USING           = 28,
    ITEM_INTERRUPT       = 29,
    MAGIC_CASTING        = 30,
    MAGIC_INTERRUPT      = 31,
    RANGED_INTERRUPT     = 32,
    MOBABILITY_START     = 33,
    MOBABILITY_USING     = 34,
    MOBABILITY_INTERRUPT = 35,
    LEAVE                = 36,
}
tpz.act = tpz.action

------------------------------------
-- ECOSYSTEM IDs
------------------------------------

tpz.ecosystem =
{
    ERROR          = 0,
    AMORPH         = 1,
    AQUAN          = 2,
    ARCANA         = 3,
    ARCHAICMACHINE = 4,
    AVATAR         = 5,
    BEAST          = 6,
    BEASTMEN       = 7,
    BIRD           = 8,
    DEMON          = 9,
    DRAGON         = 10,
    ELEMENTAL      = 11,
    EMPTY          = 12,
    HUMANOID       = 13,
    LIZARD         = 14,
    LUMORIAN       = 15,
    LUMINION       = 16,
    PLANTOID       = 17,
    UNCLASSIFIED   = 18,
    UNDEAD         = 19,
    VERMIN         = 20,
    VORAGEAN       = 21,
}
tpz.eco = tpz.ecosystem

------------------------------------
-- Behavior bits
------------------------------------

tpz.behavior =
{
    NONE         = 0x000,
    NO_DESPAWN   = 0x001, -- mob does not despawn on death
    STANDBACK    = 0x002, -- mob will standback forever
    RAISABLE     = 0x004, -- mob can be raised via Raise spells
    AGGRO_AMBUSH = 0x200, -- mob aggroes by ambush
    NO_TURN      = 0x400, -- mob does not turn to face target
}

------------------------------------
-- Elevator IDs
------------------------------------

tpz.elevator =
{
    TIMED_AUTOMATIC           = 0,
    DAVOI_LIFT                = 1,
    PALBOROUGH_MINES_LIFT     = 2,
    FORT_GHELSBA_LIFT         = 3
}

------------------------------------
-- Item Type
-----------------------------------

tpz.itemType =
{
    BASIC       = 0x00,
    GENERAL     = 0x01,
    USABLE      = 0x02,
    PUPPET      = 0x04,
    ARMOR       = 0x08,
    WEAPON      = 0x10,
    CURRENCY    = 0x20,
    FURNISHING  = 0x40,
    LINKSHELL   = 0x80,
}

------------------------------------
-- Animations
------------------------------------

tpz.animation =
{
    NONE                    = 0,
    ATTACK                  = 1,
    -- Death 2              = 2,
    DEATH                   = 3,
    CHOCOBO                 = 5,
    FISHING                 = 6,
    HEALING                 = 7,
    OPEN_DOOR               = 8,
    CLOSE_DOOR              = 9,
    ELEVATOR_UP             = 10,
    ELEVATOR_DOWN           = 11,
    -- seems to be WALLHACK = 28,
    -- seems to be WALLHACK = 31,
    FISHING_NPC             = 32,
    HEALING                 = 33,
    FISHING_FISH            = 38,
    FISHING_CAUGHT          = 39,
    FISHING_ROD_BREAK       = 40,
    FISHING_LINE_BREAK      = 41,
    FISHING_MONSTER         = 42,
    FISHING_STOP            = 43,
    SYNTH                   = 44,
    SIT                     = 47,
    RANGED                  = 48,
    FISHING_START           = 50,
    NEW_FISHING_START       = 56,
    NEW_FISHING_FISH        = 57,
    NEW_FISHING_CAUGHT      = 58,
    NEW_FISHING_ROD_BREAK   = 59,
    NEW_FISHING_LINE_BREAK  = 60,
    NEW_FISHING_MONSTER     = 61,
    NEW_FISHING_STOP        = 62,
    -- 63 through 72 are used with /sitchair
    -- 73 through 83 sitting on air (guessing future use for more chairs..)
    MOUNT                   = 85,
    -- TRUST                = 90, -- This is the animation for a trust NPC spawning in.
}
tpz.anim = tpz.animation

------------------------------------
-- Mounts
------------------------------------

tpz.mount =
{
    CHOCOBO        = 0,
    QUEST_RAPTOR   = 1,
    RAPTOR         = 2,
    TIGER          = 3,
    CRAB           = 4,
    RED_CRAB       = 5,
    BOMB           = 6,
    RAM            = 7,
    MORBOL         = 8,
    CRAWLER        = 9,
    FENRIR         = 10,
    BEETLE         = 11,
    MOOGLE         = 12,
    MAGIC_POT      = 13,
    TULFAIRE       = 14,
    WARMACHINE     = 15,
    XZOMIT         = 16,
    HIPPOGRYPH     = 17,
    SPECTRAL_CHAIR = 18,
    SPHEROID       = 19,
    OMEGA          = 20,
    COEURL         = 21,
    GOOBBUE        = 22,
    RAAZ           = 23,
    LEVITUS        = 24,
    ADAMANTOISE    = 25,
    DHAMEL         = 26,
    DOLL           = 27,
}

------------------------------------
-- Automaton Frame IDs
------------------------------------

tpz.frames =
{
    HARLEQUIN  = 0x20,
    VALOREDGE  = 0x21,
    SHARPSHOT  = 0x22,
    STORMWAKER = 0x23,
}

------------------------------------
-- Item Check Params
------------------------------------

tpz.itemCheck =
{
    NONE    = 0,
    EQUIP   = 1,
    UNEQUIP = 2,
}

------------------------------------
-- Emote Values
------------------------------------
tpz.emote =
{
    POINT = 0,
    BOW = 1,
    SALUTE = 2,
    KNEEL = 3,
    LAUGH = 4,
    CRY = 5,
    NO = 6,
    YES = 7,
    WAVE = 8,
    GOODBYE = 9,
    WELCOME = 10,
    JOY = 11,
    CHEER = 12,
    CLAP = 13,
    PRAISE = 14,
    SMILE = 15,
    POKE = 16,
    SLAP = 17,
    STAGGER = 18,
    SIGH = 19,
    COMFORT = 20,
    SURPRISED = 21,
    AMAZED = 22,
    STARE = 23,
    BLUSH = 24,
    ANGRY = 25,
    DISGUSTED = 26,
    MUTED = 27,
    DOZE = 28,
    PANIC = 29,
    GRIN = 30,
    DANCE = 31,
    THINK = 32,
    FUME = 33,
    DOUBT = 34,
    SULK = 35,
    PSYCH = 36,
    HUH = 37,
    SHOCKED = 38,
    LOGGING = 40,    -- Only used for HELM
    EXCAVATION = 41, -- Only used for HELM
    HARVESTING = 42, -- Only used for HELM
    HURRAY = 43,
    TOSS = 44,
    DANCE1 = 65,
    DANCE2 = 66,
    DANCE3 = 67,
    DANCE4 = 68,
    JOB = 74
}

tpz.emoteMode =
{
    ALL = 0,
    TEXT = 1,
    MOTION = 2
}

------------------------------------
-- Relic/Mythic/Empyrean tables
------------------------------------

tpz.relicIDs =
{
    SPHARAI       = 0,
    MANDAU        = 1,
    EXCALIBUR     = 2,
    RAGNAROK      = 3,
    GUTTLER       = 4,
    BRAVURA       = 5,
    APOCALYPSE    = 6,
    GUNGNIR       = 7,
    KIKOKU        = 8,
    AMANOMURAKUMO = 9,
    MJOLLNIR      = 10,
    CLAUSTRUM     = 11,
    YOICHINOYUMI  = 12,
    ANNIHILATOR   = 13,
    GJALLARHORN   = 14,
    AEGIS         = 15
}

tpz.relicTiers =
{
    [tpz.relicIDs.SPHARAI] =
    {
        18264, 18265, 18637, 18651, 18665, 19746, 19839, 20480, 20481, 20509
    },
    [tpz.relicIDs.MANDAU] =
    {
        18270, 18271, 18638, 18652, 18666, 19747, 19840, 20555, 20556, 20583
    },
    [tpz.relicIDs.EXCALIBUR] =
    {
        18276, 18277, 18639, 18653, 18667, 19748, 19841, 20645, 20646, 20685
    },
    [tpz.relicIDs.RAGNAROK] =
    {
        18282, 18283, 18640, 18654, 18668, 19749, 19842, 20745, 20746, 21683
    },
    [tpz.relicIDs.GUTTLER] =
    {
        18288, 18289, 18641, 18655, 18669, 19750, 19843, 20790, 20791, 21750
    },
    [tpz.relicIDs.BRAVURA] =
    {
        18294, 18295, 18642, 18656, 18670, 19751, 19844, 20835, 20836, 21756
    },
    [tpz.relicIDs.APOCALYPSE] =
    {
        18306, 18307, 18644, 18658, 18672, 19753, 19846, 20880, 20881, 21808
    },
    [tpz.relicIDs.GUNGNIR] =
    {
        18300, 18301, 18643, 18657, 18671, 19752, 19845, 20925, 20926, 21857
    },
    [tpz.relicIDs.KIKOKU] =
    {
        18312, 18313, 18645, 18659, 18673, 19754, 19847, 20970, 20971, 21906
    },
    [tpz.relicIDs.AMANOMURAKUMO] =
    {
        18318, 18319, 18646, 18660, 18674, 19755, 19848, 21015, 21016, 21954
    },
    [tpz.relicIDs.MJOLLNIR] =
    {
        18324, 18325, 18647, 18661, 18675, 19756, 19849, 21060, 21061, 21077
    },
    [tpz.relicIDs.CLAUSTRUM] =
    {
        18330, 18331, 18648, 18662, 18676, 19757, 19850, 21135, 21136, 22060
    },
    [tpz.relicIDs.YOICHINOYUMI] =
    {
        18348, 18349, 18650, 18664, 18678, 19759, 19852, 21210, 21211, 22115, 22129
    },
    [tpz.relicIDs.ANNIHILATOR] =
    {
        18336, 18337, 18649, 18663, 18677, 19758, 19851, 21260, 21261, 21267, 22140
    },
    [tpz.relicIDs.GJALLARHORN] =
    {
        18342, 18577, 18578, 18579, 18580, 18572, 18840
    },
    [tpz.relicIDs.AEGIS] =
    {
        15070, 16195, 16196, 16197, 16198, 11927, 16200
    },
}

-- Currently only used for GEO cardinal Chant
-- Mainly just a reference.
tpz.cardinalDirection =
{
    [1]  = '[N]',
    [2]  = '[NNE]',
    [3]  = '[NE]',
    [4]  = '[ENE]',
    [5]  = '[E]',
    [6]  = '[ESE]',
    [7]  = '[SE]',
    [8]  = '[SSE]',
    [9]  = '[S]',
    [10] = '[SSW]',
    [11] = '[SW]',
    [12] = '[WSW]',
    [13] = '[W]',
    [14] = '[WNW]',
    [15] = '[NW]',
    [16] = '[NNW]',
}