static const char norm_fg[] = "#c3c4c5";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#5c6470";

static const char sel_fg[] = "#c3c4c5";
static const char sel_bg[] = "#3F77A1";
static const char sel_border[] = "#c3c4c5";

static const char urg_fg[] = "#c3c4c5";
static const char urg_bg[] = "#3B698A";
static const char urg_border[] = "#3B698A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
