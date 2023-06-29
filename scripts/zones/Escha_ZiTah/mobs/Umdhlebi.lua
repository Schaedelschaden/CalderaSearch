-----------------------------------
-- Area: Escha - Zitah
--   NM: Umdhlebi
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 360)
    mob:SetAutoAttackEnabled(true)
    mob:SetMobSkillAttack(1198) -- Belladonna "normal" attacks
    -- mob:setMod(tpz.mod.PARALYZERES, 30)
    -- mob:setMod(tpz.mod.STUNRES, 70)
    -- mob:setMod(tpz.mod.BINDRES, 30)
    -- mob:setMod(tpz.mod.SLOWRES, 30)
    -- mob:setMod(tpz.mod.SILENCERES, 30)
    -- mob:setMod(tpz.mod.SLEEPRES, 30)
    -- mob:setMod(tpz.mod.LULLABYRES, 30)
    -- mob:setMod(tpz.mod.PETRIFYRES, 30)
    -- mob:setMod(tpz.mod.POISONRES, 30)
    -- mob:setMod(tpz.mod.ATT, 900)
    mob:addMod(tpz.mod.MATT, 186)
    mob:addMod(tpz.mod.ACC, 100)
    -- mob:addMod(tpz.mod.MACC, 300)
    -- mob:setMod(tpz.mod.EVA, 700)
    mob:addMod(tpz.mod.DEF, 200)
    -- mob:setMod(tpz.mod.MEVA, 800)
    -- mob:setMod(tpz.mod.MDEF, 400)
    -- mob:setMod(tpz.mod.FASTCAST, 35)
    mob:setMod(tpz.mod.DMG, -15)
    -- mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 5000) -- 50% every 400 ms
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("ONMOBFIGHT_PAUSE_TIME") then
        local hpp = mob:getHPP()

        if hpp <= 80 and mob:getLocalVar("has2hrd") == 0 then
            mob:useMobAbility(692)
            mob:setLocalVar("has2hrd", 1)
        elseif hpp <= 60 and mob:getLocalVar("has2hrd") == 1 then
            mob:useMobAbility(692)
            mob:setLocalVar("has2hrd", 2)
        elseif hpp <= 40 and mob:getLocalVar("has2hrd") == 2 then
            mob:useMobAbility(692)
            mob:setLocalVar("has2hrd", 3)
        elseif hpp <= 20 and mob:getLocalVar("has2hrd") == 3 then
            mob:useMobAbility(692)
            mob:setLocalVar("has2hrd", 4)
        end

        mob:setLocalVar("ONMOBFIGHT_PAUSE_TIME", os.time() + 1)
    end
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 245 or spell:getID() == 247 then -- Drain and Aspir
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
    end
end

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("Escha_Kamohaolii_KI") == 0 or player:getCharVar("Escha_Kamohaolii_KI") == nil then
        player:setCharVar("Escha_Umdhlebi_KI", 1)
    elseif player:getCharVar("Escha_Kamohaolii_KI") == 1 then
        player:addKeyItem(tpz.keyItem.URMAHLULLUS_ARMOR)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.keyItem.URMAHLULLUS_ARMOR)
        player:setCharVar("Escha_Kamohaolii_KI", 0)
        player:setCharVar("Escha_Umdhlebi_KI", 0)
    end

    local playerName  = player:getName()
    local mobName     = mob:getName()
    local KillCounter = player:getCharVar("KillCounter_"..mobName)

    KillCounter = KillCounter + 1

    player:setCharVar("KillCounter_"..mobName, KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end
