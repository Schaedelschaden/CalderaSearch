-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Tonberry Kinq
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special"),
    require("scripts/mixins/rage")
}
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 734, hpp = 25}, -- uses specified mob skill at HP%
        },
    })

    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes

	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 900) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
	mob:addMod(tpz.mod.EVA, 150) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 100) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.STR, 130)
    mob:addMod(tpz.mod.DEX, 130)
    mob:addMod(tpz.mod.AGI, 130)
    mob:addMod(tpz.mod.VIT, 130)
    mob:addMod(tpz.mod.MND, 130)
    mob:addMod(tpz.mod.CHR, 130)
    mob:addMod(tpz.mod.INT, 130)
    mob:addMod(tpz.mod.REGEN, 500)
    mob:addMod(tpz.mod.QUAD_ATTACK, 5)
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 8)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 15)
end

function onMobDeath(mob, player, isKiller)
    local playerName   = player:getName()
	local mobName      = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName    = mobName:sub(1, 18)
	local KillCounter  = player:getCharVar("KillCounter_"..shortName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end
