shader_type canvas_item;

uniform bool outline_enabled = true;
uniform vec4 outline_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float line_thickness : hint_range(0.0, 4.0) = 1.0;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    COLOR = tex_color;

    if (outline_enabled) {
	    // If this pixel is transparent, check neighbors for opaque pixels
	    if (tex_color.a < 0.1) {
	        vec2 texel_size = TEXTURE_PIXEL_SIZE * line_thickness;

	        float left   = texture(TEXTURE, UV + vec2(-texel_size.x, 0.0)).a;
	        float right  = texture(TEXTURE, UV + vec2(texel_size.x, 0.0)).a;
	        float up     = texture(TEXTURE, UV + vec2(0.0, -texel_size.y)).a;
	        float down   = texture(TEXTURE, UV + vec2(0.0, texel_size.y)).a;

	        float neighbor_alpha = max(max(left, right), max(up, down));

	        if (neighbor_alpha > 0.1) {
	            COLOR = outline_color;
	        }
	    }
	}
}