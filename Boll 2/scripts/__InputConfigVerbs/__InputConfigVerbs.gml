function __InputConfigVerbs()
{
    enum INPUT_VERB
    {
        //Add your own verbs here!
        UP,
        DOWN,
        LEFT,
        RIGHT,
        A,
        B,
        C,
        V,
		ENTER,
        PAUSE,
    }
    
    enum INPUT_CLUSTER
    {
        //Add your own clusters here!
        //Clusters are used for two-dimensional checkers (InputDirection() etc.)
        NAVIGATION,
    }
    
    InputDefineVerb(INPUT_VERB.UP,      "up",         [vk_up,    "W"],    [-gp_axislv, gp_padu]);
    InputDefineVerb(INPUT_VERB.DOWN,    "down",       [vk_down,  "S"],    [ gp_axislv, gp_padd]);
    InputDefineVerb(INPUT_VERB.LEFT,    "left",       [vk_left,  "A"],    [-gp_axislh, gp_padl]);
    InputDefineVerb(INPUT_VERB.RIGHT,   "right",      [vk_right, "D"],    [ gp_axislh, gp_padr]);
    InputDefineVerb(INPUT_VERB.A,  "a",      "X",            gp_face1);
    InputDefineVerb(INPUT_VERB.B, "b",    "Z",            gp_face3);
	InputDefineVerb(INPUT_VERB.C,  "c",      "C",            gp_face4);
    InputDefineVerb(INPUT_VERB.V, "v",    "V",            gp_face2);
	InputDefineVerb(INPUT_VERB.ENTER,  "enter",      vk_enter,            gp_select);
    InputDefineVerb(INPUT_VERB.PAUSE, "pause",    vk_escape,            gp_start);

    //Define a cluster of verbs for moving around
    InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
}
