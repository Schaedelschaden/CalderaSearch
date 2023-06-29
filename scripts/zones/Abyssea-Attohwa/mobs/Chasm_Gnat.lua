-----------------------------------
-- Area: Abyssea-Attohwa
--  Mob: Murrain Chigoe
-- Note: This mob does not need chigoe mixin
-- TODO: En-Disease
-----------------------------------
require("scripts/globals/abyssea")
require("scripts/globals/keyitems")
require("scripts/globals/spell_data")
require("scripts/globals/status")
require("scripts/globals/weaponskillids")
require("scripts/globals/zone")
-----------------------------------

local weaknessCat =
{
    ["Red"] = -- Red
    {
        [tpz.weaponskill.RED_LOTUS_BLADE] = {1},
        [tpz.weaponskill.FLAMING_ARROW  ] = {1},
        [tpz.weaponskill.HOT_SHOT       ] = {1},
        [tpz.weaponskill.FREEZEBITE     ] = {2},
        [tpz.weaponskill.BLADE_TO       ] = {2},
        [tpz.weaponskill.CYCLONE        ] = {3},
        [tpz.weaponskill.TACHI_JINPU    ] = {3},
        [tpz.weaponskill.EARTH_CRUSHER  ] = {4},
        [tpz.weaponskill.BLADE_CHI      ] = {4},
        [tpz.weaponskill.RAIDEN_THRUST  ] = {5},
        [tpz.weaponskill.CLOUDSPLITTER  ] = {5},
        [tpz.weaponskill.BLADE_TEKI     ] = {6},
        [tpz.weaponskill.BLADE_YU       ] = {6},
        [tpz.weaponskill.SERAPH_BLADE   ] = {7},
        [tpz.weaponskill.SERAPH_STRIKE  ] = {7},
        [tpz.weaponskill.TACHI_KOKI     ] = {7},
        [tpz.weaponskill.SUNBURST       ] = {7},
        [tpz.weaponskill.ENERGY_DRAIN   ] = {8},
        [tpz.weaponskill.BLADE_EI       ] = {8},
        [tpz.weaponskill.SHADOW_OF_DEATH] = {8},
    },

    ["Yellow"] = -- Yellow
    {
        -- Fire
        [tpz.magic.spell.FIRE_III          ] = {1},
        [tpz.magic.spell.FIRE_IV           ] = {1},
        [tpz.magic.spell.FIRAGA_III        ] = {1},
        [tpz.magic.spell.FLARE             ] = {1},
        [tpz.magic.spell.HEAT_BREATH       ] = {1},
        [tpz.magic.spell.KATON_NI          ] = {1},
        [tpz.magic.spell.ICE_THRENODY      ] = {1},
        -- Ice
        [tpz.magic.spell.BLIZZARD_III      ] = {2},
        [tpz.magic.spell.BLIZZARD_IV       ] = {2},
        [tpz.magic.spell.BLIZZAGA_III      ] = {2},
        [tpz.magic.spell.FREEZE            ] = {2},
        [tpz.magic.spell.ICE_BREAK         ] = {2},
        [tpz.magic.spell.HYOTON_NI         ] = {2},
        [tpz.magic.spell.WIND_THRENODY     ] = {2},
        -- Wind
        [tpz.magic.spell.AERO_III          ] = {3},
        [tpz.magic.spell.AERO_IV           ] = {3},
        [tpz.magic.spell.AEROGA_III        ] = {3},
        [tpz.magic.spell.TORNADO           ] = {3},
        [tpz.magic.spell.MYSTERIOUS_LIGHT  ] = {3},
        [tpz.magic.spell.HUTON_NI          ] = {3},
        [tpz.magic.spell.EARTH_THRENODY    ] = {3},
        -- Earth
        [tpz.magic.spell.STONE_III         ] = {4},
        [tpz.magic.spell.STONE_IV          ] = {4},
        [tpz.magic.spell.STONEGA_III       ] = {4},
        [tpz.magic.spell.QUAKE             ] = {4},
        [tpz.magic.spell.MAGNETITE_CLOUD   ] = {4},
        [tpz.magic.spell.DOTON_NI          ] = {4},
        [tpz.magic.spell.LIGHTNING_THRENODY] = {4},
        -- Thunder
        [tpz.magic.spell.THUNDER_III       ] = {5},
        [tpz.magic.spell.THUNDER_IV        ] = {5},
        [tpz.magic.spell.THUNDAGA_III      ] = {5},
        [tpz.magic.spell.BURST             ] = {5},
        [tpz.magic.spell.MIND_BLAST        ] = {5},
        [tpz.magic.spell.RAITON_NI         ] = {5},
        [tpz.magic.spell.WATER_THRENODY    ] = {5},
        -- Water
        [tpz.magic.spell.WATER_III         ] = {6},
        [tpz.magic.spell.WATER_IV          ] = {6},
        [tpz.magic.spell.WATERGA_III       ] = {6},
        [tpz.magic.spell.FLOOD             ] = {6},
        [tpz.magic.spell.MAELSTROM         ] = {6},
        [tpz.magic.spell.SUITON_NI         ] = {6},
        [tpz.magic.spell.FIRE_THRENODY     ] = {6},
        -- Light
        [tpz.magic.spell.BANISH_II         ] = {7},
        [tpz.magic.spell.BANISH_III        ] = {7},
        [tpz.magic.spell.BANISHGA          ] = {7},
        [tpz.magic.spell.BANISHGA_II       ] = {7},
        [tpz.magic.spell.HOLY              ] = {7},
        [tpz.magic.spell.FLASH             ] = {7},
        [tpz.magic.spell.RADIANT_BREATH    ] = {7},
        [tpz.magic.spell.DARK_THRENODY     ] = {7},
        -- Dark
        [tpz.magic.spell.ASPIR             ] = {8},
        [tpz.magic.spell.DRAIN             ] = {8},
        [tpz.magic.spell.BIO_II            ] = {8},
        [tpz.magic.spell.DISPEL            ] = {8},
        [tpz.magic.spell.EYES_ON_ME        ] = {8},
        [tpz.magic.spell.KURAYAMI_NI       ] = {8},
        [tpz.magic.spell.LIGHT_THRENODY    ] = {8},
    },

    ["Blue"] = -- Blue
    {
        [tpz.weaponskill.RAGING_FISTS   ] = { 1},
        [tpz.weaponskill.SPINNING_ATTACK] = { 1},
        [tpz.weaponskill.HOWLING_FIST   ] = { 1},
        [tpz.weaponskill.DRAGON_KICK    ] = { 1},
        [tpz.weaponskill.ASURAN_FISTS   ] = { 1},
        [tpz.weaponskill.SHADOWSTICH    ] = { 2},
        [tpz.weaponskill.DANCING_EDGE   ] = { 2},
        [tpz.weaponskill.SHARK_BITE     ] = { 2},
        [tpz.weaponskill.EVISCERATION   ] = { 2},
        [tpz.weaponskill.VORPAL_BLADE   ] = { 3},
        [tpz.weaponskill.SWIFT_BLADE    ] = { 3},
        [tpz.weaponskill.SAVAGE_BLADE   ] = { 3},
        [tpz.weaponskill.SPINNING_SLASH ] = { 4},
        [tpz.weaponskill.GROUND_STRIKE  ] = { 4},
        [tpz.weaponskill.MISTRAL_AXE    ] = { 5},
        [tpz.weaponskill.DECIMATION     ] = { 5},
        [tpz.weaponskill.FULL_BREAK     ] = { 6},
        [tpz.weaponskill.STEEL_CYCLONE  ] = { 6},
        [tpz.weaponskill.CROSS_REAPER   ] = { 7},
        [tpz.weaponskill.SPIRAL_HELL    ] = { 7},
        [tpz.weaponskill.SKEWER         ] = { 8},
        [tpz.weaponskill.WHEELING_THRUST] = { 8},
        [tpz.weaponskill.IMPULSE_DRIVE  ] = { 8},
        [tpz.weaponskill.BLADE_TEN      ] = { 9},
        [tpz.weaponskill.BLADE_KU       ] = { 9},
        [tpz.weaponskill.TACHI_GEKKO    ] = {10},
        [tpz.weaponskill.TACHI_KASHA    ] = {10},
        [tpz.weaponskill.SKULLBREAKER   ] = {11},
        [tpz.weaponskill.TRUE_STRIKE    ] = {11},
        [tpz.weaponskill.JUDGMENT       ] = {11},
        [tpz.weaponskill.HEXA_STRIKE    ] = {11},
        [tpz.weaponskill.BLACK_HALO     ] = {11},
        [tpz.weaponskill.HEAVY_SWING    ] = {12},
        [tpz.weaponskill.SHELL_CRUSHER  ] = {12},
        [tpz.weaponskill.FULL_SWING     ] = {12},
        [tpz.weaponskill.SPIRIT_TAKER   ] = {12},
        [tpz.weaponskill.RETRIBUTION    ] = {12},
        [tpz.weaponskill.SIDEWINDER     ] = {13},
        [tpz.weaponskill.BLAST_ARROW    ] = {13},
        [tpz.weaponskill.ARCHING_ARROW  ] = {13},
        [tpz.weaponskill.EMPYREAL_ARROW ] = {13},
        [tpz.weaponskill.SLUG_SHOT      ] = {14},
        [tpz.weaponskill.BLAST_SHOT     ] = {14},
        [tpz.weaponskill.HEAVY_SHOT     ] = {14},
        [tpz.weaponskill.DETONATOR      ] = {14},
    },
}

