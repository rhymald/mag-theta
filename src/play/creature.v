module play 

struct Creature {
	base BasicStats
	atts Attributes
mut:
	cond Conditions
	cons Consumables
	olds struct {
	mut:
		base BasicStats
		atts Attributes
		cond Conditions
		cons Consumables
	}
	// effects
	// actions
}

