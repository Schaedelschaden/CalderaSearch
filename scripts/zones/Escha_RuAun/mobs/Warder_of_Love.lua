-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Love
-- !pos 431.522 -0.912 -603.503 33
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 250)
	mob:addMod(tpz.mod.EVA, 175)
	mob:addMod(tpz.mod.DEF, 275)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
end;

local minionGroup =
{
    [0] = 10, -- Qnxzomit
    [1] = 19, -- Qnhpemde
    [2] =  1, -- Ruphuabo
    [3] = 13, -- Qnxzomit
    [4] = 22, -- Qnhpemde
    [5] =  4, -- Ruphuabo
    [6] = 16, -- Qnxzomit
    [7] = 25, -- Qnhpemde
}

function onMobEngaged(mob, target)
    mob:hideName(false)
    mob:untargetable(false)
    mob:AnimationSub(2)
end

function onMobFight(mob, target)
    -- reduce regen after nine Xzomits and Hpemdes are killed
    if mob:getLocalVar("JoL_Regen_Reduction") == 0 and mob:getLocalVar("JoL_Qn_xzomit_Killed") >= 9 and mob:getLocalVar("JoL_Qn_hpemde_Killed") >= 9 then
        mob:setLocalVar("JoL_Regen_Reduction", 1)
        mob:addMod(tpz.mod.REGEN, -260)
    end

    -- spawn minions in 2.5 minute intervals
    if os.time() > mob:getLocalVar("pop_pets") then
        mob:setLocalVar("pop_pets", os.time() + 150)

        local spawns = mob:getLocalVar("SPAWNS")
        if spawns < 8 then
            local minionOffset = ID.mob.WARDER_OF_LOVE + minionGroup[spawns]
            SpawnMob(minionOffset + 0):updateEnmity(target)
            SpawnMob(minionOffset + 1):updateEnmity(target)
            SpawnMob(minionOffset + 2):updateEnmity(target)
        else
            -- determine which sharks are currently spawned
            local phuaboUp = {}
            local phuaboDn = {}
            for i = ID.mob.WARDER_OF_LOVE + 1, ID.mob.WARDER_OF_LOVE + 9 do
                local phuabo = GetMobByID(i)
                if phuabo:isAlive() then
                    table.insert(phuaboUp, i)
                elseif not phuabo:isSpawned() then
                    table.insert(phuaboDn, i)
                end
            end

            -- how many sharks spawn depends on number currently alive
            -- https://www.bg-wiki.com/bg/WARDER_OF_LOVE
            local numToSpawn = 0
            if #phuaboUp == 2 then
                numToSpawn = 1
            elseif #phuaboUp == 0 or #phuaboUp == 3 then
                numToSpawn = 3
            elseif #phuaboUp == 1 then
                numToSpawn = math.random(3)
            end

            -- spawn sharks
            for i = 1, math.min(numToSpawn, #phuaboDn) do
                SpawnMob(phuaboDn[i]):updateEnmity(target)
            end
        end
        mob:setLocalVar("SPAWNS", spawns + 1)
    end
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_WarderOfLove")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_WarderOfLove", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
end