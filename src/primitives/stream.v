module primitives

import funcs
import math
import json

const (
	degrees = ['✧ ', '☆ ', '★ ', '★ ☆ ', '★ ★ ', '✶ ', '✸ ']
)

pub struct Stream {
pub:
	air f64
	flm f64
	stn f64
	wtr f64
}

struct Stream_Formatted {
	degree string // depends on major
	element string // depends on major
	spread f64 // aoe, swiftness, velocity
	power f64 // penetration, damage
	toughness f64 // stability, structure
	agility f64 // control, precision
	length f64
}

pub fn init_stream() Stream {
	ai := funcs.init_f64()+funcs.init_f64()+funcs.init_f64()+2
	fi := funcs.init_f64()+funcs.init_f64()+funcs.init_f64()+2
	st := funcs.init_f64()+funcs.init_f64()+funcs.init_f64()+2
	wa := funcs.init_f64()+funcs.init_f64()+funcs.init_f64()+2
	vector := math.sqrt( ai*ai + fi*fi + st*st + wa*wa )
	str := Stream{
		air: funcs.round(ai/vector)
		flm: funcs.round(fi/vector)
		stn: funcs.round(st/vector)
		wtr: funcs.round(wa/vector)
	}
	return str
}

pub fn (str Stream) tojson() string {
	element, degree := str.element()
	result := Stream_Formatted{
		element: element
		degree: degree
		spread: funcs.round(str.air)
		power: funcs.round(str.flm)
		toughness: funcs.round(str.stn)
		agility: funcs.round(str.wtr)
		length: funcs.round(str.len())
	}
	return json.encode(result)
}

pub fn (str Stream) len() f64 { return math.sqrt(str.stn*str.stn+str.air*str.air+str.flm*str.flm+str.wtr*str.wtr) }
pub fn (str Stream) element() (string, string) {
	// EMPTINESS(w/a)/RESONANCE(s/f) are special, - depends on stream.len or .shape comparsion to each other - not here
	major := math.max( math.max( str.stn, str.air ), math.max( str.flm, str.wtr ) )
	all := [str.stn, str.air, str.flm, str.wtr]
	mut minor := 0.0
	for each in all { if each != major && each > minor { minor = each }}
	mut element, mut degree := null_elem(), ''
	if major == str.air { element = elem(1) }
	if major == str.flm { element = elem(2) }
	if major == str.stn { element = elem(3) }
	if major == str.wtr { element = elem(4) }
	leng := str.len()
	if major >= leng/math.phi && minor >= leng/math.sqrt(3) { // double
		degree = degrees[3] // advanced
		original := element
		if minor == str.air { if element == elem(3) { element = elem(6) ; degree = degrees[5] } else { element += elem(1) }} // enthusiast
		if minor == str.flm { if element == elem(4) { element = elem(5) ; degree = degrees[5] } else { element += elem(2) }}
		if minor == str.stn { if element == elem(1) { element = elem(6) ; degree = degrees[5] } else { element += elem(3) }}
		if minor == str.wtr { if element == elem(2) { element = elem(5) ; degree = degrees[5] } else { element += elem(4) }}
		if major / minor < math.sqrt( math.sqrt(3) / math.phi ) { 
			if degree != degrees[5] { degree = degrees[4] } else { element += original ; degree = degrees[6] } // master
		}
	}
	if major < leng/math.sqrt(3) { return null_elem(), degrees[0] } // no affinity
	if major < leng/math.sqrt(2) && minor < leng/math.sqrt(3) { return element, degrees[1] } // about to get affinity
	if degree == '' { degree = degrees[2] } // attuned to an element
	return element, degree
}

pub fn (str Stream) modify_scale(l f64) Stream {
	mod := l / str.len()
	return Stream{
		air: funcs.round(str.air * mod)
		flm: funcs.round(str.flm * mod)
		stn: funcs.round(str.stn * mod)
		wtr: funcs.round(str.wtr * mod)
	}
}