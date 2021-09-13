---------------------------------------------
-- Tarutaru Warp II
-- End Ark Angel TT teleport
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    -- local t = mob:getSpawnPos()
    -- local angle = math.random() * 2 * math.pi
    -- local pos = NearLocation(t, 18.0, angle)
	
	local mobID = mob:getID()
	local pos = {}
--	local teleNumber = mob:getLocalVar("AA_TT_TELEPORT")
		
	-- if (teleNumber > 6) then
		-- teleNumber = 1
	-- end
	
	local bf1Pos = {{x = -14.096, y = -20.163, z = -5.164}, {x = -30.669, y = -20.163, z = 4.309}, {x = -30.568, y = -20.163, z = 23.498}, {x = -13.944, y = -20.163, z = 33.167}, {x = 2.646, y = -20.163, z = 23.499}, {x = 2.786, y = -20.163, z = 4.105}}
	local bf2Pos = {{x = -562.537, y = -244.115, z = 37.039}, {x = -579.171, y = -244.115, z = 46.990}, {x = -579.052, y = -244.115, z = 66.153}, {x = -562.545, y = -244.115, z = 75.681}, {x = -545.806, y = -244.115, z = 66.029}, {x = -546.094, y = -244.115, z = 46.838}}
	local bf3Pos = {{x = 477.478, y = -319.117, z = 60.202}, {x = 460.909, y = -319.117, z = 69.941}, {x = 460.936, y = -319.117, z = 89.166}, {x = 477.488, y = -319.117, z = 98.802}, {x = 493.983, y = -319.117, z = 88.967}, {x = 494.034, y = -319.117, z = 69.824}}
	local bf4Pos = {{x = -14.117, y = -20.163, z = -5.457}, {x = -30.804, y = -20.163, z = 4.253}, {x = -30.839, y = -20.163, z = 23.674}, {x = -13.992, y = -20.163, z = 33.193}, {x = 2.780, y = -20.163, z = 23.562}, {x = 2.589, y = -20.163, z = 4.165}}
	local bf5Pos = {{x = -562.545, y = -244.115, z = 36.953}, {x = -579.259, y = -244.115, z = 46.7625}, {x = -579.061, y = -244.115, z = 66.091}, {x = -562.514, y = -244.115, z = 75.818}, {x = -545.668, y = -244.115, z = 66.111}, {x = -545.921, y = -244.115, z = 46.720}}
	local bf6Pos = {{x = 477.394, y = -319.117, z = 60.287}, {x = 460.961, y = -319.117, z = 69.951}, {x = 460.898, y = -319.117, z = 89.241}, {x = 477.480, y = -319.117, z = 98.812}, {x = 494.148, y = -319.117, z = 89.114}, {x = 494.177, y = -319.117, z = 69.750}}
	
	if (mobID == 17514512) then
		pos = bf1Pos[math.random(1, 6)]
	elseif (mobID == 17514513) then
		pos = bf2Pos[math.random(1, 6)]
	elseif (mobID == 17514514) then
		pos = bf3Pos[math.random(1, 6)]
	elseif (mobID == 17514526) then
		pos = bf4Pos[math.random(1, 6)]
	elseif (mobID == 17514534) then
		pos = bf5Pos[math.random(1, 6)]
	elseif (mobID == 17514542) then
		pos = bf6Pos[math.random(1, 6)]
	end
	
--	mob:setLocalVar("AA_TT_TELEPORT", teleNumber + 1)	
    mob:teleport(pos, battletarget)
	
    skill:setMsg(tpz.msg.basic.NONE)
	
    return 0
end