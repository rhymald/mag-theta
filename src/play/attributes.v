module play

import funcs

struct Attributes {
pub:
	toughness f64
	vitality f64
	stamina f64
	power f64
}

fn (base BasicStats) init_attributes() Attributes {
	sum := base.body.stn+base.body.flm+base.body.wtr+base.body.air
	return Attributes{
		toughness: funcs.round( base.body.stn*16/sum )
		vitality: funcs.round( base.body.wtr*256/sum )
		stamina: funcs.round( base.body.air*64/sum )
		power: funcs.round( base.body.flm*16/sum )
	}
}