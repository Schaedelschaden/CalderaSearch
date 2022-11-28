-----------------------------------
-- Area: Escha - Zitah
--   NM: Urmahlulu
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/spell_data")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 360)
    -- TODO: Add Enthunder, vary strength with "charge"
	-- mob:setMod(tpz.mod.PARALYZERES, 30)
    mob:setMod(tpz.mod.STUNRES, 70)
    -- mob:setMod(tpz.mod.BINDRES, 30)
    -- mob:setMod(tpz.mod.SLOWRES, 30)
    mob:setMod(tpz.mod.SILENCERES, 50)
    mob:setMod(tpz.mod.SLEEPRES, 50)
    mob:setMod(tpz.mod.LULLABYRES, 50)
    -- mob:setMod(tpz.mod.PETRIFYRES, 30)
    -- mob:setMod(tpz.mod.POISONRES, 30)
    mob:addMod(tpz.mod.STR, 75)
    mob:addMod(tpz.mod.DEX, 75)
    mob:addMod(tpz.mod.VIT, 75)
    mob:addMod(tpz.mod.AGI, 75)
    mob:addMod(tpz.mod.INT, 75)
    mob:addMod(tpz.mod.MND, 75)
    mob:addMod(tpz.mod.CHR, 75)
	-- mob:setMod(tpz.mod.ATT, 900)
	mob:addMod(tpz.mod.MATT, 175)
    mob:addMod(tpz.mod.ACC, 100)
	mob:addMod(tpz.mod.EVA, 100)
	mob:addMod(tpz.mod.DEF, 300)
	mob:setMod(tpz.mod.MEVA, 150)
	mob:addMod(tpz.mod.DMGPHYS, -25)
    mob:addMod(tpz.mod.DMGMAGIC, 25)
	-- mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 5000) -- 50% every 400 ms
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))

    -- mob:addListener("WEAPONSKILL_STATE_EXIT", "THUNDERBOLT_USED", function(mob, skillID)
		-- if skillID == 629 then
            
		-- end
    -- end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("ONMOBFIGHT_PAUSE_TIME") then
        if mob:getLocalVar("LTNG_COUNTER") == 10 then
            mob:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, 40)
            mob:useMobAbility(629)

            npc:timer(10000, function(npc)
                local charge = mob:getLocalVar("LTNG_COUNTER")

                mob:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, -40)
                mob:addMod(tpz.mod.STUNRES, -3 * charge)
                mob:addMod(tpz.mod.MAIN_DMG_RATING, -15 * charge)
                mob:addMod(tpz.mod.DOUBLE_ATTACK, -5 * charge)
                mob:addMod(tpz.mod.DMGPHYS, -5 * charge)
                mob:addMod(tpz.mod.DMGMAGIC, 5 * charge)
                mob:addMod(tpz.mod.HASTE_MAGIC, -250 * charge)
                mob:addMod(tpz.mod.HASTE_ABILITY, -250 * charge)
                mob:addMod(tpz.mod.ATT, -50 * charge)
                mob:addMod(tpz.mod.MATT, -5 * charge)
                mob:addMod(tpz.mod.DEF, 25 * charge)
                mob:addMod(tpz.mod.EVA, 25 * charge)
                mob:addMod(tpz.mod.FASTCAST, -10 * charge)
                mob:setLocalVar("LTNG_COUNTER", 0)
            end)

            mob:setLocalVar("LTNG_COUNTER", 0)
        end

        mob:setLocalVar("ONMOBFIGHT_PAUSE_TIME", os.time() + 2)
    end
end

function onSpellPrecast(mob, spell)
    if spell:getElement() == tpz.magic.element.THUNDER and mob:getLocalVar("LTNG_COUNTER") < 10 then
        mob:setLocalVar("LTNG_COUNTER", mob:getLocalVar("LTNG_COUNTER") + 1)
        mob:addMod(tpz.mod.STUNRES, 3)
        mob:addMod(tpz.mod.MAIN_DMG_RATING, 15)
        mob:addMod(tpz.mod.DOUBLE_ATTACK, 5)
        mob:addMod(tpz.mod.DMGPHYS, 5)
        mob:addMod(tpz.mod.DMGMAGIC, -5)
        mob:addMod(tpz.mod.HASTE_MAGIC, 250)
        mob:addMod(tpz.mod.HASTE_ABILITY, 250)
        mob:addMod(tpz.mod.ATT, 50)
        mob:addMod(tpz.mod.MATT, 5)
        mob:addMod(tpz.mod.DEF, -25)
        mob:addMod(tpz.mod.EVA, -25)
        mob:addMod(tpz.mod.FASTCAST, 10)
    end
end

function onMobDeath(mob, player, isKiller)
    -- mob:removeListener("THUNDERBOLT_USED")
    local playerName  = player:getName()
	local mobName     = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end
