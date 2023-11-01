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
	mut strlist := map[string]string{}
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

fn test_chunks() {
	base := init_basic_stats()
	println(' >>> Body:${base.body.tojson()}')
	for i, stream in base.nrgy { println('Stream[${i+1}]:${stream.tojson()}') }
	atts := base.init_attributes()
	println(atts)
	mut conds := init_conditions()
	println(conds)
	conds.unblock()
	println(conds)
	cons := base.init_consumables()
	println(cons)
}

fn test_player() {
	creature := init_creature()
	println(creature.fancify())
}
