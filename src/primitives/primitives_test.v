module primitives

fn test_all() {
	for _ in 0..4 {
		println(init_stream().tojson())
	}
}