module primitives

import math
import funcs

const (
	instant = [
		"Damage", // ( +elem: amount )x0..len(elements)
		       // ( -elem: amount )x0..1
	]
	delayed = [
		"gain_dot", // foreign: ( -elem, weight )x0..sqrt(pool)
		            // native:  (  +idx, weight )x0..len(flock)
	]
)

fn init_effect_dmg(element string, value f64) map[string]int {
	mut buffer := map[string]int
	buffer[element] = int(math.round( value * 1000 ))
	return buffer
}

fn init_effect_gain_dot(element int, weight f64) map[int]int {
	mut buffer := map[int]int
	buffer[element] = int(math.round( weight * 1000 ))
	return buffer
}

interface Effect {}

fn init_effects() map[i64]map[string]Effect { return map[i64]map[string]Effect{} }

fn (effects map[i64]map[string]Effect) with_dmg(elem string, dmg f64) map[i64]map[string]Effect {
	mut buffer := effects.clone() 
	mut damages := init_effect_dmg(elem, dmg)
	ts := funcs.init_epoch() / 382 * 382
	mut bbuffer := map[string]Effect{}
	if ts in buffer { bbuffer = buffer[ts].clone() }
	if instant[0] in bbuffer { 
		mut sum := map[string]int{}
		bbbuffer := bbuffer[instant[0]]
		elementlist := elems()
		for _, element in elementlist {
			if bbbuffer is map[string]int {
				newdmg := bbbuffer[element] + damages[element]
				if newdmg != 0 { sum[element] = newdmg }
			}
		}
		bbuffer[instant[0]] = sum.clone()
	} else { bbuffer[instant[0]] = damages.clone() }
	buffer[ts] = bbuffer.clone()
	return buffer
}
