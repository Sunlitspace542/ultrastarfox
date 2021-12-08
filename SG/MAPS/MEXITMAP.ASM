; MEDIUM TUNNEL

llt	=	MTexit_minX	; left X light pos
rlt	=	MTexit_maxX 	; right X light pos
tlt	=	MTexit_minY	; top Y light pos
blt	=	MTexit_maxY	; bottom Y light pos


tdist	=	4000		; start of tunnel area
telen	=	100		; length of entrance + 100
tlen	=	1000		; length from entrance to exit

mtunnelexit

	mapplayercantdie

	mapobjzrot	0000,rlt,blt,tlen-0800+telen+tdist,exitlight,exitlight3_Istrat,deg45
	mapobjzrot	0000,rlt,tlt,tlen-0800+telen+tdist,exitlight,exitlight3_Istrat,deg135
	mapobjzrot	0000,llt,blt,tlen-0800+telen+tdist,exitlight,exitlight3_Istrat,deg315
	mapobjzrot	0000,llt,tlt,tlen-0800+telen+tdist,exitlight,exitlight3_Istrat,deg225

	mapobjzrot	0000,rlt,blt,tlen-0600+telen+tdist,exitlight,exitlight4_Istrat,deg45
	mapobjzrot	0000,rlt,tlt,tlen-0600+telen+tdist,exitlight,exitlight4_Istrat,deg135
	mapobjzrot	0000,llt,blt,tlen-0600+telen+tdist,exitlight,exitlight4_Istrat,deg315
	mapobjzrot	0000,llt,tlt,tlen-0600+telen+tdist,exitlight,exitlight4_Istrat,deg225

	mapobjzrot	0000,rlt,blt,tlen-0400+telen+tdist,exitlight,exitlight5_Istrat,deg45
	mapobjzrot	0000,rlt,tlt,tlen-0400+telen+tdist,exitlight,exitlight5_Istrat,deg135
	mapobjzrot	0000,llt,blt,tlen-0400+telen+tdist,exitlight,exitlight5_Istrat,deg315
	mapobjzrot	0000,llt,tlt,tlen-0400+telen+tdist,exitlight,exitlight5_Istrat,deg225
				      
	mapobjzrot	0000,rlt,blt,tlen-0200+telen+tdist,exitlight,exitlight6_Istrat,deg45
	mapobjzrot	0000,rlt,tlt,tlen-0200+telen+tdist,exitlight,exitlight6_Istrat,deg135
	mapobjzrot	0000,llt,blt,tlen-0200+telen+tdist,exitlight,exitlight6_Istrat,deg315
	mapobjzrot	0000,llt,tlt,tlen-0200+telen+tdist,exitlight,exitlight6_Istrat,deg225

	mapobjzrot	0000,rlt,blt,tlen-0100+telen+tdist,exitlight,nocoll_Istrat,deg45
	mapobjzrot	0000,rlt,tlt,tlen-0100+telen+tdist,exitlight,nocoll_Istrat,deg135
	mapobjzrot	0000,llt,blt,tlen-0100+telen+tdist,exitlight,nocoll_Istrat,deg315
	mapobjzrot	0000,llt,tlt,tlen-0100+telen+tdist,exitlight,nocoll_Istrat,deg225



	mapobj	0000,000,0000,tlen+telen+tdist-1,Mwireexit,nocoll_Istrat


	mapobj	0000,0000,-mtunnel_viewCY,tdist+telen-100,bMtunnelface,gnd_Istrat
	mapobj	tdist,0000,0000,tdist,exit_2,exit_Istrat
	mapplayermode	InMTexit

	mapobj	0000,000,-110,10+tlen+telen,Mexitface,exitopen_Istrat
	setalvar.w	sword1,500
	setalvar.w	sword2,0
	setalvar	sbyte1,-10
	mapobj	0000,000,0010,10+tlen+telen,Mexitface,exitopensnd_Istrat
	setalvar.w	sword1,500
	setalvar.w	sword2,0
	setalvar	sbyte1,10


	mapobj	0000,0000,0000,tlen+telen,Mblackface,nocoll_Istrat

	mapwait	100

	maprts






		 




