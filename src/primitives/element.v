module primitives

const (
	elemlist := ['🌑', '🌪', '🔥', '🪨', '🧊', '🩸', '🎶', '☀️']
	physlist := ['🌑', '🌱', '🪵', '🪨', '🛡 ']
)

pub fn elem(i int) string {
	if i > 0 && i < elemlist.len { return elemlist[i] }
	return 'error'
}

pub fn phys(i int) string {
	if i > 0 && i < physlist.len { return physlist[i] }
	return 'error'
}

pub fn elems() []string {
	return elemlist
}

pub fn physs() []string {
	return physlist
}