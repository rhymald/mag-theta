module primitives

fn test_all() {
	for each in elems() {
		println(init_stream(each).tojson())
	}
	for each in physs() {
		println(init_stream(each).tojson())
	}

}