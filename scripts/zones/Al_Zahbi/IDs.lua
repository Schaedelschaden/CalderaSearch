-----------------------------------
-- Area: Al_Zahbi
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.AL_ZAHBI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED   = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6390, -- Obtained: <item>.
        GIL_OBTAINED              = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6393, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS       = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY   = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER              = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        FISHING_MESSAGE_OFFSET    = 7054, -- You can't fish here.
        MOG_LOCKER_OFFSET         = 7393, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        HOMEPOINT_SET             = 7539, -- Home point set!
        IMAGE_SUPPORT_ACTIVE      = 7562, -- You have to wait a bit longer before asking for synthesis image support again.
        IMAGE_SUPPORT             = 7564, -- Your [fishing/woodworking/smithing/goldsmithing/clothcraft/leatherworking/bonecraft/alchemy/cooking] skills went up [a little/ever so slightly/ever so slightly].
        KAHAHHOBICHAI_SHOP_DIALOG = 7623, -- Step rrright up to Kahah Hobichai's Blades! We've got everything your battle-thirrrsty heart desires!
        ALLARD_SHOP_DIALOG        = 7629, -- Hey, how ya doin'? Welcome to the armor shop of the Ulthalam Parade's leading star--Allard, in the flesh!
        ZAFIF_SHOP_DIALOG         = 7635, -- Welcome... I'm Zafif, and this is my magic shop... I hope you can find something of use here.
        CHAYAYA_SHOP_DIALOG       = 7641, -- Chayaya's Projectiles! Get your darts and more at Chayaya's Projectiles! Just don't touch the stuff in the high drawers, okay?
        NEED_CANDESCENCE_BACK     = 7694, -- ...Hm? You! Yes, you! What do you think you're staring at, anyway? Go get the Astral Candescence back, and now!
        ITEM_DELIVERY_DIALOG      = 7845, -- No need to wrap your goods. Just hand them over and they're as good as delivered! (I've got to be nice as long as the manager's got his eye on me...)
        DEHBI_MOSHAL_SHOP_DIALOG  = 7849, -- Welcome to the Carpenters' Guild!
        NDEGO_SHOP_DIALOG         = 7851, -- The Blacksmiths' Guild thanks you for your business!
        BORNAHN_SHOP_DIALOG       = 7853, -- Welcome! We have all your goldsmithing needs right here!
        TATEN_BILTEN_SHOP_DIALOG  = 7855, -- Weave something beautiful with the materials you buy here, okay?
        CHOCOBO_HAPPY             = 7858, -- The chocobo appears to be extremely happy.
        SANCTION                  = 7983, -- You have received the Empire's Sanction.
    },
    mob =
    {
        GULOOL_JA_JA                        = 16973900,
        DECIMATER_MABEL_JA                  = 16973902,
        THUNDERCLAP_SAREEL_JA               = 16973903,
        THUNDERBOLT_PIRAAL_JA               = 16973904,
        PANURGIC_RYUBOOL_JA                 = 16973905,
        SAGELORD_MOLAAL_JA                  = 16973906,
        STRIFELORD_BAKOOL_JA                = 16973907,
        EIDOLIC_QUFEEL_JA                   = 16973911,
        SEARING_VOGAAL_JA                   = 16973919,
        SCALDING_FAFOOL_JA                  = 16973920,
        BATTERINGBUGARD                     = 16973867,
        BRONTOBUGARD                        = 16973896,
        ILLUYANKAS                          = 16973901,
        AERIAL_TORPEDO                      = 16973989,
        KILLING_CLAW                        = 16973998,
        GURFURLUR_THE_MENACING              = 16974002,
        GERE                                = 16974003,
        GIRZORHOR_THE_IMPRUDENT             = 16974004,
        SURMERDAR_THE_UNBRIDLED             = 16974005,
        DARTORGOR_THE_AUSTERE               = 16974006,
        VORPORLOR_THE_BARBARIC              = 16974007,
        VORJIRZUR_THE_VALIANT               = 16974008,
        WORDORBOR_THE_ARTIFICER             = 16974009,
        XARHORKUR_THE_CLAVIGER              = 16974014,
        ZURMURWUR_THE_RUTHLESS              = 16974015,
        BHOOT_INVADER                       = 16974084,
        PINING_ABAZOHN                      = 16974098,
        NEMEAN_LION                         = 16974103,
        GENERAL_RUGHA                       = 16974135,
        GENERAL_GADALAR                     = 16974136,
        GENERAL_NAJELITH                    = 16974137,
        GENERAL_ZAZARG                      = 16974138,
        GENERAL_MIHLI                       = 16974139,
        VOLUNTEER_GADALAR_1                 = 16974140,
        VOLUNTEER_GADALAR_2                 = 16974141,
        IMPERIAL_TROOPER_MIHLI_1            = 16974143,
        IMPERIAL_TROOPER_MIHLI_2            = 16974144,
        IMMORTAL_GUARD_RUGHA_1              = 16974150,
        IMMORTAL_GUARD_RUGHA_2              = 16974151,
        QIQIRN_FREELANCE_NAJELITH_1         = 16974189,
        QIQIRN_FREELANCE_NAJELITH_2         = 16974190,
        GOBLIN_LASQUENET_ZAZARG_1           = 16974194,
        GOBLIN_LASQUENET_ZAZARG_2           = 16974195,
        MEDUSA                              = 16974102,
        LAMIA_NO_34                         = 16974104,
        LAMIA_NO_21                         = 16974105,
        LAMIA_NO_15                         = 16974106,
        MERROW_NO_11                        = 16974107,
        LAMIA_NO_9                          = 16974108,
        MERROW_NO_12                        = 16974115,
        LAMIA_NO_3                          = 16974116,
        LAMIA_NO_2                          = 16974117,
    },
    npc =
    {
        RUGHADJEEN      = 16974300,
        GADALAR         = 16974301,
        MIHLI_ALIAPOH   = 16974302,
        ZAZARG          = 16974303,
        NAJELITH        = 16974304,
    },
}

return zones[tpz.zone.AL_ZAHBI]
