module primitives

fn test_all() {
	for _ in 0..12 {
		println(init_stream().tojson())
	}
}