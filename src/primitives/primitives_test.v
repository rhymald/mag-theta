module primitives

fn test_all() {
	print('>>--> List all elements:')
	for i in -4..8 {
		print(' '+elem(i))
	}
	println('')
	for _ in 0..16 {
		println(init_stream().tojson())
	}
}