module play

import primitives
import funcs

struct BasicStats {
	body primitives.Stream
	nrgy []primitives.Stream
}

fn init_basic_stats() BasicStats {
	luck := funcs.init_epoch() % 10
	mut ecount := 0
	mut streams := []primitives.Stream{}
	if luck >= 5 { ecount = 4 } else { ecount = 3 }
	if luck == 0 { ecount = 2 } ; if luck == 9 { ecount = 5 }
	for _ in 0..ecount { streams << primitives.init_stream() }
	for _ in 0..(5-ecount) { 
		i := funcs.init_epoch() % streams.len
		streams[i] = streams[i].modify_scale(streams[i].len() + 1) 
	}
	buffer := BasicStats{ 
		body: primitives.init_stream(),
		nrgy: streams,
	}
	return buffer
}