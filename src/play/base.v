module play

import primitives

struct BasicStats {
mut:
	body primitives.Stream
}

fn init_basic_stats(e string) BasicStats {
	if primitives.physs().index(e) >= 0 { 
		return BasicStats{ body: primitives.init_stream(e) }
	}
	return BasicStats{ body: primitives.init_stream(primitives.phys(0)) }
}