	list on
	org $8000,0

	iffe "c:\autoexec.bat"
	nop
	endc

	iffne "c:\rats.doc"
	nop
	endc

	iffne "c:\autoexec.bat"
	nop
	endc

	iffe "c:\rats.doc"
	nop
	endc

	list off

	end
