module primitives

import funcs

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
		effects = effects.with_dmg(elem(element), funcs.init_f64())
		funcs.init_delay(3)
	}
	println(effects)
}