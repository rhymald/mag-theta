module primitives

fn test_all() {
	for i in -4..8 {
		print(elem(i)+' ')
	}
	for _ in 0..64 {
		println(init_stream().tojson())
	}
}