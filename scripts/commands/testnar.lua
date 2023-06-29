---------------------------------------------------------------------------------------------------
-- func: !test
-- desc: Use this to test LUA functions
---------------------------------------------------------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/utils")
require("scripts/globals/status")
require("scripts/globals/ability")
require("scripts/globals/magicburst")
require("scripts/globals/magic")
require("scripts/globals/msg")

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
---------------------------------------------------------------------------------------------------

    local derp = math.random(0, 4)
    player:PrintToPlayer(string.format("test.lua onTrigger  DERP: [%i]", derp), tpz.msg.channel.NS_LINKSHELL3)

---------------------------------------------------------------------------------------------------

    -- local target = player:getCursorTarget()
    -- target:hideName(false)

-- local ID = zones[player:getZoneID()]

-- player:messageSpecial(ID.text.YELLOW_WEAKNESS, 1)

---------------------------------------------------------------------------------------------------

-- Generate a random table for 20 material requirements on 110 pieces of gear
    -- for i = 1, 110 do
        -- printf("%i, %i, %i, %i, %i, %i, %i", math.random(1, 20), math.random(1, 20), math.random(1, 20), math.random(1, 20), math.random(1, 20), math.random(1, 20), i)
        -- printf("%i, %i, %i, %i", math.random(1, 6), math.random(1, 6), math.random(1, 6), i)
    -- end

---------------------------------------------------------------------------------------------------

-- Test getMobMod
    -- local target = player:getCursorTarget()
    -- local mobMod = target:getMobMod(tpz.mobMod.CHARMABLE)
    -- printf("testnar.lua onTrigger  MOB MOD VALUE: [%i]", mobMod)

---------------------------------------------------------------------------------------------------

-- Test auras
    -- local target = player:getCursorTarget()
    -- local visibleAura = 0

    -- target:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, visibleAura, 9, duration, tpz.effect.SILENCE, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)

---------------------------------------------------------------------------------------------------

-- Remove or set NPC's DISAPPEAR flag
    -- local npc = GetNPCByID(17236304)

    -- npc:setStatus(tpz.status.DISAPPEAR)
    -- npc:setStatus(tpz.status.NORMAL)

---------------------------------------------------------------------------------------------------

    -- local target = GetMobByID(17662479)

    -- target:setHP(0)

---------------------------------------------------------------------------------------------------

-- Test pulling the mob's weapon damage
    -- local target = player:getCursorTarget()
    -- printf("test.lua onTrigger  MOB WEAPON DMG: [%i]", target:getWeaponDmg())

---------------------------------------------------------------------------------------------------

-- Test player countdowns
    -- Numeric value in seconds
    -- Set to 0 to remove countdown box
    -- player:countdown(0)

---------------------------------------------------------------------------------------------------

-- Test elemental resistances in a table (Adelheid Storm and Helix selection)
        -- local target   = player:getCursorTarget()
        -- local weakness = 0
        -- local storms   =
        -- {
            -- [tpz.mod.FIRERES   ] = {tpz.effect.FIRESTORM,    tpz.magic.spell.FIRESTORM   },
            -- [tpz.mod.ICERES    ] = {tpz.effect.HAILSTORM,    tpz.magic.spell.HAILSTORM   },
            -- [tpz.mod.WINDRES   ] = {tpz.effect.WINDSTORM,    tpz.magic.spell.WINDSTORM   },
            -- [tpz.mod.EARTHRES  ] = {tpz.effect.SANDSTORM,    tpz.magic.spell.SANDSTORM   },
            -- [tpz.mod.THUNDERRES] = {tpz.effect.THUNDERSTORM, tpz.magic.spell.THUNDERSTORM},
            -- [tpz.mod.WATERRES  ] = {tpz.effect.RAINSTORM,    tpz.magic.spell.RAINSTORM   },
            -- [tpz.mod.LIGHTRES  ] = {tpz.effect.AURORASTORM,  tpz.magic.spell.AURORASTORM },
            -- [tpz.mod.DARKRES   ] = {tpz.effect.VOIDSTORM,    tpz.magic.spell.VOIDSTORM   },
        -- }

        -- -- Ex. FIRERES -25 is weak to Fire
        -- for i = tpz.mod.FIRERES, tpz.mod.DARKRES do
            -- if target:getMod(i) < weakness then
                -- weakness = i
