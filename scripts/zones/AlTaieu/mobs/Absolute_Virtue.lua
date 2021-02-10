-----------------------------------
-- Area: Al'Taieu
--  HNM: Absolute Virtue
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
-----------------------------------

-- Mighty Strikes, Hundred Fists, Benediction, Manafont, Chainspell, Perfect Dodge, Invincible,
-- Blood Weapon, Soul Voice, Eagle Eye Shot, Meikyo Shisui, Call Wyvern, Familiar, Astral Flow
local twoHours = {688, 689, 690, 691, 692, 693, 694, 695, 696, 735, 730, 732, 740, 734}

function onMobSpawn(mob)
    -- setMod
	-- mob:setMod(tpz.mod.WINDRES, -64)
    -- mob:setMod(tpz.mod.SILENCERES, 85)
	-- mob:setMod(tpz.mod.SLEEPRES, 85)
	-- mob:setMod(tpz.mod.PETRIFYRES, 85)
	-- mob:setMod(tpz.mod.BINDRES, 85)
	-- mob:setMod(tpz.mod.CHARMRES, 85)
	-- mob:setMod(tpz.mod.DEATHRES, 85)
	-- mob:setMod(tpz.mod.PARALYZERES, 20)
    -- mob:setMod(tpz.mod.STUNRES, 35)
    -- mob:setMod(tpz.mod.BINDRES, 50)
    -- mob:setMod(tpz.mod.GRAVITYRES, 30)
    -- mob:setMod(tpz.mod.HPP, 500)
	-- mob:setMod(tpz.mod.DMG, -95)
	-- mob:setMod(tpz.mod.DMGPHYS, -95)
	-- mob:setMod(tpz.mod.DMGRANGE, -95)
	-- mob:setMod(tpz.mod.DMGMAGIC, -95)
	mob:addMod(tpz.mod.ACC, 500)
	mob:addMod(tpz.mod.MACC, 500)
	mob:addMod(tpz.mod.FASTCAST, 65)
	-- mob:addMod(tpz.mod.EARTHATT, 500)
	-- mob:addMod(tpz.mod.EARTHACC, 1000)
	mob:addMod(tpz.mod.MATT, 250)
	-- mob:addMod(tpz.mod.HASTE_GEAR, 1300)
	mob:addMod(tpz.mod.REGEN, 270)
	mob:addMod(tpz.mod.REFRESH, 25)
    mob:setLocalVar("numAdds", 1)
	
	-- mob:setHP(999999999)

    local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE)
    -- Special check for regen modification by JoL pets killed
    if (JoL:getLocalVar("JoL_Qn_xzomit_Killed") == 9) then
        mob:addMod(tpz.mod.REGEN, -130)
    end
    if (JoL:getLocalVar("JoL_Qn_hpemde_Killed") == 9) then
        mob:addMod(tpz.mod.REGEN, -130)
    end
end

function onMobFight(mob, target)
	local isBusy = false
	local act = mob:getCurrentAction()
	local numPets = mob:getLocalVar("numPets")
--	printf("Absolute_Virtue.lua onMobFight NUMBER OF PETS 1: [%i]", numPets)
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if AV is in any stage of using a mobskill or casting a spell
    end
	
	if (mob:getBattleTime() >= 90 and mob:getBattleTime() % 45 == 0 and isBusy == false) then
		local pick2Hr = math.random(1, 14)
		printf("Absolute_Virtue.lua onMobFight 2HR PICKED: [%i]", pick2Hr)
		if (pick2Hr > 0 and pick2Hr < 11) then
			mob:useMobAbility(twoHours[pick2Hr])
		end
		
		if ((pick2Hr >= 12 and pick2Hr <= 14) and numPets > 0) then -- Familiar & Astral Flow require a pet to be out
			printf("Absolute_Virtue.lua onMobFight HAS PETS OUT")
			mob:useMobAbility(twoHours[math.random(13, 14)])
		else -- If AV doesn't have a pet summon wyverns
--			printf("Absolute_Virtue.lua onMobFight DOESN'T HAVE PETS")
			mob:useMobAbility(twoHours[12])
		end
	end
	
	-- Ensure all pets are actively engaged
	local wyvernUp = {}
	local wyvernDown = {}
	for i = ID.mob.ABSOLUTE_VIRTUE + 1, ID.mob.ABSOLUTE_VIRTUE + 3 do
        local wyvern = GetMobByID(i)
			
		if wyvern:isAlive() then
            table.insert(wyvernUp, i)
        elseif not wyvern:isSpawned() then
            table.insert(wyvernDn, i)
        end
		
        if (wyvern:getCurrentAction() == tpz.act.ROAMING) then
            wyvern:updateEnmity(target)
        end
    end
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280) -- AoE Meteor Animation
        spell:setMPCost(1)
    end
end

function onMagicHit(caster, target, spell)
    local REGEN = target:getMod(tpz.mod.REGEN)
    local DAY = VanadielDayElement()
    local ELEM = spell:getElement()
	
    if (GetServerVariable("AV_Regen_Reduction") < 60) then
        -- Had to serverVar the regen instead of localVar because localVar reset on claim loss.
        if (ELEM == DAY and (caster:isPC() or caster:isPet())) then
            SetServerVariable("AV_Regen_Reduction", 1 + GetServerVariable("AV_Regen_Reduction"))
            target:addMod(tpz.mod.REGEN, -2)
        end
    end
	
    return 1
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.VIRTUOUS_SAINT)
	
	for i = ID.mob.ABSOLUTE_VIRTUE + 1, ID.mob.ABSOLUTE_VIRTUE + 3 do
        DespawnMob(i)
    end
end

function onMobDespawn(mob)
    for i = ID.mob.ABSOLUTE_VIRTUE + 1, ID.mob.ABSOLUTE_VIRTUE + 3 do
        DespawnMob(i)
    end
end