-- name: Keep It Moving
-- description: when you do not move, you explode
--credit to sunk on the discord for helping me do this :D
local spawned = false
function level_init()
    spawned = true
end

function update(m)
	if m.input & INPUT_ZERO_MOVEMENT ~= 0 then
		spawned = false
	else
		spawned = true
	end
	if not spawned then
		if m.forwardVel == 0 and m.vel.y == 0 then
			spawn_sync_object(
			id_bhvExplosion,
			E_MODEL_EXPLOSION,
			m.pos.x, m.pos.y + 70, m.pos.z,
			nil
			)
			set_mario_action(m, ACT_DISAPPEARED, 0)
			level_trigger_warp(m, WARP_OP_DEATH)
	
		end
	end
end	
hook_event(HOOK_MARIO_UPDATE, update)
hook_event(HOOK_ON_LEVEL_INIT, level_init)