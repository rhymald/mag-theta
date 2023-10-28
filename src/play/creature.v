module play 

struct Creature {
	base BasicStats
	atts Attributes
	cond Conditions
	cons Consumables
mut:
	olds struct {
		base BasicStats
		atts Attributes
		cond Conditions
		cons Consumables
	}
}

fn init_creature() Creature {
	base := init_basic_stats()
	return Creature{
		base: base
		atts: base.init_attributes()
		cond: init_conditions()
		cons: base.init_consumables()
	}
}
