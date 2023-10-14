module primitives

const (
	nullelement := '🌑'
	nullindex := 4
	elemlist := ['🛡', '🪨', '🪵', '🌱', '🌑', '🌪', '🔥', '🪨', '🧊', '🩸', '🎶', '☀️']
	elemnames := ['forged', 'solid', 'plated', 'flesh', 'empty', 'air', 'fire', 'stone', 'water', 'mallom', 'noise', 'resonance']
)

pub fn elem(i int) string {
	if i >= -nullindex && i < elemlist.len-nullindex { return elemlist[i+nullindex] }
	return 'error'
}

pub fn elems() map[string]string {
	mut buffer := map[string]string{}
	for i, each in elemlist {
		buffer[elemnames[i]] = each
	} 
	return buffer
}