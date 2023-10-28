module primitives

pub struct Health {
mut:
	hp []int // %amount of incomming / outgoing heals / attacks
	dmg []f64 // amount of incomming / outgoing heals / attacks
	ticks []int // count of incomming / outgoing heals / attacks
	suffer []f64 // time of incomming / outgoing boons / debuffs normalized
}

pub fn init_health() Health {
	return Health{
		hp: [618, 0, 0, 0]
		dmg: [0.0, 0.0, 0.0, 0.0]
		ticks: [0, 0, 0, 0]
		suffer: [0.0, 0.0, 0.0, 0.0]
	}
}