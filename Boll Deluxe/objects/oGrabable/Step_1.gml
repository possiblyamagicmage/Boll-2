
if !(grab_delay) {
    no_collide = false
}

if (grabbed) {
    no_collide = true
    bounce = true
    grab_delay = 8
}