-- printf("test.lua onTrigger  MOD: [%i]  WEAKNESS: [%i]", i, weakness)
            -- end
        -- end

-- printf("test.lua onTrigger  WEAKNESS: [%i]  EFFECT: [%i]  SPELL: [%i]", weakness, storms[weakness][1], storms[weakness][2])

---------------------------------------------------------------------------------------------------

-- Test LUA table formatting
    -- local test =
    -- {
        -- --Structure: [Mob ID] = { Power, Damage Mod },
        -- [16801793] = {1, 4},
        -- [16801794] = {100, 4},
        -- [16801795] = {100, 4},
    -- }
    -- printf("test.lua onTrigger  VAR 1: [%i]", test[16801793][1])
---------------------------------------------------------------------------------------------------
-- Test bit.band functionality for Encumbrance
-- printf("test.lua onTrigger  VALUE: [%i]", bit.band(65535, 0x0001))

---------------------------------------------------------------------------------------------------
-- Test getting player ACC from the core
    -- local acc = player:getACC()
    -- printf("test.lua onTrigger  ACC: [%i]", acc)

---------------------------------------------------------------------------------------------------

-- local npcWaveMessages =
-- {
    -- {
        -- " : Shall we begin?",                                 -- NPC name
        -- " : This one should be more of a challenge.",         -- NPC name
        -- " : Can you finish the trial?",                       -- NPC name
    -- },
    -- {
        -- " : Mihli has claimed the first right of challenge.", -- NPC name
        -- " : Gadalar challenges you next!",                    -- NPC name
        -- " : Najelith joins the fight!",                       -- NPC name
        -- " : Zazarg approaches!",                              -- NPC name
        -- " : Can you finish the trial?",                       -- NPC name
    -- }
-- }

-- Test array counting
    -- local test =
    -- {
        -- {
            -- 1
        -- },
        -- {
            -- 1, 2, 3
        -- },
        -- {
            -- 1, 2, 3, 4, 5
        -- },
    -- }
    -- local blurp = #test[3]
    -- printf("test.lua onTrigger  %s", npcWaveMessages[1][1])
---------------------------------------------------------------------------------------------------

-- Test if an array can have a 0 index
	-- local test = {}
	-- test[0] = 12345
	-- test[1] = 6789
	-- printf("test.lua onTrigger  TEST 1: [%i]  TEST 2: [%i]", test[0], test[1])

---------------------------------------------------------------------------------------------------

-- Test the proper set up for pulling Throwing weapon skill levels
	-- local throwingSkill = player:getSkillLevel(tpz.skill.THROWING)
	-- local itemLevelSkill = player:getILvlSkill(tpz.slot.AMMO)
	-- printf("test.lua onTrigger  THROWING SKILL: [%i]  ITEM LVL: [%i]", throwingSkill, itemLevelSkill)

---------------------------------------------------------------------------------------------------
-- Test pulling ammo quantity from the core
	-- local ammoQty = player:getAmmoQuantity()
	-- printf("test.lua onTrigger  AMMO QTY: [%i]", ammoQty)

---------------------------------------------------------------------------------------------------

-- Test getSkill function
	-- local testSkill = ((player:getSkillLevel(tpz.skill.WOODWORKING) / 32))
	-- printf("test.lua onTrigger  SKILL VALUE: [%3.2f]", testSkill)

---------------------------------------------------------------------------------------------------

-- Despawn all mobs in La Vaule [S]
	-- for i = 17125377, 17125970 do
		-- GetMobByID(i):setRespawnTime(3600)
		-- DespawnMob(i)
		-- SpawnMob(i)
	-- end
	
---------------------------------------------------------------------------------------------------

-- Test shortening the name of a mob
	-- local mob = player:getCursorTarget()
	-- local mobName = mob:getName()
	-- local shortName = mobName:sub(1, 18)
	-- player:PrintToPlayer(string.format("test.lua onTrigger  MOB NAME: [%s]  SHORTENED NAME: [%s]", mobName, shortName), tpz.msg.channel.NS_LINKSHELL3)

