-----------------------------------------
-- Trust: Adelheid
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/spell_data")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

local message_page_offset = 77

local storms =
{
    [tpz.mod.FIRERES   ] = {tpz.effect.FIRESTORM,    tpz.magic.spell.FIRESTORM   },
    [tpz.mod.ICERES    ] = {tpz.effect.HAILSTORM,    tpz.magic.spell.HAILSTORM   },
    [tpz.mod.WINDRES   ] = {tpz.effect.WINDSTORM,    tpz.magic.spell.WINDSTORM   },
    [tpz.mod.EARTHRES  ] = {tpz.effect.SANDSTORM,    tpz.magic.spell.SANDSTORM   },
    [tpz.mod.THUNDERRES] = {tpz.effect.THUNDERSTORM, tpz.magic.spell.THUNDERSTORM},
    [tpz.mod.WATERRES  ] = {tpz.effect.RAINSTORM,    tpz.magic.spell.RAINSTORM   },
}

local helices =
{
    [tpz.effect.FIRESTORM   ] = tpz.magic.spell.PYROHELIX,
    [tpz.effect.HAILSTORM   ] = tpz.magic.spell.CRYOHELIX,
    [tpz.effect.WINDSTORM   ] = tpz.magic.spell.ANEMOHELIX,
    [tpz.effect.SANDSTORM   ] = tpz.magic.spell.GEOHELIX,
    [tpz.effect.THUNDERSTORM] = tpz.magic.spell.IONOHELIX,
    [tpz.effect.RAINSTORM   ] = tpz.magic.spell.HYDROHELIX,
}

