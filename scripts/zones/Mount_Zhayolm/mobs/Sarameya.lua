-----------------------------------
-- Area: Mount Zhayolm
--   NM: Sarameya
-- !pos 322 -14 -581 61
-- Spawned with Buffalo Corpse: !additem 2583
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Sarameya
-- TODO: PostAIRewrite: Code the Howl effect and gradual resists.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobSpawn(mob)
    mob:renameEntity("Dark Nar")
    mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Paralyze
    mob:addMod(tpz.mod.STUNRES, 60) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 60) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 60) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 60) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 60) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 60) -- Resistance to Poison	
	mob:addMod(tpz.mod.STR, 130)	
	mob:addMod(tpz.mod.DEX, 130)	
	mob:addMod(tpz.mod.VIT, 130)	
	mob:addMod(tpz.mod.CHR, 130)	
	mob:addMod(tpz.mod.MND, 130)	
	mob:addMod(tpz.mod.INT, 130)	
	mob:addMod(tpz.mod.MATT, 300)	
	mob:addMod(tpz.mod.MDEF, 100)
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.ATT, 900)
	mob:addMod(tpz.mod.MEVA, 250)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 200)
    mob:addMod(tpz.mod.FASTCAST, 100)
    mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
    mob:setUnkillable(true)
end

function onMobFight(mob, target)
    mob:setUnkillable(true)
    mob:renameEntity("Dark Nar")
    if mob:getHP() == 1 then
        target:setCharVar("DARKNAR", 1)       
        local target = mob:getTarget()
        local party  = target:getAlliance()
        for _, v in ipairs(party) do
            v:addStatusEffect(tpz.effect.TERROR, 1, 0, 30)
            v:disengage()
            mob:resetEnmity(v)
            if v:getObjType() == tpz.objType.PC then
                mob:setHP(1500000)                
                mob:disengage()
                mob:timer(5000, function(mobArg)
                    v:PrintToPlayer(string.format("Dark Nar: I don't have time for this, get your crap and leave."), tpz.msg.channel.NS_SAY)
                    v:PrintToPlayer(string.format("You have obtained Nar's Essence."), tpz.msg.channel.SYSTEM_3)
                end)
                mob:timer(30000, function(mobArg)
                    v:warp()
                end)
            end
        end
    end
end

function onMobDeath(mob, player, isKiller)
end
