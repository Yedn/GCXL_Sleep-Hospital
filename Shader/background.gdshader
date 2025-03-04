shader_type canvas_item;

uniform vec4 color:source_color;
uniform float alpha = 0.2;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	//COLOR.rgb = color.rgb;
	//COLOR.a = alpha;
	//COLOR = mix(color,texture(SCREEN_TEXTURE,SCREEN_UV),0.5);
	COLOR = color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
