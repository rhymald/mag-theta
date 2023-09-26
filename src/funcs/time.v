module funcs

import time

pub fn init_epoch() i64 {
	return time.ticks()
}

pub fn init_delay(timeout f64) {
	time.sleep( timeout * time.millisecond )
}