---------------------------------------------------------------------------------------------------

-- Test creating a worn/cracked BCNM orb
-- (Does not seem to work in this script but will work in the global bcnm.lua)
	-- printf("test.lua onTrigger CREATING WORN ITEM")
	-- local item = getItemById(player, 1551)
	-- player:createWornItem(item)

---------------------------------------------------------------------------------------------------

-- Test Adoulin obstruction open/close
	-- 17863388 - Morimar Basalt Fields Boulders at E-10

	-- GetNPCByID(17863387):setAnimation(tpz.anim.OPEN_DOOR)
	-- GetNPCByID(17863372):setAnimation(tpz.anim.OPEN_DOOR)
	-- GetNPCByID(17863387):openDoor(120)
	-- GetNPCByID(17863372):openDoor(120)
	
	-- GetNPCByID(17863387):setAnimation(tpz.anim.CLOSE_DOOR)
	-- GetNPCByID(17863388):setAnimation(tpz.anim.CLOSE_DOOR)

---------------------------------------------------------------------------------------------------

-- Check if item has augment
	-- local equip = player:getStorageItem(0, 0, 0) -- Main weapon

    -- if equip then
        -- local augList  = {{},{},{},{}}
        -- local augValue = 0

        -- for i = 1, 4 do
            -- augList[i][1], augList[i][2] = equip:getAugment(i - 1)

            -- if augList[i][1] > 0 then
                -- printf("test.lua onTrigger  AUGMENT FOUND SLOT: [%i]  AUG ID: [%i]  AUG VALUE: [%i]", i - 1, augList[i][1], augList[i][2])
            -- end
        -- end
    -- end

---------------------------------------------------------------------------------------------------

