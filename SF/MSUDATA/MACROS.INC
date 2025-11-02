getmsu1datalen	macro [label]
{label}len	equ	{label}len-{label} ;-1
	ENDM

getmsu1dataaddr	macro	[label]
{label}_byte1	equ	({label})&$FF
{label}_byte2	equ	(({label})>>8)&$FF
{label}_byte3	equ	(({label})>>16)&$FF
{label}_byte4	equ	(({label})>>24)&$FF

	fopen	+msudata.inc
	printf	"{label}%tequ%t$",:${label},"%n"
	printf	"{label}_byte1%tequ%t$",:${label}_byte1,"%n"
	printf	"{label}_byte2%tequ%t$",:${label}_byte2,"%n"
	printf	"{label}_byte3%tequ%t$",:${label}_byte3,"%n"
	printf	"{label}_byte4%tequ%t$",:${label}_byte4,"%n"
	printf	"{label}len%tequ%t$",:${label}len,"%n"
	fclose	msudata.inc
	ENDM

	; include msu-1 data, gets addr and length
	; directive can probably be just about any valid assembler command
msu1data	MACRO	[label,directive]
{label}
	{directive}
	getmsu1datalen	{label}
	getmsu1dataaddr	{label}
	ENDM