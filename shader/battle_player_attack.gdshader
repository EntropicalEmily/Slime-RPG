shader_type canvas_item;

uniform float intensity: hint_range(0.0, 1.0) = 0.0;

void vertex() {
	float size = 1.0 + (-sin(TIME*3.0) * 1.7) * intensity;
	VERTEX.y = VERTEX.y * size;
}

void fragment() {
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