local nukes =
{
    [tpz.effect.FIRESTORM   ] = {tpz.magic.spell.FIRE,     tpz.magic.spell.FIRE_II,     tpz.magic.spell.FIRE_III,     tpz.magic.spell.FIRE_IV,     tpz.magic.spell.FIRE_V,     tpz.magic.spell.FIRE_VI},
    [tpz.effect.HAILSTORM   ] = {tpz.magic.spell.BLIZZARD, tpz.magic.spell.BLIZZARD_II, tpz.magic.spell.BLIZZARD_III, tpz.magic.spell.BLIZZARD_IV, tpz.magic.spell.BLIZZARD_V, tpz.magic.spell.BLIZZARD_VI},
    [tpz.effect.WINDSTORM   ] = {tpz.magic.spell.AERO,     tpz.magic.spell.AERO_II,     tpz.magic.spell.AERO_III,     tpz.magic.spell.AERO_IV,     tpz.magic.spell.AERO_V,     tpz.magic.spell.AERO_VI},
    [tpz.effect.SANDSTORM   ] = {tpz.magic.spell.STONE,    tpz.magic.spell.STONE_II,    tpz.magic.spell.STONE_III,    tpz.magic.spell.STONE_IV,    tpz.magic.spell.STONE_V,    tpz.magic.spell.STONE_VI},
    [tpz.effect.THUNDERSTORM] = {tpz.magic.spell.THUNDER,  tpz.magic.spell.THUNDER_II,  tpz.magic.spell.THUNDER_III,  tpz.magic.spell.THUNDER_IV,  tpz.magic.spell.THUNDER_V,  tpz.magic.spell.THUNDER_VI},
    [tpz.effect.RAINSTORM   ] = {tpz.magic.spell.WATER,    tpz.magic.spell.WATER_II,    tpz.magic.spell.WATER_III,    tpz.magic.spell.WATER_IV,    tpz.magic.spell.WATER_V,    tpz.magic.spell.WATER_VI},
}

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)

    -- Records of Eminence: Alter Ego: Adelheid
    if caster:getEminenceProgress(936) then
        tpz.roe.onRecordTrigger(caster, 936)
    end

    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addListener("MAGIC_STATE_EXIT", "CAST_FINISHED", function(mobArg, spell)
		local spellID = spell:getID()

        if
            spellID == tpz.magic.spell.FIRE or
            spellID == tpz.magic.spell.BLIZZARD or
            spellID == tpz.magic.spell.AERO or
            spellID == tpz.magic.spell.STONE or
            spellID == tpz.magic.spell.THUNDER or
            spellID == tpz.magic.spell.WATER
        then
            mobArg:setLocalVar("NUKE_BLOCK_1", os.time() + 2)
        elseif
            spellID == tpz.magic.spell.FIRE_II or
            spellID == tpz.magic.spell.BLIZZARD_II or
            spellID == tpz.magic.spell.AERO_II or
            spellID == tpz.magic.spell.STONE_II or
            spellID == tpz.magic.spell.THUNDER_II or
            spellID == tpz.magic.spell.WATER_II
        then
            mobArg:setLocalVar("NUKE_BLOCK_2", os.time() + 6)
        elseif
            spellID == tpz.magic.spell.FIRE_III or
            spellID == tpz.magic.spell.BLIZZARD_III or
            spellID == tpz.magic.spell.AERO_III or
            spellID == tpz.magic.spell.STONE_III or
            spellID == tpz.magic.spell.THUNDER_III or
            spellID == tpz.magic.spell.WATER_III
        then
            mobArg:setLocalVar("NUKE_BLOCK_3", os.time() + 15)
        elseif
            spellID == tpz.magic.spell.FIRE_IV or
            spellID == tpz.magic.spell.BLIZZARD_IV or
            spellID == tpz.magic.spell.AERO_IV or
            spellID == tpz.magic.spell.STONE_IV or
            spellID == tpz.magic.spell.THUNDER_IV or
            spellID == tpz.magic.spell.WATER_IV
        then
            mobArg:setLocalVar("NUKE_BLOCK_4", os.time() + 30)
        elseif
            spellID == tpz.magic.spell.FIRE_V or
            spellID == tpz.magic.spell.BLIZZARD_V or
            spellID == tpz.magic.spell.AERO_V or
            spellID == tpz.magic.spell.STONE_V or
            spellID == tpz.magic.spell.THUNDER_V or
            spellID == tpz.magic.spell.WATER_V
        then
            mobArg:setLocalVar("NUKE_BLOCK_5", os.time() + 45)
        end
    end)

    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)

    -- mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.NONE)

    local sublimationBonus = mob:getMainLvl() / 11

    mob:addMod(tpz.mod.SUBLIMATION_BONUS, sublimationBonus)
    mob:addMod(tpz.mod.ENH_MAGIC_DURATION, 50)
    mob:addMod(tpz.mod.HELIX_DURATION, mob:getMainLvl())
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 0)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("STORM_DELAY") then
        local hasStorm = false

        for i = tpz.effect.FIRESTORM, tpz.effect.RAINSTORM do
            if mob:hasStatusEffect(i) then
                hasStorm = true
            end
        end

        -- Selects a storm based on the enemy's elemental weakness
        -- If the enemy has no elemental weakness then default to elemental day
        local weakness = 0
        local weakVal  = 0

        -- Ex. FIRERES -25 is weak to Fire
        for i = tpz.mod.FIRERES, tpz.mod.WATERRES do
            if target:getMod(i) < weakVal then
                weakness = i
                weakVal  = target:getMod(i)
                -- printf("adelheid.lua onMobFight  WEAKNESS: [%i] VALUE: [%i]", weakness, weakVal)
            end
        end

        if
            weakness ~= 0 and
            not mob:hasStatusEffect(storms[weakness][1])
        then
            -- printf("adelheid.lua onMobFight  PICKING STORM BASED ON WEAKNESS: [%i]", storms[weakness][2])
            mob:castSpell(storms[weakness][2], mob)
        elseif
            weakness == 0 and
            hasStorm == false
        then
            -- printf("adelheid.lua onMobFight  PICKING RANDOM STORM")
            local pickStorm = math.random(tpz.mod.FIRERES, tpz.mod.WATERRES) -- VanadielDayElement()

            -- Default to the elemental day of the week
            mob:castSpell(storms[pickStorm][2], mob)
        end

        mob:setLocalVar("STORM_DELAY", os.time() + 3)
    end

   -- Selects a Helix based on the current Storm
    if os.time() > mob:getLocalVar("HELIX_DELAY") then
        local currentStorm = 0

        for i = tpz.effect.FIRESTORM, tpz.effect.RAINSTORM do
            if mob:hasStatusEffect(i) then
                currentStorm = i
            end
        end

        if
            currentStorm ~= 0 and
            not target:hasStatusEffect(tpz.effect.HELIX)
        then
            mob:castSpell(helices[currentStorm], target)
        end

        mob:setLocalVar("HELIX_DELAY", os.time() + 3)
    end 

    if os.time() > mob:getLocalVar("NUKE_DELAY") then
        local hasStorm     = false
        local currentStorm = 0
        local nukeTier     = 5

        -- Select tier of nuke to cast
        if mob:getMainLvl() < 79 then
            nukeTier = 4
        elseif mob:getMainLvl() < 70 then
            nukeTier = 3
        elseif mob:getMainLvl() < 54 then
            nukeTier = 2
        elseif mob:getMainLvl() < 30 then
            nukeTier = 1
        end

        for i = tpz.effect.FIRESTORM, tpz.effect.RAINSTORM do
            if mob:hasStatusEffect(i) then
                hasStorm     = true
                currentStorm = i
            end
        end

        if
            hasStorm == true and
            mob:getMP() / mob:getMaxMP() > 0.15
        then
            if
                nukeTier == 5 and
                os.time() < mob:getLocalVar("NUKE_BLOCK_5")
            then
                nukeTier = 4
            end

            if
                nukeTier == 4 and
                os.time() < mob:getLocalVar("NUKE_BLOCK_4")
            then
                nukeTier = 3
            end

            if
                nukeTier == 3 and
                os.time() < mob:getLocalVar("NUKE_BLOCK_3")
            then
                nukeTier = 2
            end

            if
                nukeTier == 2 and
                os.time() < mob:getLocalVar("NUKE_BLOCK_2")
            then
                nukeTier = 1
            end

            mob:castSpell(nukes[currentStorm][nukeTier], target)
            -- printf("adelheid.lua onMobFight  VAR: [%s]  CURRENT OS TIME: [%i]  NEXT TIER AVAILABLE: [%i]", "NUKE_BLOCK_"..nukeTier, os.time(), mob:getLocalVar("NUKE_BLOCK_"..nukeTier))
        end   

        mob:setLocalVar("NUKE_DELAY", os.time() + 10)
    end

    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        -- Sublimation handling
        local mobMPP = mob:getMP() / mob:getMaxMP()

        if
            mob:getHPP() > 50 and
            mobMPP <= 0.99 and
            not mob:hasStatusEffect(tpz.effect.SUBLIMATION_ACTIVATED) and
            not mob:hasStatusEffect(tpz.effect.SUBLIMATION_COMPLETE)
        then
            mob:useJobAbility(233, mob)
        end

        if
            mobMPP <= 0.45 and
            -- ((mob:hasStatusEffect(tpz.effect.SUBLIMATION_ACTIVATED) and
              -- mob:getStatusEffect(tpz.effect.SUBLIMATION_ACTIVATED):getPower() >= 200) or
             mob:hasStatusEffect(tpz.effect.SUBLIMATION_COMPLETE)--)
        then
            mob:useJobAbility(233, mob)
        end

        if
            not mob:hasStatusEffect(tpz.effect.REGEN) and
            mob:getHPP() <= 75
        then
            local regen = tpz.magic.spell.REGEN_V

            if mob:getMainLvl() < 99 then
                regen = tpz.magic.spell.REGEN_IV
            elseif mob:getMainLvl() < 79 then
                regen = tpz.magic.spell.REGEN_III
            elseif mob:getMainLvl() < 59 then
                regen = tpz.magic.spell.REGEN_II
            elseif mob:getMainLvl() < 37 then
                regen = tpz.magic.spell.REGEN
            end

            mob:castSpell(regen, mob)
        end

        local master = mob:getMaster()
        local party  = master:getPartyWithTrusts()
        local mLvl   = mob:getMainLvl()
        local cure   = 1

        if mLvl >= 17 and mLvl <= 29 then
            cure = 2
        elseif mLvl >= 30 and mLvl <= 54 then
            cure = 3
        elseif mLvl >= 55 then
            cure = 4
        end

        for i, v in ipairs(party) do
            if v:getHPP() <= 33 then
                mob:castSpell(cure, v)
            end
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
    end
end

function onMobDespawn(mob)
    mob:removeListener("CAST_FINISHED")
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    mob:removeListener("CAST_FINISHED")
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
