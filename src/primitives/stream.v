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
		element: str.element()
		spread: funcs.round(str.air)
		power: funcs.round(str.flm)
		toughness: funcs.round(str.stn)
		agility: funcs.round(str.wtr)
	}
	return json.encode(result)
}

pub fn (str Stream) len() f64 { return math.sqrt(str.stn*str.stn+str.air*str.air+str.flm*str.flm+str.wtr*str.wtr) }
pub fn (str Stream) element() string {
	major := math.max( math.max( str.stn, str.air ), math.max( str.flm, str.wtr ) )
	all := [str.stn, str.air, str.flm, str.wtr]
	mut minor := 0.0
	for each in all { if each != major && each > minor { minor = each }}
	mut element := null_elem()
	if major == str.air { element = elem(1) }
	if major == str.flm { element = elem(2) }
	if major == str.stn { element = elem(3) }
	if major == str.wtr { element = elem(4) }
	leng := str.len()
	if major >= leng/math.phi && minor >= leng/math.sqrt(3) {
		if minor == str.air && element != elem(3) { element += elem(1) }
		if minor == str.flm && element != elem(4) { element += elem(2) }
		if minor == str.stn && element != elem(1) { element += elem(3) }
		if minor == str.wtr && element != elem(4) { element += elem(4) }			
	}
	if major < leng/math.sqrt(2) { return null_elem() }
	return element
}