/* See LICENSE file for copyright and license details. */


/* appearance */
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Fira Code:size=12" };
static const char dmenufont[]       = "Fira Code:size=12";
/* tokyonight */
static const char col_main1[]       = "#33467c";
static const char col_main2[]       = "#1A1A1A";
static const char col_gray1[]       = "#292e42";
static const char col_gray2[]       = "#c0caf5";

static const char *colors[][3]      = {
	/*               fg         bg         border   */  
	[SchemeNorm] = { col_gray2, col_main2, col_gray1 },
	[SchemeSel]  = { col_gray2, col_main1,  col_main1  },
};

/* material darker  */
/* static const char col_main1[]       = "#212121"; */
/* static const char col_main2[]       = "#1A1A1A"; */
/* static const char col_gray1[]       = "#474747"; */
/* static const char col_gray2[]       = "#ffffff"; */
/*  */
/* static const char *colors[][3]      = { */
/* 	/*               fg         bg         border   */ 
/* 	[SchemeNorm] = { col_gray1, col_main1, col_main2 }, */
/* 	[SchemeSel]  = { col_gray2, col_main2,  col_gray1  }, */
/* }; */

/* tagging */
static const char *tags[] = { "一", "ニ", "三", "四", "五", "六", "七", "八", "九" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	/*{ "Gimp",     NULL,       NULL,       0,            1,           -1 },*/
	/*{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },*/
	{ "discord",    NULL,         NULL,       1 << 2,       0,            1 },
	{ "zoom",       NULL,         NULL,           0,        1,           -1 },
	{ "Steam",       NULL,         NULL,           0,        1,           -1 },
	{ "obs",        NULL,         NULL,           1 << 3,        0,       1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "./patches/vanitygaps.c"
static const Layout layouts[] = {
	/* symbol     arrange function */

    /* Default: Master on left, slaves on right */
 	{ "[]=",	tile },		

    /* Fibonacci spiral */
	{ "[@]",	spiral },	

   
    /* All windows on top of eachother */
 	{ "[M]",	monocle },	

    /* Master in middle, slaves on sides */
	{ "|M|",	centeredmaster },	


    /* no layout function means floating behavior */
	{ "><>",	NULL },	

	{ NULL,		NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_main1, "-nf", col_gray2, "-sb", col_gray2, "-sf", col_main2, NULL };
static const char *netoworkdmenucmd[] = { "networkmanager_dmenu", "-m", dmenumon, "-fn", dmenufont, "-nb", col_main1, "-nf", col_gray2, "-sb", col_gray2, "-sf", col_main2, NULL };
static const char *termcmd[]  = { "kitty", NULL };


#include "./patches/shiftview.c"
static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_equal,  spawn,          SHCMD("flameshot gui") },
	{ MODKEY,                       XK_minus,  spawn,          SHCMD("imageocr") },
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_b,      spawn,          SHCMD("firefox") },
	{ MODKEY,                       XK_w,      spawn,          SHCMD("feh --bg-scale --randomize /mnt/Media/wallpapers/*") },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("mpv --player-operation-mode=pseudo-gui") },
	{ MODKEY,                       XK_n,      spawn,          {.v = netoworkdmenucmd } },
	{ MODKEY|ShiftMask,             XK_n,      spawn,          SHCMD("nm-connection-editor") },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_i,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_g,      togglegaps,     {0} },
    { MODKEY|ShiftMask,             XK_g,      defaultgaps,    {0} },
    { MODKEY,			            XK_apostrophe,		incrgaps,	{.i = +3 } },
	{ MODKEY,			            XK_semicolon,		incrgaps,	{.i = -3 } },
    { MODKEY,                       XK_bracketright,      shiftview,      {.i = +1 } },
	{ MODKEY,                       XK_bracketleft,       shiftview,      {.i = -1 } },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} }, /*tiled*/
	{ MODKEY,                       XK_s,      setlayout,      {.v = &layouts[1]} }, /*spiral*/
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} }, /*monocle*/
	{ MODKEY|ShiftMask,             XK_m,      setlayout,      {.v = &layouts[3]} }, /*centeredmaster*/
	{ MODKEY|ShiftMask,             XK_f,      setlayout,      {.v = &layouts[4]} }, /*float*/
	{ MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_space,  zoom,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

