module primitives

import funcs
import math

struct Stream {
mut:
	c f64
	a f64
	d f64
	e string
}

pub fn init_stream(e string) Stream {
	cre, alt, des := math.phi, funcs.init_f64(), math.pi
	str := Stream{
		c: funcs.round(1 / cre)
		a: funcs.round(2 / alt)
		d: funcs.round(3 / des)
		e: e
	}
	return str
}