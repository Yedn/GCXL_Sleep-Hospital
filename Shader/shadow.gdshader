shader_type canvas_item;

uniform vec4 gray_color:source_color;
uniform vec4 green_color:source_color;
uniform vec4 yellow_color:source_color;
uniform vec4 red_color:source_color;
uniform float percent;
uniform int state;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if(state==0)
		COLOR = gray_color;
	else if(state==1)
		COLOR = green_color;
	else if(state==2)
		COLOR = yellow_color;
	else if(state==3)
		COLOR = red_color;
	else
		COLOR = vec4(1,1,1,0);
	if(1.0-UV.y>=percent) COLOR.a = 0.0;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
