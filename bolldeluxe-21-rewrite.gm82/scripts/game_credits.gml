//game credits string
var betas,l;

l=0

list[l]="MotorRoach" l+=1
list[l]="shoujosiren" l+=1
list[l]="SinFrog" l+=1
list[l]="CowboyJoseph64" l+=1
list[l]="Ethan" l+=1
list[l]="Kaching720" l+=1
list[l]="GabeRSP" l+=1
list[l]="Dewey" l+=1
list[l]="ILostMySol" l+=1
list[l]="Dara" l+=1
list[l]="Luk" l+=1
list[l]="Mellia" l+=1
list[l]="Carbo64" l+=1
list[l]="[Hakumuda]" l+=1
list[l]="TwistedMaky" l+=1
list[l]="TheBlazePage" l+=1
list[l]="Christian32307" l+=1
list[l]="WildCard78" l+=1
list[l]="Epeleth" l+=1
list[l]="Emília" l+=1
list[l]="CyanideJam" l+=1
list[l]="Flareguy" l+=1
list[l]="Bedoop!" l+=1
list[l]="-S-" l+=1
list[l]="Fuzzy Cactus" l+=1
list[l]="VAdaPEGA" l+=1
list[l]="ArcanePool" l+=1
list[l]="Cubie/nekonesse" l+=1
list[l]="Mariya" l+=1
list[l]="DaJet" l+=1
list[l]="AngryBup" l+=1
list[l]="SomeShadeOfGreen" l+=1
list[l]="Invader" l+=1
list[l]="biobthe1" l+=1
list[l]="TheMaurii" l+=1
list[l]="azumadeline" l+=1
list[l]="Scarf" l+=1
list[l]="DaJumpJump" l+=1
list[l]="Snac" l+=1
list[l]="Sylve" l+=1
list[l]="LeEpicPasta" l+=1
list[l]="SuperSani24" l+=1
list[l]="ScarlyNight" l+=1
list[l]="GoldenB4" l+=1
list[l]="Nathan Silver" l+=1
list[l]="Tael" l+=1
list[l]=":boomer:" l+=1

//shuffle betas
for (i=l-1;i>0;i-=1) {
    j=irandom(i)
    t=list[i]
    list[i]=list[j]
    list[j]=t
}

//build list of betas
betas=""
for (i=0;i<l;i+=1) {
    betas+=list[i]
    if (i<l-1) {
        if (i mod 3==2) betas+="#"
        else betas+=" - "
    }
}

return gametitle+"

[version "+version+"]


A long and fruitful venture from the wonderful
folks of the ever-changing Boll Team

2010 - 2023


[Game Design]

-S- - CowboyJoseph64 - Flareguy
shoujosiren - Ethan


[Level Design]

Emília - -S-
Flareguy - Carbo64
CyanideJam - ScarlyNight
Nekonesse - GoldenB4


[Programming]

DrgnBeauty - Floogle
Symbolcom - -S-
Nekonesse - Scarf


[Art, Testing, Additional Game Design, And Miscellaneous work]

"+betas+"

[Music]

LeEpicPasta - Maurii
JustKam

[Special Thanks]

Wariah - Fractor
Anter - roman6a
BlackDoomer
John Croissant
DrgnBeauty
Vim! (For the main menu music)
Djamm (For Lemon editor music)
Everyone who worked on Sonic Boll

and YOU


This game is dedicated to all the cool
people at the old Exploding Rabbit forums.
Without your support, this project
would never have happened.


Thank you for playing! See you next game."
