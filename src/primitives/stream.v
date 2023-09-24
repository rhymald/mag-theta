module primitives

import funcs

struct Stream {
mut:
	c i64
	a i64
	d i64
	e string
}

pub fn init_stream(e string) Stream {
	cre, alt, des := 1, 2, 3
	str := Stream{
		c: cre
		a: alt
		d: des
		e: e
	}
	return str
}