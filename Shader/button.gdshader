shader_type canvas_item;

uniform bool visible = false;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if(visible==true)
		COLOR = vec4(1,1,1,1);
	else
		COLOR = vec4(1,1,1,0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
