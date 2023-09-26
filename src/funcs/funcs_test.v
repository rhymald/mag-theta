module funcs

fn test_me() {
	println('>>---> Start: ${init_epoch()}')
	for _ in 0..12 {
		print(round(init_f64()))
		init_delay(1000 / 12)
		print(' ')
	}
	println('')
	println('>>-----> End: ${init_epoch()}')
}