function onMobSpawn(mob)
    mob:setLocalVar("[CanProc]", 1)
    mob:setLocalVar("[RedWeakness]", tpz.abyssea.getNewRedWeakness(mob))
    mob:setLocalVar("[AbysseaRedProc]", 0)
    mob:setLocalVar("[YellowWeakness]", tpz.abyssea.getNewYellowWeakness(mob))
    mob:setLocalVar("[AbysseaYellowProc]", 0)
    mob:setLocalVar("[BlueWeakness]", tpz.abyssea.getNewBlueWeakness(mob))
    mob:setLocalVar("[AbysseaBlueProc]", 0)

    mob:addListener("MAGIC_TAKE", "ABYSSEA_MAGIC_PROC_CHECK", function(target, caster, spell)
        local ID = zones[caster:getZoneID()]

        if target:canChangeState() then
            if spell:getID() == target:getLocalVar("[YellowWeakness]") then
                tpz.abyssea.procMonster(target, caster, tpz.abyssea.triggerType.YELLOW)
            end
        end

        if caster:hasKeyItem(tpz.ki.ABYSSITE_OF_DISCERNMENT) and math.random(0, 100) < 100 then
            caster:messageSpecial(ID.text.YELLOW_WEAKNESS, weaknessCat["Yellow"][target:getLocalVar("[YellowWeakness]")][1])
        end
    end)
end

function onMobFight(mob, target)
    -- mob:removeListener("ABYSSEA_MAGIC_PROC_CHECK")
end

function onMobDespawn(mob)
    mob:removeListener("ABYSSEA_MAGIC_PROC_CHECK")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("ABYSSEA_MAGIC_PROC_CHECK")
end
