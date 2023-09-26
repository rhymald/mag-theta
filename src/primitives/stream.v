module primitives

import funcs
import math
import json

struct Stream {
	e string
mut:
	c f64
	a f64
	d f64
}

pub fn init_stream(e string) Stream {
	cre, alt, des := funcs.init_f64()+funcs.init_f64(), funcs.init_f64()+funcs.init_f64(), funcs.init_f64()+funcs.init_f64()
	vector := math.sqrt( cre*cre + alt*alt + des*des )
	str := Stream{
		c: funcs.round(cre/vector)
		a: funcs.round(alt/vector)
		d: funcs.round(des/vector)
		e: e
	}
	return str
}

fn (str Stream) tojson() string {
	return json.encode(str)
}