module play

import primitives

struct Consumables {
	pool primitives.Pool
	health primitives.Health
	// unspent []Effect
}


fn (base BasicStats) init_consumables() Consumables {
	return Consumables{
		pool: base.nrgy.init_pool()
		health: primitives.init_health()
	}
}
