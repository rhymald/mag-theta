module play

struct Conditions {
mut:
	can_regen int
	can_move int
	can_cast int
}
// -1: perm no fo system needs
//  0: perm yes
// 1..inf: temp no until x

fn init_conditions() Conditions {
	return Conditions{
		can_move: 0
		can_regen: 0
		can_cast: 0
	}
}

fn (cond Conditions) block() {
	cond.can_cast = -cond.can_cast-1
	cond.can_move = -cond.can_move-1
	cond.can_regen = -cond.can_regen-1
}

fn (cond Conditions) unblock() {
	cond.can_cast = -cond.can_cast+1
	cond.can_move = -cond.can_move+1
	cond.can_regen = -cond.can_regen+1
}
