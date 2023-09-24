module main

import json
import primitives

struct User {
    name string
    born  int
mut:
    is_registered bool
}

fn main() {
    stream := primitives.init_stream('fire')
    println(json.encode(stream))

    s := '[{"name":"Frodo", "born":25}, {"name":"Bobby", "born":10}]'
    mut users := json.decode([]User, s) or {
        eprintln('Failed to parse json')
        return
    }
    for user in users {
        println('${user.name}: ${user.born}')
    }
    println('')
    for i, mut user in users {
        println('${i}) ${user.name}')
        if !user.can_register() {
            println('Cannot register ${user.name}, they are too young')
            continue
        }
		// `user` is declared as `mut` in the for loop,
		// modifying it will modify the array
        user.register()
    }
    // Let's encode users again just for fun
    println('')
    println(json.encode(users))
}

fn (u User) can_register() bool {
    return u.born >= 16
}

fn (mut u User) register() {
    u.is_registered = true
}
