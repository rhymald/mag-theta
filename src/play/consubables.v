module play

// import primitives

struct Consumables {
	pool Pool
	health Health
	// unspent []Effect
}

struct Pool {
	max_pool []int
mut:
	inner []int // predictable weight
	outer map[string]map[string]int // unpred weight by time
}

struct Health {
mut:
	hp []int // %amount of incomming / outgoing heals / attacks
	dmg []f64 // amount of incomming / outgoing heals / attacks
	ticks []int // count of incomming / outgoing heals / attacks
	suffer []f64 // time of incomming / outgoing boons / debuffs normalized
}

fn (base BasicStats) init_consumables() Consumables {
	return Consumables{
		pool: base.init_pool()
		health: base.init_health()
	}
}

fn (base BasicStats) init_pool() Pool {
	mut max_pools := []int{}
	for each in base.nrgy {
		max_pools << each.capacity()
	}
	return Pool{
		max_pool: max_pools
		inner: []int{}
		outer: map[string]map[string]int{}
		
	}
}

fn (base BasicStats) init_health() Health {
	return Health{
		hp: [618, 0, 0, 0]
		dmg: [0.0, 0.0, 0.0, 0.0]
		ticks: [0, 0, 0, 0]
		suffer: [0.0, 0.0, 0.0, 0.0]
	}
}