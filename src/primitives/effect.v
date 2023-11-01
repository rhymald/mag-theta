module primitives

import math

const (
	instant = [
		"dmg", // ( +elem: amount )x0..len(elements)
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