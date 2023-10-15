module play

import primitives
import funcs

struct BasicStats {
mut:
	body primitives.Stream
	nrgy []primitives.Stream
}

fn init_basic_stats() BasicStats {
	mut buffer := BasicStats{ body: primitives.init_stream() }
	luck := funcs.init_epoch() % 10
	mut ecount := 0
	if luck >= 5 { ecount = 4 } else { ecount = 3 }
	if luck == 0 { ecount = 2 } ; if luck == 9 { ecount = 5 }
	for _ in 0..ecount { buffer.nrgy << primitives.init_stream() }
	return buffer
}