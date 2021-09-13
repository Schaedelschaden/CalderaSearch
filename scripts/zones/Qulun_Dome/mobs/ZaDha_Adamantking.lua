-----------------------------------
-- Area: Qulun Dome
--   NM: Za'Dha Adamantking
-- TODO: messages should be zone-wide
-----------------------------------
local ID = require("scripts/zones/Qulun_Dome/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

local assistMobs = {
					17383440,                     -- Adaman Quadav
					17383425, 17383429, 17383438, -- Ancient Quadav
					17383434, 17383436,           -- Darksteel Quadav
					17383431, 17383439,           -- Platinum Quadav
					17383441,                     -- Ruby Quadav
					17383435, 17383437            -- Sapphire Quadav
					}

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 689, hpp = math.random(30,55)}, -- uses Benediction once between near 30-55% HPP.
        },
    })
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
	mob:setMod(tpz.mod.ATT, 1200)
	mob:setMod(tpz.mod.MATT, 600)
    mob:setMod(tpz.mod.ACC, 600)
	mob:setMod(tpz.mod.MACC, 700)
    mob:setMod(tpz.mod.EVA, 750)
	mob:setMod(tpz.mod.DEF, 900)
	mob:setMod(tpz.mod.MEVA, 200)
	mob:setMod(tpz.mod.MDEF, 500)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:setMod(tpz.mod.CRITHITRATE, 25)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.QUADAV_KING_ENGAGE)

	-- for i = 1, 11 do
		-- local link = GetMobByID(assistMobs[i])
		
		-- if (link:getCurrentAction() == tpz.act.ROAMING) then
            -- link:updateEnmity(target)
        -- end
	-- end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.SLOW, {power = 3000})
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.MATT, 600)
	-- for i = 1, 11 do
		-- local link = GetMobByID(assistMobs[i])
		
		-- if (link:getCurrentAction() == tpz.act.ROAMING) then
            -- link:updateEnmity(target)
        -- end
	-- end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ADAMANTKING_USURPER)
    if isKiller then
        mob:showText(mob, ID.text.QUADAV_KING_DEATH)
    end
end

function onMobDespawn(mob)
    -- reset hqnm system back to the nm placeholder
    -- local nqId = mob:getID() - 1
    -- SetServerVariable("[POP]Za_Dha_Adamantking", os.time() + 259200) -- 3 days
    -- SetServerVariable("[PH]Za_Dha_Adamantking", 0)
    -- DisallowRespawn(mob:getID(), true)
    -- DisallowRespawn(nqId, false)
    -- UpdateNMSpawnPoint(nqId)
    -- GetMobByID(nqId):setRespawnTime(math.random(75600, 86400))
end