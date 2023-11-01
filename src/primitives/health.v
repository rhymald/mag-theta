module primitives

pub struct Health {
mut:
	// hp []int
	dmg map[string][]int
	ticks map[string][]int
	suffer []int
}

pub fn init_health() Health {
	// [4]any{ +in, -in, +out, -out } by basic elem
	mut buffer_dmgs := map[string][]int{}
	mut buffer_ticks := map[string][]int{}
	buffer_dmgs[elem(5)] = [618, 0, 0, 0]
	buffer_ticks[elem(0)] = [0, 0, 0, 0]
	return Health{
		dmg: buffer_dmgs
		ticks: buffer_ticks
		suffer: [0, 0, 0, 0]
	}
}