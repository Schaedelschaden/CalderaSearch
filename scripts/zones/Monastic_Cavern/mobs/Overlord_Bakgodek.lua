-----------------------------------
-- Area: Monastic Cavern
--  Mob: Overlord Bakgodek
-- TODO: messages should be zone-wide
-----------------------------------
local ID = require("scripts/zones/Monastic_Cavern/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
-----------------------------------

local assistMobs = {
					17391763, 17391770, 17391775, 17391780, -- Orcish Champion
					17391764, 17391776, 17391781,           -- Orcish Dragoon
					17391769, 17391774, 17391779,           -- Orcish Dreadnought
					17391761, 17391768, 17391773,           -- Orcish Farkiller
					17391760, 17391767, 17391772, 17391777, -- Orcish Protector
					17391765,                               -- Orcish Hexspinner
					17391766                                -- Orcish Warlord
					}

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 694, hpp = 25}, -- uses Invincible once while near 50% HPP.
        },
    })
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
	mob:addMod(tpz.mod.ATT, 800)
	mob:setMod(tpz.mod.MATT, 750)
    mob:setMod(tpz.mod.ACC, 1000)
	mob:setMod(tpz.mod.MACC, 700)
    mob:setMod(tpz.mod.EVA, 850)
	mob:setMod(tpz.mod.DEF, 1200)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:setMod(tpz.mod.MDEF, 250)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:setMod(tpz.mod.CRITHITRATE, 25)
	mob:setMod(tpz.mod.NULL_PHYSICAL_DAMAGE, 10)
	mob:setMod(tpz.mod.SHIELD_MASTERY_TP, 100)
	mob:setMod(tpz.mod.COUNTER, 60)
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 150
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENLIGHT, params)
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.ORC_KING_ENGAGE)
	
	-- for i = 1, 19 do
		-- local link = GetMobByID(assistMobs[i])
		
		-- if (link:getCurrentAction() == tpz.act.ROAMING) then
            -- link:updateEnmity(target)
        -- end
	-- end
end

function onMobFight(mob, target)
	-- for i = 1, 19 do
		-- local link = GetMobByID(assistMobs[i])
		
		-- if (link:getCurrentAction() == tpz.act.ROAMING) then
            -- link:updateEnmity(target)
        -- end
	-- end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.OVERLORD_OVERTHROWER)
    if isKiller then
        mob:showText(mob, ID.text.ORC_KING_DEATH)
    end
end

function onMobDespawn(mob)
    -- reset hqnm system back to the nm placeholder (DELETE THIS IN FAVOR OF A SPAWN)
    -- local nqId = mob:getID() - 1
    -- SetServerVariable("[POP]Overlord_Bakgodek", os.time() + 259200) -- 3 days
    -- SetServerVariable("[PH]Overlord_Bakgodek", 0)
    -- DisallowRespawn(mob:getID(), true)
    -- DisallowRespawn(nqId, false)
    -- UpdateNMSpawnPoint(nqId)
    -- GetMobByID(nqId):setRespawnTime(math.random(75600, 86400))
end