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
	element string // depends on major
	spread f64 // aoe, swiftness, velocity
	power f64 // penetration, damage
	toughness f64 // stability, structure
	agility f64 // control, precision
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
	result := Stream_Formatted{
		element: str.element() // dummy
		spread: funcs.round(str.air + 1)
		power: funcs.round(str.flm + 1)
		toughness: funcs.round(str.stn + 1)
		agility: funcs.round(str.wtr + 1)
	}
	return json.encode_pretty(result)
}

pub fn (str Stream) len() f64 { return math.sqrt(str.stn*str.stn+str.air*str.air+str.flm*str.flm+str.wtr*str.wtr) }
pub fn (str Stream) element() string {
	max := math.max( math.max( str.stn, str.air ), math.max( str.flm, str.wtr ) )
	if max < str.len() * math.sqrt( 0.5 ) { return null_elem() }
	if max == str.air { return elem(1) }
	if max == str.flm { return elem(2) }
	if max == str.stn { return elem(3) }
	if max == str.wtr { return elem(4) }
	return elem(0)
}