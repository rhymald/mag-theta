module primitives

import funcs
import json

fn test_elements() {
	print('>>--> List all elements:')
	for i in -4..8 {
		if i == 0 { print(' <-<< Physical |'+elem(i)+'| Energetic >>-> ') } else { print(' '+elem(i)) }
	}
	println('')
}

fn test_effects() {
	println('>>--> Composing effects:')
	mut effects := init_effects()
	for i in 0..16 {
		element := int(funcs.init_epoch() % 8)
		effects = effects.with_damage(elem(element), funcs.init_f64())
		funcs.init_delay(16 + 256*funcs.init_f64())
		effects = effects.with_gain_dot( (-element+4)%8, funcs.init_f64(), funcs.init_f64()*3000)
		funcs.init_delay(16 + 256*funcs.init_f64())
	}
	// println(json.encode(effects))
	for ts, each in effects {
		for kind, effect in each {
			println('      | ${ts} | ${kind} | ${json.encode(effect)} ')
		}
	}
}