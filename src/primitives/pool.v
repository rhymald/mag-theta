module primitives

pub struct Pool {
	max_pool []int
mut:
	inner []int // predictable weight
	outer map[string]map[string]int // unpred weight by time
}

pub fn (flock []Stream) init_pool() Pool {
	mut max_pools := []int{}
	for each in flock {
		max_pools << each.capacity()
	}
	return Pool{
		max_pool: max_pools
		inner: []int{}
		outer: map[string]map[string]int{}
		
	}
}
