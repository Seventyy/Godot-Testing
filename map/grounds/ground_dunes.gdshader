shader_type spatial;
render_mode world_vertex_coords;

uniform sampler2D normal_texture : hint_normal_roughness_texture;

uniform sampler2D dunes_texture;
uniform sampler2D sand_texture;
uniform float sand_texture_scale;

varying vec2 vertex_position;

void vertex() {
	vertex_position = VERTEX.xz / sand_texture_scale;
	VERTEX.y = texture(dunes_texture, VERTEX.xz).r*.9-.2;
}

void fragment() {
	ALBEDO = texture(sand_texture, vertex_position).rgb;
}
