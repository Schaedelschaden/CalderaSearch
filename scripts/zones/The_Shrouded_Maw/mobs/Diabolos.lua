-----------------------------------
-- Area: The Shrouded Maw
--  Mob: Diabolos
-----------------------------------
local ID = require("scripts/zones/The_Shrouded_Maw/IDs")

-- TODO: CoP Diabolos
-- 1) Make the diremites in the pit all aggro said player that falls into region. Should have a respawn time of 10 seconds.
-- 2) Diremites also shouldnt follow you back to the fight area if you make it there. Should despawn and respawn instantly if all players
--    make it back to the Diabolos floor area.
-- 3) ANIMATION Packet ids for instance 2 and 3 are wrong (needs guesswork). Sounds working.
--    Update 2018-01-02 these no longer seem to work for any instance. neither animation nor sound.

-- TODO: Diabolos Prime
-- Note: Diabolos Prime fight drops all tiles at once.

function onMobSpawn(mob) -- When mob spawns (either forced or time)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 1911, hpp = 25}, -- uses Ruinous Omen once while near 25% HPP.
        },
	})
	mob:setMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 100) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    -- mob:setMod(tpz.mod.POISONRES, 50) -- Resistance to Poison
	-- mob:setMod(tpz.mod.ATT, 1200) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 500) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 850) -- Accuracy (compare to EVA)
	-- mob:setMod(tpz.mod.MACC, 600) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 110) -- Evasion (Compare to ACC)
	-- mob:setMod(tpz.mod.DEF, 1000) -- Defense (Compart to ATT)
	-- mob:setMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	-- mob:setMod(tpz.mod.MDEF, 300) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.REGEN, 250)
	mob:setMod(tpz.mod.REGAIN, 100)
end

function onMobFight(mob, target)
    -- local mobOffset = mob:getID() - ID.mob.DIABOLOS_OFFSET
    -- if (mobOffset >= 0 and mobOffset <= 14) then
        -- local inst = math.floor(mobOffset/7)

        -- local tileDrops =
        -- {
            -- {10, "byc1", "bya1", "byY1"},
            -- {20, "byc2", "bya2", "byY2"},
            -- {30, "byc3", "bya3", "byY3"},
            -- {40, "byc4", "bya4", "byY4"},
            -- {50, "byc5", "bya5", "byY5"},
            -- {65, "byc6", "bya6", "byY6"},
            -- {75, "byc7", "bya7", "byY7"},
            -- {90, "byc8", "bya8", "byY8"},
        -- }

        -- local hpp = ((mob:getHP()/mob:getMaxHP())*100)
        -- for k, v in pairs(tileDrops) do
            -- if (hpp < v[1]) then
                -- local tileId = ID.npc.DARKNESS_NAMED_TILE_OFFSET + (inst * 8) + (k - 1)
                -- local tile = GetNPCByID(tileId)
                -- if (tile:getAnimation() == tpz.anim.CLOSE_DOOR) then
                    -- SendEntityVisualPacket(tileId, v[inst+2])  -- Animation for floor dropping
                    -- SendEntityVisualPacket(tileId, "s123")     -- Tile dropping sound
                    -- tile:timer(5000, function(tile)
                        -- tile:setAnimation(tpz.anim.OPEN_DOOR)     -- Floor opens
                    -- end)
                -- end
                -- break
            -- end
        -- end
    -- end
end

function onMobDeath(mob, player, isKiller)
end
