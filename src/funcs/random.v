module funcs

import math
import rand

pub fn round(a f64) f64 {
	return ( math.round(a * 1000) / 1000 )
}

pub fn init_f64() f64 {
	return (rand.f64())
}
