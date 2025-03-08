shader_type canvas_item;

uniform float size;
uniform float rate;
uniform vec4 color:source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	float max_uv = max(abs(0.5-uv.x)*rate-(rate-1.0)*0.5,abs(0.5-uv.y));
	if(max_uv<=0.5&&max_uv>=0.5-size) COLOR = color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
