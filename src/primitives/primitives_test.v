module primitives

fn test_all() {
	for _ in 0..64 {
		println(init_stream().tojson())
	}
}