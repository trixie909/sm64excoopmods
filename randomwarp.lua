-- name: Random Warp
-- description: warps take you somewhere they don't go
function activate()
    active = true
end
function DeathLoopPrevent(m)
    active = false
end
local np = gNetworkPlayers[0]
function warpcheck()
    if active == true then
        warp_to_level(math.random(COURSE_BOB, COURSE_SA), 1, np.currActNum)
    end
end
hook_event(HOOK_ON_LEVEL_INIT, activate)
hook_event(HOOK_ON_SCREEN_TRANSITION, warpcheck)
hook_event(HOOK_ON_DEATH, DeathLoopPrevent)