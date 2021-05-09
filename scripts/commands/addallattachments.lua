---------------------------------------------------------------------------------------------------
-- func: addallattachments
-- desc: Unlocks all attachments
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

local ValidAttachments = {
  8193, 8194, 8195, 8196, 8197, 8198, 8224, 8225, 8226, 8227,
  8449, 8450, 8451, 8452, 8453, 8454, 8455, 8456, 8458,
  8462, 8481, 8482, 8483, 8484, 8485, 8486, 8487, 8488, 8489, 8490, 8491, 8493, 8497,
  8513, 8514, 8515, 8516, 8517, 8518, 8519, 8520,
  8523, 8524, 8526, 8528, 8545, 8546, 8547, 8548, 8549, 8550, 8551,
  8555, 8577, 8578, 8579, 8580, 8581, 8582, 8583, 8584, 8585,
  8587, 8609, 8610, 8611, 8612, 8613, 8614, 8615, 8616,
  8619, 8641, 8642, 8643, 8644, 8645, 8646, 8648, 8651,
  8673, 8674, 8675, 8676, 8677, 8678, 8680, 8682, 9138, 9143, 9230,
  
-- Higher level attachments
-- 8461, 8459, 8463, 8457, 8460, 8464, 8466, 8522, 8525, 8527, 8521, 8652, 8650, 8653, 8655, 8654, 8649, 8554, 8556,
-- 8552, 8553, 8557, 8494, 8492, 8495, 8496, 8498, 8681, 8683, 8622, 8617, 8621, 8620, 8618, 8586, 8589, 8588, 8590,
}

local function AddAllAttachments(player)
    for i = 1, #ValidAttachments do
        player:unlockAttachment(ValidAttachments[i])
    end
end

function onTrigger(player, target)
    if (target == nil) then
        AddAllAttachments(player)
    else
        local targ = GetPlayerByName(target)
        if (targ == nil) then
            player:PrintToPlayer(string.format( "Player named '%s' not found!", target ))
        else
            AddAllAttachments(targ)
        end
    end
end