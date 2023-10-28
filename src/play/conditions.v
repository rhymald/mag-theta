module play

struct Conditions {
mut:
	can_run int
	can_cast int
	can_regen int
}

//-1: perm no fo system needs
// 0: perm yes
// 1..inf: temp no until x

fn init_conditions() Conditions {
	return Conditions{
		can_run: -1
		can_cast: -1
		can_regen: -1
	}
}

fn (mut cond Conditions) block() {
	cond.can_run = -cond.can_run-1
	cond.can_cast = -cond.can_cast-1
	cond.can_regen = -cond.can_regen-1
}

fn (mut cond Conditions) unblock() {
	cond.can_run = -cond.can_run-1
	cond.can_cast = -cond.can_cast-1
	cond.can_regen = -cond.can_regen-1
}
