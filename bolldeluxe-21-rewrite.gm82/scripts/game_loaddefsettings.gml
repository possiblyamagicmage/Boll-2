///loaddefault()
//loads default game_settings and saves them

game_settings("version",version)
game_settings("volbalance",0.5)
game_settings("keyboard1",string(vk_up)+"|"+string(vk_down)+"|"+string(vk_left)+"|"+string(vk_right)+"|"+string(ord("X"))+"|"+string(ord("Z"))+"|"+string(ord("C"))+"|"+string(vk_enter)+"|")
game_settings("keyboard2",string(ord("I"))+"|"+string(ord("K"))+"|"+string(ord("J"))+"|"+string(ord("L"))+"|"+string(ord("S"))+"|"+string(ord("A"))+"|"+string(ord("D"))+"|"+string(vk_backspace)+"|")
game_settings("zoom",3)
game_settings("zoomlemon",1)
game_settings("playstages",8)
game_settings("language","")
game_settings("wskinpin","")
game_settings("mskinpin","")
game_settings("lskinpin","")
game_settings("dequanto",0)
game_settings('discord',0)
game_settings("autopause",1)
game_settings("menumusic","")
game_settings("edit autosave",1)
game_settings("detail",0)
game_settings("lock ashura",1)
game_settings("lock super",1)
game_settings("simple disabled",1)

for (i=0;i<9;i+=1) {
    game_settings("contest"+string(i),1)
    game_settings("contestbkp"+string(i),1)
}
