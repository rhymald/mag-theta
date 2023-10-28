module play

import primitives

struct Consumables {
	pool primitives.Pool // consume online as fuel
	health primitives.Health // consume offline as exp
}

fn (base BasicStats) init_consumables() Consumables {
	return Consumables{
		pool: base.nrgy.init_pool()
		health: primitives.init_health()
	}
}
