module play

import json

struct Testiful_Player {
	base struct {
		body string
		nrgy map[string]string
	}
	atts string
	cons struct {
		health string
		pool string
	}
	cond string
}

fn (your Creature) fancify() Testiful_Player {
	mut strlist := []string{}
	for each in your.base.nrgy {
		strlist[json.encode(each)] = each.tojson()
	}
	return Testiful_Player{
		base: struct {
			body: your.base.body.tojson()
			nrgy: strlist
		}
		atts: json.encode(your.atts)
		cons: struct {
			health: json.encode(your.cons.health)
			pool: json.encode(your.cons.pool)
		}
		cond: json.encode(your.cond)
	}
}
