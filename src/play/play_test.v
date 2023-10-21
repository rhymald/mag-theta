module play 

// import primitives

fn test_player() {
	base := init_basic_stats()
	println('Body:      ${base.body.tojson()}')
	for i, stream in base.nrgy { println('Stream #${i+1}: ${stream.tojson()}') }
	atts := base.init_attributes()
	println(atts)
}