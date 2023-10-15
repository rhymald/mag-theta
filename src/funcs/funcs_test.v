module funcs

fn test_all() {
	println('>>---> Start: ${init_epoch()}')
	print('Random numbers: ')
	for _ in 0..12 {
		print(round(init_f64()))
		init_delay(1000 / 12)
		print(' ')
	}
	println('')
	println('>>-----> End: ${init_epoch()}')
}