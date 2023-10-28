module play 

struct Creature {
	base BasicStats
	atts Attributes
	cond Conditions
	cons Consumables
	olds struct {
		base BasicStats
		atts Attributes
		cond Conditions
		cons Consumables
	}
}

fn init_creature() Creature {
	return Creature{}
}
