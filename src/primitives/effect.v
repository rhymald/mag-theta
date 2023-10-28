module primitives

const (
	instant = [
		"dmg", // ( +elem: amount )x0..len(elements)
		       // ( -elem: amount )x0..1
	]
	delayed = [
		"gain_dot", // foreign: ( +time: elem, weight )x0..sqrt(pool)
		            // native:  ( -idx:  time, weight )x0..len(flock)
	]
)

