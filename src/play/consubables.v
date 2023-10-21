module play

// import primitives

struct Consumables {
	max_pool []int
mut:
	hp int
	inner []int // predictable weight
	outer map[string]map[string]int // unpred weight
}

fn (base BasicStats) init_consumables() Consumables {
	mut max_pools := []int{}
	for each in base.nrgy {
		max_pools << each.capacity()
	}
	return Consumables{
		max_pool: max_pools
		hp: 618
		inner: []int{}
		outer: map[string]map[string]int{}
	}
}