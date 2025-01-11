///@description Play Music
// this delays if put in room start, so i have to delay this LOL

VinylStopAll() //prevent old music from playing

fgMusic=VinylPlay("overworld bgm FG", true, 0.2);
bgMusic=VinylPlay("overworld bgm BG", true, 0.2);