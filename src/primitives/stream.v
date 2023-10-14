module primitives

import funcs
import math
import json

pub struct Stream {
pub:
	air f64
	flm f64
	stn f64
	wtr f64
}

struct Stream_Formatted {
	element string
	swiftness f64
	power f64
	structure f64
	flexibility f64
}

pub fn init_stream() Stream {
	ai, fi, st, wa := funcs.init_f64()+funcs.init_f64(), funcs.init_f64()+funcs.init_f64(), funcs.init_f64()+funcs.init_f64(), funcs.init_f64()+funcs.init_f64()
	vector := math.sqrt( ai*ai + fi*fi + st*st + wa*wa )
	str := Stream{
		air: funcs.round(ai/vector)
		flm: funcs.round(fi/vector)
		stn: funcs.round(st/vector)
		wtr: funcs.round(wa/vector)
	}
	return str
}

fn (str Stream) tojson() string {
	return json.encode(Stream_Formatted{
		element: elem(0) // dummy
		swiftness: str.air
		power: str.flm 
		structure: str.stn
		flexibility: str.wtr
	})
}