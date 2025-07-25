; ######################
; # SNES/SFC Registers #
; ######################

inidisp	equ	$2100
objsel	equ	$2101
oamaddl	equ	$2102
oamaddh	equ	$2103
oamdata	equ	$2104
bgmode	equ	$2105
mosaic	equ	$2106
bg1sc	equ	$2107
bg2sc	equ	$2108
bg3sc	equ	$2109
bg4sc	equ	$210a
bg12nba	equ	$210b
bg34nba	equ	$210c
bg1hofs	equ	$210d
bg1vofs	equ	$210e
bg2hofs	equ	$210f
bg2vofs	equ	$2110
bg3hofs	equ	$2111
bg3vofs	equ	$2112
bg4hofs	equ	$2113
bg4vofs	equ	$2114
vmainc	equ	$2115
vmaddl	equ	$2116
vmaddh	equ	$2117
vmdatal	equ	$2118
vmdatah	equ	$2119
m7sel	equ	$211a
m7a	equ	$211b
m7b	equ	$211c
m7c	equ	$211d
m7d	equ	$211e
m7x	equ	$211f
m7y	equ	$2120
cgadd	equ	$2121
cgdata	equ	$2122
w12sel	equ	$2123
w34sel	equ	$2124
wobjsel	equ	$2125
wh0	equ	$2126
wh1	equ	$2127
wh2	equ	$2128
wh3	equ	$2129
wbglog	equ	$212a
wobjlog	equ	$212b
tm	equ	$212c
ts	equ	$212d
tmw	equ	$212e
tsw	equ	$212f
cgswsel	equ	$2130
cgadsub	equ	$2131
coldata	equ	$2132
setini	equ	$2133
mpylr	equ	$2134
mpymr	equ	$2135
mpyhr	equ	$2136
slhvr	equ	$2137
oamdatr	equ	$2138
vmdatalr	equ	$2139
vmdatahr	equ	$213a
cgdatar	equ	$213b
ophctr	equ	$213c
opvctr	equ	$213d
stat77r	equ	$213e
stat78r	equ	$213f
apu_port0	equ	$2140
apu_port1	equ	$2141
apu_port2	equ	$2142
apu_port3	equ	$2143
wmdata	equ	$2180
wmaddl	equ	$2181
wmaddm	equ	$2182
wmaddh	equ	$2183

JOYSER0 equ $4016   ; old-style joypad 1
JOYSER1 equ $4017   ; old-style joypad 2

nmitimen	equ	$4200
wrio	equ	$4201
wrmpya	equ	$4202
wrmpyb	equ	$4203
wrdivl	equ	$4204
wrdivh	equ	$4205
wrdivb	equ	$4206
htimel	equ	$4207
htimeh	equ	$4208
vtimel	equ	$4209
vtimeh	equ	$420a
mdmaen	equ	$420b
hdmaen	equ	$420c
memsel	equ	$420d

rdnmir	equ	$4210
timeupr	equ	$4211
hvbjoyr	equ	$4212
rdior	equ	$4213
rddivlr	equ	$4214
rddivhr	equ	$4215
rdmpylr	equ	$4216
rdmpyhr	equ	$4217
joy1l	equ	$4218
joy1h	equ	$4219
joy2l	equ	$421a
joy2h	equ	$421b
joy3l	equ	$421c
joy3h	equ	$421d
joy4l	equ	$421e
joy4h	equ	$421f

ch0params	equ	$4300
ch1params	equ	$4310
ch2params	equ	$4320
ch3params	equ	$4330
ch4params	equ	$4340
ch5params	equ	$4350
ch6params	equ	$4360
ch7params	equ	$4370

ch0addrb	equ	$4301
ch1addrb	equ	$4311
ch2addrb	equ	$4321
ch3addrb	equ	$4331
ch4addrb	equ	$4341
ch5addrb	equ	$4351
ch6addrb	equ	$4361
ch7addrb	equ	$4371

ch0addra1tl	equ	$4302
ch1addra1tl	equ	$4312
ch2addra1tl	equ	$4322
ch3addra1tl	equ	$4332
ch4addra1tl	equ	$4342
ch5addra1tl	equ	$4352
ch6addra1tl	equ	$4362
ch7addra1tl	equ	$4372

ch0addra1th	equ	$4303
ch1addra1th	equ	$4313
ch2addra1th	equ	$4323
ch3addra1th	equ	$4333
ch4addra1th	equ	$4343
ch5addra1th	equ	$4353
ch6addra1th	equ	$4363
ch7addra1th	equ	$4373

ch0atbank	equ	$4304
ch1atbank	equ	$4314
ch2atbank	equ	$4324
ch3atbank	equ	$4334
ch4atbank	equ	$4344
ch5atbank	equ	$4354
ch6atbank	equ	$4364
ch7atbank	equ	$4374

ch0dataddrl	equ	$4305
ch1dataddrl	equ	$4315
ch2dataddrl	equ	$4325
ch3dataddrl	equ	$4335
ch4dataddrl	equ	$4345
ch5dataddrl	equ	$4355
ch6dataddrl	equ	$4365
ch7dataddrl	equ	$4375

ch0dataddrh	equ	$4306
ch1dataddrh	equ	$4316
ch2dataddrh	equ	$4326
ch3dataddrh	equ	$4336
ch4dataddrh	equ	$4346
ch5dataddrh	equ	$4356
ch6dataddrh	equ	$4366
ch7dataddrh	equ	$4376

ch0databank	equ	$4307
ch1databank	equ	$4317
ch2databank	equ	$4327
ch3databank	equ	$4337
ch4databank	equ	$4347
ch5databank	equ	$4357
ch6databank	equ	$4367
ch7databank	equ	$4377

ch0addra2tl	equ	$4308
ch1addra2tl	equ	$4318
ch2addra2tl	equ	$4328
ch3addra2tl	equ	$4338
ch4addra2tl	equ	$4348
ch5addra2tl	equ	$4358
ch6addra2tl	equ	$4368
ch7addra2tl	equ	$4378

ch0addra2th	equ	$4309
ch1addra2th	equ	$4319
ch2addra2th	equ	$4329
ch3addra2th	equ	$4339
ch4addra2th	equ	$4349
ch5addra2th	equ	$4359
ch6addra2th	equ	$4369
ch7addra2th	equ	$4379

ch0hdmaline	equ	$430a
ch1hdmaline	equ	$431a
ch2hdmaline	equ	$432a
ch3hdmaline	equ	$433a
ch4hdmaline	equ	$434a
ch5hdmaline	equ	$435a
ch6hdmaline	equ	$436a
ch7hdmaline	equ	$437a


