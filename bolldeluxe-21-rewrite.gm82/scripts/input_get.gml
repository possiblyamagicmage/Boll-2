///input_get(input id) -1 for all inputs, currently the argument doesnt matter
//Will have to rewrite this later to you know, actually allow for custom inputs and all.
input=argument[0]
left=keyboard_check(vk_left)
right=keyboard_check(vk_right)
up=keyboard_check(vk_up)
down=keyboard_check(vk_down)
akey=keyboard_check(ord("X"))
bkey=keyboard_check(ord("Z"))
ckey=keyboard_check(ord("C"))
xkey=keyboard_check(ord("A"))
ykey=keyboard_check(ord("S"))
zkey=keyboard_check(ord("D"))
skey=keyboard_check(vk_enter)

// this is essentially input_keystates(), I'll move it to a different script later - -S-
// due to not using the good old uninit=0, we have to run an init thing before being able to use input_get, rip
abut=0 arel=0 if (akey && !alok) {abut=1 alok=1} if (!akey && alok) {arel=1 alok=0}
bbut=0 brel=0 if (bkey && !blok) {bbut=1 blok=1} if (!bkey && blok) {brel=1 blok=0}
cbut=0 crel=0 if (ckey && !clok) {cbut=1 clok=1} if (!ckey && clok) {crel=1 clok=0}
sbut=0 srel=0 if (skey && !slok) {sbut=1 slok=1} if (!skey && slok) {srel=1 slok=0}
xbut=0 xrel=0 if (xkey && !xlok) {xbut=1 xlok=1} if (!xkey && xlok) {xrel=1 xlok=0}
ybut=0 yrel=0 if (ykey && !ylok) {ybut=1 ylok=1} if (!ykey && ylok) {yrel=1 ylok=0}
zbut=0 zrel=0 if (zkey && !zlok) {zbut=1 zlok=1} if (!zkey && zlok) {zrel=1 zlok=0}
