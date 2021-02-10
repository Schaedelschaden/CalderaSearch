-----------------------------------
-- Area: The Shrine of Ru'Avitau
--   NM: Kirin
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/keyitems")
-----------------------------------

function onMobInitialize( mob )
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.WINDRES, -64)
    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.GRAVITYRES, 35)
    -- mob:setMod(tpz.mod.HPP, 300)
	mob:setMod(tpz.mod.DMGPHYS, -25)
	mob:setMod(tpz.mod.DMGRANGE, -25)
	mob:setMod(tpz.mod.DMGMAGIC, -30)
	mob:addMod(tpz.mod.ACC, 500)
	mob:addMod(tpz.mod.MACC, 500)
	mob:addMod(tpz.mod.MEVA, 500)
	mob:addMod(tpz.mod.MDEF, 15)
	-- mob:addMod(tpz.mod.EARTHATT, 500)
	-- mob:addMod(tpz.mod.EARTHACC, 1000)
	mob:addMod(tpz.mod.MATT, 200)
	-- mob:addStatusEffect(tpz.effect.REGEN, 500, 3, 0)
	mob:addMod(tpz.mod.REFRESH, 25)
	mob:setLocalVar("numAdds", 90) -- Based off Kirin's HPP now. Spawns first "pet" at 90% HP
	
	mob:setHP(999999999)
end

function onMobFight( mob, target )
    -- Spawn gods as pets
    local numAdds = mob:getLocalVar("numAdds")
    if (mob:getHPP() <= numAdds) then
        local godsRemaining = {}
        for i = 1, 4 do
            if (mob:getLocalVar("add"..i) == 0) then
                table.insert(godsRemaining,i)
            end
        end
        if (#godsRemaining > 0) then
            local g = godsRemaining[math.random(#godsRemaining)]
            local god = SpawnMob(ID.mob.KIRIN + g)
            god:updateEnmity(target)
            mob:setLocalVar("add"..g, 1)
            mob:setLocalVar("numAdds", numAdds - 10)
			
			local godName = god:getName()
			if (godName == 'Byakko') then
				god:setPos(mob:getXPos() - 5, mob:getYPos(), mob:getZPos())
			elseif (godName == 'Genbu') then
				god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() + 5)
			elseif (godName == 'Seiryu') then
				god:setPos(mob:getXPos() + 5, mob:getYPos(), mob:getZPos())
			elseif (godName == 'Suzaku') then
				god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() - 5)
			elseif (godName == 'Kirins_Avatar') then
				god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() - 3)
			end
        end
    end

    -- Ensure all spawned pets are doing stuff
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        local god = GetMobByID(i)
        if (god:getCurrentAction() == tpz.act.ROAMING) then
            god:updateEnmity(target)
        end
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle( tpz.title.KIRIN_CAPTIVATOR )
	player:addKeyItem( tpz.ki.KIRINS_FERVOR )
	player:messageSpecial( ID.text.KEYITEM_OBTAINED, tpz.ki.KIRINS_FERVOR )
    player:showText( mob, ID.text.KIRIN_OFFSET + 1 )
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end

function onMobDespawn( mob )
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end