-- Check the size of a party without trusts, a party with trusts, and an alliance
	-- local partySize = player:getPartySize()
	-- local partySizeTrust = player:getPartyWithTrusts()
	-- local allianceSize = player:getAlliance()
	-- printf("test.lua onTrigger PARTY SIZE: [%i]  PARTY SIZE TRUST: [%i]  ALLIANCE SIZE: [%i]", partySize, #partySizeTrust, #allianceSize)

---------------------------------------------------------------------------------------------------

-- Spawn all statues and NM's in Dynamis Jeuno
	-- local pop = {17547295, 17547296, 17547297, 17547391, 17547392, 17547393, 17547421, 17547422, 17547423, 17547456, 17547457, 17547458, 17547301, 17547302, 17547303,
				 -- 17547389, 17547390, 17547420, 17547467, 17547493, 17547494, 17547496, 17547498}
	
	-- for i = 1, #pop do
		-- SpawnMob(pop[i])
	-- end

---------------------------------------------------------------------------------------------------

-- Despawn all mobs in Dynamis Jeuno
	-- for i = 17547266, 17547498 do
		-- -- GetMobByID(i):setRespawnTime(3600)
		-- DespawnMob(i)
		-- -- SpawnMob(i)
	-- end

---------------------------------------------------------------------------------------------------

-- Spawn all statues and NM's in Dynamis San d'Oria
	-- local pop = {17535003, 17535004, 17535005, 17535113, 17535114, 17535115, 17535154, 17535155, 17535166, 17535167, 17535193, 17535194, 17535205, 17535206, 17535026,
				 -- 17535057, 17535128, 17535131, 17535139, 17535006, 17535044, 17535032}
	
	-- for i = 1, #pop do
		-- SpawnMob(pop[i])
	-- end

---------------------------------------------------------------------------------------------------

-- Despawn all mobs in Dynamis San d'Oria
	-- for i = 17534978, 17535206 do
		-- -- GetMobByID(i):setRespawnTime(3600)
		-- DespawnMob(i)
		-- -- SpawnMob(i)
	-- end

---------------------------------------------------------------------------------------------------

-- Spawn all statues and NM's in Dynamis Windurst
	-- local pop = {17543268, 17543269, 17543305, 17543306, 17543353, 17543354, 17543362, 17543363, 17543392, 17543393, 17543409, 17543410, 17543419, 17543420, 17543421,
				 -- 17543461, 17543462, 17543463, 17543258, 17543259, 17543342, 17543372, 17543446, 17543294, 17543345, 17543357, 17543375}
	
	-- for i = 1, #pop do
		-- SpawnMob(pop[i])
	-- end

---------------------------------------------------------------------------------------------------

-- Despawn all mobs in Dynamis Windurst
	-- for i = 17543169, 17543469 do
		-- DespawnMob(i)
		-- -- SpawnMob(i)
	-- end

---------------------------------------------------------------------------------------------------

-- Despawn all mobs in Dynamis Bastok
	-- for i = 17539074, 17539306 do
		-- DespawnMob(i)
		-- -- SpawnMob(i)
	-- end

---------------------------------------------------------------------------------------------------

-- Pull required level from items under level 99 and pull item level from required level 99+ items
	-- local rangedWeaponID = player:getEquipID(tpz.slot.RANGED)
	-- printf("test.lua onTrigger RANGED ITEM ID: [%i]", rangedWeaponID)
	-- local item = GetItem(rangedWeaponID)
	-- printf("test.lua onTrigger RANGED LVL REQ: [%i]  RANGED ITEM LVL: [%i]", item:getReqLvl(), player:getGearILvl(rangedWeaponID))

---------------------------------------------------------------------------------------------------

-- Test new mod based system for elemental gorgets and belts
	-- Flame, Soil, Aqua, Breeze, Snow, Thunder, Light, Shadow
	-- local wsElement = 0
	-- local accBonus = 0
	-- local ftpBonus = 0
	-- local SCProp1 = 6
	-- local SCProp2 = 0
	-- local SCProp3 = 0
	-- local elementalFTPEquip = {tpz.mod.SC_FTP_LIQUEFACTION, tpz.mod.SC_FTP_INDURATION, tpz.mod.SC_FTP_DETONATION, tpz.mod.SC_FTP_SCISSION,
							   -- tpz.mod.SC_FTP_IMPACTION, tpz.mod.SC_FTP_REVERBERATION, tpz.mod.SC_FTP_TRANSFIXION, tpz.mod.SC_FTP_COMPRESSION}
	
	-- for i = 1, 8 do
		-- if (player:getMod(elementalFTPEquip[i]) > 0) then
			-- wsElement = i
			-- break
		-- end
	-- end
	
	-- if (doesElementMatchWeaponskill(wsElement, SCProp1) or doesElementMatchWeaponskill(wsElement, SCProp2) or doesElementMatchWeaponskill(wsElement, SCProp3)) then
		-- accBonus = accBonus + player:getMod(elementalFTPEquip[wsElement])
		-- ftpBonus = ftpBonus + (player:getMod(elementalFTPEquip[wsElement]) / 100)
	-- end
	
	-- printf("test.lua onTrigger WS ELEMENT: [%i]  ACC BONUS: [%i]  FTP BONUS: [%1.2f]", wsElement, accBonus, ftpBonus)
	
---------------------------------------------------------------------------------------------------

-- Test methods to obtain mob base stats
	-- local target = player:getCursorTarget()

	-- printf("test.lua onTrigger MOB: [%s]  STAT ATT: [%i]  MOD ATT: [%i]", target:getName(), target:getStat(tpz.mod.ATT), target:getMod(tpz.mod.ATT))

---------------------------------------------------------------------------------------------------

-- Spawn all Dynamis - Bastok statues
	-- SpawnMob(17539118)
	-- SpawnMob(17539119)
	-- SpawnMob(17539120)
	-- SpawnMob(17539161)
	-- SpawnMob(17539162)
	-- SpawnMob(17539163)
	-- SpawnMob(17539171)
	-- SpawnMob(17539172)
	-- SpawnMob(17539173)
	-- SpawnMob(17539227)
	-- SpawnMob(17539228)
	-- SpawnMob(17539229)
	-- SpawnMob(17539234)
	-- SpawnMob(17539235)
	-- SpawnMob(17539236)
	-- SpawnMob(17539266)
	-- SpawnMob(17539267)
	-- SpawnMob(17539274)
	-- SpawnMob(17539275)
	-- SpawnMob(17539286)
	-- SpawnMob(17539287)
	-- SpawnMob(17539293)
	-- SpawnMob(17539294)
	-- SpawnMob(17539142)
	-- SpawnMob(17539148)
	-- SpawnMob(17539149)
	-- SpawnMob(17539253)
	-- SpawnMob(17539306)

---------------------------------------------------------------------------------------------------

	-- printf("test.lua onTrigger CLAMP: [%1.2f]", utils.clamp(1 + (30 / 99), 1.25, 1.85))

---------------------------------------------------------------------------------------------------

	-- local merit = player:getMerit(tpz.merit.VALLATION_EFFECT)
	-- printf("test.lua onTrigger MERIT: [%i]", merit)

---------------------------------------------------------------------------------------------------

-- Test breaking JP midnight timers down into hours and minutes (Sagheera)
	-- printf("test.lua onTrigger HOURS: [%i]  MINUTES: [%i]", math.floor(((getMidnight() - os.time()) / 60) / 60), (((getMidnight() - os.time()) / 60) / 60)%1 * 60)
	
---------------------------------------------------------------------------------------------------

-- local realday = tonumber(os.date("%d")) -- %M for next minute, %j for next day
-- printf("test.lua onTrigger REAL DAY: [%i]", realday)

---------------------------------------------------------------------------------------------------

-- local telepoint = GetNPCByID(17236304)
-- telepoint:setStatus(tpz.status.NORMAL)
-- local pos = telepoint:getPos()
-- printf("test.lua onTrigger TELEPOINT LOC X: [%3.3f]  LOC Y: [%3.3f]  LOC Z: [%3.3f]", pos.x, pos.y, pos.z)

---------------------------------------------------------------------------------------------------

-- Mass add items to inventory to look for augments
	-- local augNumber = 1975

	-- for i = 0, 79 do
		-- player:addItem(12448, 1, augNumber + i, 0)
	-- end

---------------------------------------------------------------------------------------------------

-- Test Random Number Generator
	-- for i = 1, 60 do
		-- printf("test.lua onTrigger RANDOM VALUE %i: [%i]", i, math.random(1, 999))
	-- end

---------------------------------------------------------------------------------------------------
	-- local itemID = 27677
	-- local test = "[Aug]SuibhnePathGenbu_"..itemID

	-- if (player:getCharVar("[Aug]SuibhnePathGenbu_27677") > 0) then
		-- printf("test.lua onTrigger [%s]", test)
		-- augments = skyAugmentsCarryOver[1]
		-- player:setCharVar("[Aug]SuibhnePathGenbu_"..augItem, 0)
	-- end
	
---------------------------------------------------------------------------------------------------

-- Test tables
	-- local test = {trade = {1663, 3}}
	-- printf("test.lua onTrigger  TEST: [%i]", test.trade[2])

---------------------------------------------------------------------------------------------------

-- Test utils.clamp
	-- printf("test.lua onTrigger CLAMP: [%i]", utils.clamp(player:getSkillLevel(tpz.skill.HEALING_MAGIC) / 12.5, 10, 40))

---------------------------------------------------------------------------------------------------

-- Force set movement speed
	-- local target = player:getCursorTarget()
	-- target:speed(80)

---------------------------------------------------------------------------------------------------

-- Force Treasure Hunter level
	-- local target = player:getCursorTarget()
	-- target:setTHlevel(9)

---------------------------------------------------------------------------------------------------

-- Test math.ceil
	-- printf("test.lua onTrigger CEILING: [%f]", math.ceil(1.3))

---------------------------------------------------------------------------------------------------

-- Get NPC ID
	-- local npc = player:getCursorTarget()
	-- local pos = npc:getPos()
	-- -- printf("test.lua onTrigger NPC ID: [%i]  POS X: [%f]  POS Y: [%f]  POS Z: [%f]", npc:getID(), pos.x, pos.y, pos.z)
	-- player:PrintToPlayer(string.format("NPC ID: [%i]  POS X: [%.3f]  POS Y: [%.3f]  POS Z: [%.3f]", npc:getID(), pos.x, pos.y, pos.z),tpz.msg.channel.SYSTEM_3)

---------------------------------------------------------------------------------------------------

	-- local target = player:getCursorTarget()
	-- printf("test.lua onTrigger HP: [%i]", target:getHP())

---------------------------------------------------------------------------------------------------

-- Test mob enmity list
	-- local target = player:getCursorTarget()
	-- local mobTargets = target:getEnmityList()
	-- local assistTargets = {}
	
	-- for i, v in pairs(mobTargets) do
		-- printf("test.lua onTrigger TARGET NAME: [%s]", v.entity)
		-- assistTargets[i] = GetPlayerByName(v.entity:getName())
	-- end

---------------------------------------------------------------------------------------------------

	-- for i = 16, 17 do
		-- printf("test.lua onTrigger  i: [%i]", i)
	-- end

---------------------------------------------------------------------------------------------------

-- Test for player having a status effect (Extreme Purgation)
	-- local statusEffect = player:getStatusEffect(42)
	
	-- printf("test.lua onTrigger EFFECT: [%s]  POWER: [%i]  TICK: [%i]  DURATION: [%i]", statusEffect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())

---------------------------------------------------------------------------------------------------

-- Get mob's TH value
	-- local target = player:getCursorTarget()
	-- printf("test.lua onTrigger CURRENT TH: [%i]", mob:getTHlevel())

---------------------------------------------------------------------------------------------------

-- Return increased value versus decreasing HPP
	-- local hpp = player:getHPP()
	-- printf("test.lua onTrigger VALUE: [%i]", 5 + ((100 - hpp) / 5))

---------------------------------------------------------------------------------------------------

-- Force an AnimationSub
	-- local target = player:getCursorTarget()
	-- target:AnimationSub(0)

---------------------------------------------------------------------------------------------------

-- Remove Charm
	-- player:uncharm()
	
---------------------------------------------------------------------------------------------------

-- Restore an NPC from tpz.status.DISAPPEAR
	-- local qm = GetNPCByID(17318485)
	-- qm:setStatus(tpz.status.NORMAL)

---------------------------------------------------------------------------------------------------

-- Code for testing arrays
	-- local spells =
	-- {
		-- {options = {148, 177, 233}}, -- Fire V, Firaga IV, Bio IV
		-- {options = {163, 192, 35}},  -- Stone V, Stonega IV, Slowga
		-- {options = {173, 202, 227}}, -- Water V, Waterga IV, Poisonga III
		-- {options = {158, 187, 359}}, -- Aero V, Aeroga IV, Silencega
		-- {options = {153, 182, 356}}, -- Blizzard V, Blizzaga IV, Paralyga
		-- {options = {168, 197, 252}}  -- Thunder V, Thundaga IV, Stun
	-- }
	-- for i = 1, #spells[int].options do
		-- printf("test.lua OnTrigger ENTRY: [%i]  SPELL: [%s]", int, spells[int].options[i])
	-- end

---------------------------------------------------------------------------------------------------
	-- local mobName = player:getCursorTarget():getName()
	-- local fixedMobName = string.gsub(mobName, "_", " ")
	-- local test = "KillCounter_" ..fixedMobName
	-- printf("test.lua onTrigger %s", test)
---------------------------------------------------------------------------------------------------
	-- local targ = player:getCursorTarget()
	
	-- targ:speed(40)
---------------------------------------------------------------------------------------------------
	-- local vines = 17879394
	-- local wall = 17879397

	-- GetNPCByID(vines):setAnimation(tpz.anim.CLOSE_DOOR)
	-- GetNPCByID(wall):openDoor(120)
--	GetNPCByID(npc):setStatus(tpz.status.NORMAL)
--	GetNPCByID(npc):setPos(239.4632, 18.7437, -42.0869, 203, 269)

---------------------------------------------------------------------------------------------------

	-- local target = player:getCursorTarget()
	-- local pet = player:getPet()
	-- local petCE = target:getCE(pet)
	-- local petVE = target:getVE(pet)
	
	-- printf("test.lua onTrigger PET CE: [%i]  VE: [%i]", petCE, petVE)

---------------------------------------------------------------------------------------------------
-- local missionZM = {0, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 23, 24, 26, 27, 28, 30}

	-- for i = 1, #missionZM do
-- --		player:completeMission(3, 0)
-- --		player:delMission(3, missionZM[i])
		-- player:addMission(3, missionZM[i] + 1)
		-- player:completeMission(3, missionZM[i])
	-- end
	
	-- player:addMission(3, 31) -- RoZ: Awakening

---------------------------------------------------------------------------------------------------

-- Outputs the current os.time
	-- printf("Time: [%i]", os.time())

---------------------------------------------------------------------------------------------------
-- Checks the targets Physical Damage Type Resistances

	-- validate mobId
    -- local targ
    -- if (mobId == nil) then
        -- targ = player:getCursorTarget()
        -- if (targ == nil or not targ:isMob()) then
            -- error(player,"You must target a mob.")
            -- return
        -- end
    -- else
        -- targ = SpawnMob(mobId)
        -- if (targ == nil) then
            -- error(player,"Invalid mobID.")
            -- return
        -- end
    -- end
	
	-- local H2HRes = targ:getMod(tpz.mod.HTHRES)
	-- local BluntRES = targ:getMod(tpz.mod.IMPACTRES)
	-- local PierceRES = targ:getMod(tpz.mod.PIERCERES)
	-- local SlashRES = targ:getMod(tpz.mod.SLASHRES)
	
	-- player:PrintToPlayer(string.format("H2H RES: [%i]  Blunt RES: [%i]  Pierce RES: [%i]  Slash RES: [%i]", H2HRes, BluntRES, PierceRES, SlashRES),tpz.msg.channel.SYSTEM_3)

---------------------------------------------------------------------------------------------------

	-- local ilvl = player:getItemLevel()
	-- printf("test.lua onTrigger Item Level: [%i]", ilvl)

---------------------------------------------------------------------------------------------------

-- Code for testing arrays
	-- local test =
	-- {
		-- {mod = {"tpz.mod.PARALYZERES", "tpz.mod.BINDRES"}},
		-- {mod = {"tpz.mod.SILENCERES", "tpz.mod.GRAVITYRES"}},
		-- {mod = {"tpz.mod.PETRIFYRES", "tpz.mod.SLOWRES"}},
		-- {mod = {"tpz.mod.STUN"}},
		-- {mod = {"tpz.mod.POISONRES", "tpz.mod.VIRUSRES"}},
		-- {mod = {"tpz.mod.AMNESIARES"}},
		-- {mod = {"tpz.mod.SLEEPRES", "tpz.mod.BLINDRES", "tpz.mod.CURSERES"}},
		-- {mod = {"tpz.mod.CHARMRES", "tpz.mod.LULLABYRES", "tpz.mod.DEATHRES"}}
	-- }
	-- for i = 1, #test[int].mod do
		-- printf("test.lua OnTrigger ENTRY: [%i]  MOD: [%s]", int, test[int].mod[i])
	-- end

---------------------------------------------------------------------------------------------------

-- Code for testing combat messages
	-- targ:messageCombat(actor, actionID, value, message)
	-- local actor = player:getCursorTarget()
	-- local actionID = 344
	-- local value = 1000
--	local message = 101 -- From scripts/globals/msg.lua
	
	-- for i = id1, id2 do
	-- player:messageCombat(actor, i, value, message)
	-- end
	
--	player:messageCombat(actor, actionID, value, int)
	

---------------------------------------------------------------------------------------------------

-- Code for checking if player is behind the target
	-- local targ = player:getCursorTarget()
	
	-- if (player:isBehind(targ, 45) == true) then
		-- printf("test.lua onTrigger PLAYER IS BEHIND TARGET")
	-- else
		-- printf("test.lua onTrigger NOT BEHIND TARGET")
	-- end

---------------------------------------------------------------------------------------------------

-- Code for testing print to area
	-- local targ = player:getCursorTarget()
	-- targ:PrintToArea("horn begins charging for an attack!",tpz.msg.channel.EMOTION, tpz.msg.area.SAY, "Dark Ixion's")

---------------------------------------------------------------------------------------------------

-- Code for checking current Vana'diel Hour and Minutes

--	printf("test.lua CURRENT HOUR: [%s]  CURRENT MINUTE: [%s]  COMBINED: [%s]", VanadielHour(), VanadielMinute(), (VanadielHour() * 60) + VanadielMinute())
---------------------------------------------------------------------------------------------------
	-- local npc = player:getCursorTarget()
	-- npc:setModelId(modelId)
---------------------------------------------------------------------------------------------------
	-- Code for testing listeners
	-- player:addListener("ABILITY_USE", "TEST_LISTENER", function(player, ability)
		-- printf("test.lua Ability Listener SETUP")
		-- -- local enmityList = mob:getEnmityList()
		-- -- local PlayerName = {}
	   
		-- -- for i,v in ipairs(enmityList) do
			-- -- PlayerName[i] = v.entity:getName()
			
			-- if (player:getCurrentAction() == tpz.act.JOBABILITY_FINISH) then -- Player uses ability
				-- printf("test.lua Ability Listener TRIGGERED")
			-- end
		-- -- end
    -- end)
---------------------------------------------------------------------------------------------------

-- Code for testing a pet's HP ratio

	-- local pet = player:getPet()
	-- local petMaxHP = pet:getMaxHP()
	-- local petHP = pet:getHP()
	
	-- player:PrintToPlayer(string.format("Pet HP as a ratio: [%f]", utils.clamp((petHP/petMaxHP) * 100, 50, 100)), tpz.msg.channel.NS_LINKSHELL3)
	
---------------------------------------------------------------------------------------------------

-- Code for determining the linkpearl's signature

-- local item = player:getItem(515)

-- if (player:hasItem(515) and (item:getSignature() == "CalderaServer")) then
	-- player:PrintToPlayer("Player has the server linkpearl!")
-- end

---------------------------------------------------------------------------------------------------

-- Code for messaging the entire server

--	printf("Player Name: [%s]  Message: [%s]\n", playerName, message)

	-- local message = "Normal chat in Say from the player"
	-- local channel = 0
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Say from the player"
	-- local channel = 0
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Shout from the player"
	-- local channel = 1
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in an unknown channel from the player"
	-- local channel = 2
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Tell from the player"
	-- local channel = 3
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Party from the player"
	-- local channel = 4
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 1 from the player"
	-- local channel = 5
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "System Message 1"
	-- local channel = 6
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "System Message 2"
	-- local channel = 7
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Emote from the player"
	-- local channel = 8
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Say from no speaker"
	-- local channel = 13
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Shout from no speaker"
	-- local channel = 14
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Party from no speaker"
	-- local channel = 15
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 1 from no speaker"
	-- local channel = 16
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Yell from the player"
	-- local channel = 26
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 2 from the player"
	-- local channel = 27
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 2 from no speaker"
	-- local channel = 28
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "System Message 3"
	-- local channel = 29
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 3 from the player"
	-- local channel = 30
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 3 (1) from no speaker"
	-- local channel = 31
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Linkshell 3 (2) from no speaker"
	-- local channel = 32
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)
	
	-- local message = "Normal chat in Unity from the player"
	-- local channel = 33
	-- local playerName = player:getName()
	-- SendServerMsg(playerName, channel, message)


---------------------------------------------------------------------------------------------------

-- Code for cleaning monster names of underscores

	-- local target = player:getCursorTarget()
	-- local mobName = target:getName()
	-- local testName = string.gsub(mobName, "_", " ")
	-- player:PrintToPlayer(string.format("Mob name: [%s]  Test name: [%s]", mobName, testName), tpz.msg.channel.NS_LINKSHELL3)

---------------------------------------------------------------------------------------------------

-- Divide a number and determine if there is a remainder

	-- local value = 1
	-- local test = value % 8
	
	-- player:PrintToPlayer(string.format("A Value of %i divided by [8] has a Remainder of [%i]!", value, test))
	
	-- if (test == 0) then
		-- player:PrintToPlayer(string.format("The Value is evenly divisible by 8!"))
	-- end
end