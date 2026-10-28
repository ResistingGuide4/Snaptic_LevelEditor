extends Node3D

@export var base_size: float = 0.05 # Adjust this to change your overall object size

func _process(_delta: float) -> void:
	var camera = get_viewport().get_camera_3d()
	if camera:
		# Calculate distance from parent origin to camera
		var dist = global_position.distance_to(camera.global_position)
		
		# If using an orthogonal camera, use size instead of distance
		if camera.projection == Camera3D.PROJECTION_ORTHOGONAL:
			scale = Vector3.ONE * (camera.size * base_size)
		else:
			# For perspective, scale linearly with distance
			scale = Vector3.ONE * (dist * base_size)
