module primitives

import math
import funcs

const (
	timestep = 1000
	portion = 1000
	instant = [
		"Damages", // ( +elem: amount )x0..len(elements)
		       // ( -elem: amount )x0..1
	]
	delayed = [
		"GainDot", // foreign: ( -elem, weight )x0..sqrt(pool)
		           // native:  (  +idx, weight )x0..len(flock)
	]
)

fn init_effect_dmg(element string, value f64) map[string]int {
	mut buffer := map[string]int
	buffer[element] = int(math.round( value * portion ))
	return buffer
}

fn init_effect_gain_dot(element int, weight f64) map[int]int {
	mut buffer := map[int]int
	if element >= 0 {
		buffer[element] = 1
	} else {
		buffer[element] = int(math.round( weight * portion ))
	}
	return buffer
}

fn init_effects() map[string]map[string]map[string]int { return map[string]map[string]map[string]int{} }

fn (effects map[string]map[string]map[string]int) with_damage(elem string, dmg f64) map[string]map[string]map[string]int {
	mut buffer := effects.clone() 
	mut damages := init_effect_dmg(elem, dmg)
	ts := funcs.init_epoch() / timestep * timestep
	mut bbuffer := map[string]map[string]int{}
	if ts.str() in buffer { bbuffer = buffer[ts.str()].clone() }
	if instant[0] in bbuffer { 
		mut sum := map[string]int{}
		bbbuffer := bbuffer[instant[0]].clone()
		for ei in nullindex..(elemlist.len) {
			element := elemlist[ei]
			newdmg := bbbuffer[element] + damages[element]
			if newdmg != 0 { sum[element] = newdmg }
			// if bbbuffer is map[string]int {
			// }
		}
		bbuffer[instant[0]] = sum.clone()
	} else { bbuffer[instant[0]] = damages.clone() }
	buffer[ts.str()] = bbuffer.clone()
	return buffer
}

fn (effects map[string]map[string]map[string]int) with_gain_dot(indelem int, weight f64, delay f64) map[string]map[string]map[string]int {
	mut buffer := effects.clone() 
	mut dots := init_effect_gain_dot(indelem, weight)
	ts := (funcs.init_epoch() + i64(delay)) / timestep * timestep
	mut bbuffer := map[string]map[string]int{}
	if ts.str() in buffer { bbuffer = buffer[ts.str()].clone() }
	if delayed[0] in bbuffer {
		mut newdots := bbuffer[delayed[0]].clone()
		for idx, wght in dots {
			if idx.str() in newdots && idx >= 0 { 
				newdots[idx.str()] = newdots[idx.str()] + 1
			} else { if idx < 0 { newdots[elem(-idx)] = wght } else { newdots[idx.str()] = 1 }}
		}
		bbuffer[delayed[0]] = newdots.clone()
	} else {
		mut dummy := map[string]int{}
		for idx, wght in dots { 
			if idx < 0 { dummy[elem(-idx)] = wght } else { dummy[idx.str()] = wght } 
		}
		bbuffer[delayed[0]] = dummy.clone()
	}
	buffer[ts.str()] = bbuffer.clone()
	return buffer
}