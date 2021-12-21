-----------------------------------
-- Gambits decision making system
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------

ai = ai or {}

-- Target
ai.target =
{
    SELF       = 0, -- Targets the trust
    PARTY      = 1, -- Targets the trust's party
    TARGET     = 2, -- Targets the trust's current combat target
    MASTER     = 3, -- Targets the trust's master
    TANK       = 4,
    MELEE      = 5,
    RANGED     = 6,
    CASTER     = 7,
    TOP_ENMITY = 8,
    CURILLA    = 9, -- Special case for Rainemard
}
ai.t = ai.target

-- Condition
ai.condition =
{
    ALWAYS             = 0, -- Always use
    HPP_LT             = 1, -- HPP less than specified %
    HPP_GTE            = 2, -- HPP greater than or equal to specified %
    MPP_LT             = 3, -- MPP less than specified %
    TP_LT              = 4, -- TP less than specified %
    TP_GTE             = 5, -- TP greater than or equal to specified %
    STATUS             = 6, -- Has the specified status
    NOT_STATUS         = 7, -- Does not have the specified status
    STATUS_FLAG        = 8, -- Has a status with a specified flag
    HAS_TOP_ENMITY     = 9, -- Has the top enmity on the enemy's enmity list
    NOT_HAS_TOP_ENMITY = 10, -- Does not have the top enmity on the enemy's enmity list
    SC_AVAILABLE       = 11, -- Enemy has a skillchain effect active
    NOT_SC_AVAILABLE   = 12, -- Enemy does not have a skillchain effect active
    MB_AVAILABLE       = 13, -- Enemy has a completed skillchain effect active and can be magic burst
    READYING_WS        = 14, -- Readying a weaponskill
    READYING_MS        = 15, -- Readying a mob skill
    READYING_JA        = 16, -- Readying a job ability
    CASTING_MA         = 17, -- Is casting magic
    RANDOM             = 18, -- Selects a random time
    NO_SAMBA           = 19, 
}
ai.c = ai.condition

-- Reaction
ai.reaction =
{
    ATTACK  = 0,
    RATTACK = 1,
    MA      = 2,
    JA      = 3,
    WS      = 4,
    MS      = 5,
    MSG     = 6,
}
ai.r = ai.reaction

-- Select
ai.select =
{
    HIGHEST             = 0, -- Prioritizes the highest weapon/mob skill
    LOWEST              = 1, -- Prioritizes the lowest weapon/mob skill
    SPECIFIC            = 2, -- Prioritizes a specified weapon/mob skill
    RANDOM              = 3, -- Selects a random weapon/mob skill
    MB_ELEMENT          = 4, -- Prioritizes a weaponskill that will generate a specified element skillchain
    SPECIAL_AYAME       = 5,
    BEST_AGAINST_TARGET = 6,
    BEST_SAMBA          = 7,
    HIGHEST_WALTZ       = 8,
}
ai.s = ai.select

-- TP Move Trigger
ai.tp =
{
    ASAP   = 0, -- Performs weaponskills as soon as TP is available
    RANDOM = 1, -- Performs weaponskills randomly
    OPENER = 2, -- Prioritizes opening skillchains
    CLOSER = 3, -- Prioritizes closing skillchains
}