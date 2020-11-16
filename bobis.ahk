CoordMode,Pixel,Window
CoordMode,Mouse,Window
SetBatchLines, -1
SetKeyDelay, 17
#SingleInstance, Force

FileReadLine,account,%A_MyDocuments%\RQaccount.txt, 1
FileReadLine,password,%A_MyDocuments%\RQaccount.txt, 2
FileReadLine,godswarfile,%A_MyDocuments%\RQaccount.txt, 3
gosub klk1


gosub, pwe1
 
	Menu, Tray, icon, %a%
	Gui, Add, Edit, w100 h20 vgodswarfile, %godswarfile%
	Gui, Add, Button,x115 y5 gsearchpath, FILE
	Gui, Add, Picture,x65 y40 w120 h100, %a%
	Gui, Add, Text,x200 y25 w100 h25 cwhite, Account:
	Gui, Add, Edit, w130 h20 vaccount gklk1, %account%
	Gui, Add, Text,x200 y85 w100 h25 cwhite, pa$$word:
	Gui, Add, Edit, w130 h20 vpassword gklk1, %password%
	Gui, Add, Button, x10 y50 w50 h25  grefresh, Refresh
	Gui, Add, Button, w50 h25 gprocess1, Start
	Gui, Add, Button, w50 h25 gexit, Exit 
	Gui, Add, Text, x230 y180 c2DE91A, Powered by RodolfoRP
	Gui, Add, Text, x240 y160 c42F7FA, 𝓕𝓵𝓸𝔀 𝓷𝓪𝓽𝓾𝓻𝓪𝓵
	Gui, Add, CheckBox, x19 y160 Checked vTalent gklk1 cwhite, TP
	Gui, Add, Text , x75 y150 w50 h15 cwhite, RQ delay
	Gui, Add, Edit, w30 h20 vdelay gklk1, 0
	Gui, Color, black
	Gui, show, w350 h200, Smart Kakashi Auto RQ


			;Primer paso
	
	
    return


;################################################Setup#######################################################################################################

	searchpath:
	FileSelectFolder, almacen, %godswarfile%

	if (almacen == ""){
		MsgBox, selecciona FILE y carpeta gw mmg
	}

	IniWrite,0,%almacen%\Localization\en_us\Settings\Sys\Magic.ini,5150,CoolingTime
	gw = %almacen%\GodsWar.exe
	GuiControl, Text, godswarfile, %almacen%

	klk1:
	FileDelete,%A_MyDocuments%\RQaccount.txt
	Gui, Submit, NoHide
	return

	GuiClose:
	FileAppend,
	(
%account%
%password%
%almacen%
	),%A_MyDocuments%\RQaccount.txt
	Gui, cancel

	exit:
	ExitApp
	return

	refresh:
	reload
	return

;##########################################################  Processs1 - ACTIVATE (1) #####################################################################################

	
	Process1:
	
		if WinExist("GodsWar Online [USA]")
		{
			
			WinActivate
			gosub loginCheck
			MouseMove, 0,0
			ControlSend,, %account%, A
			sleep 250
			ControlSend,, {Tab}, A
			ControlSend,, %password%, A
			sleep, 250
			ControlSend,, {Enter}, A	
			gosub, verify
			return
		}


		else 
		{
			gosub wincheck
			return
		}


return

;###################################################### Login Checker (2) #############################################

loginCheck:
	while True{
	
		ImageSearch,,,0,0,800,600, *100 %login%
	
			If (ErrorLevel = 0)
			{
				break
			}
			
			else
			{
			
			}
		
		}

	return

;##############################################  VERIFY 1- verifying (3) ##############################################


		verify:  
		sleep, 2000
		ImageSearch, x11, y11, 0,0,800,600,*100 %c%
		
			if (ErrorLevel = 0)
			{
				gosub verify
				return
					
			}
		
			else
			{
				gosub verify2
				return

			}
		
		
	return


;############################################ VERIFY 2 (4) ###############################################################

		verify2:                 
		sleep, 300
		ImageSearch, x111, y111, 0, 0, 800, 600,*100 %d%

				If (ErrorLevel = 0)
				{
					MouseMove, 398, 360
					Click
					gosub enter2
					return
				}

			else
			{
				gosub GM
				gosub process2
				return
			}

		return

;################################################  last enter  2 (5)  ##############################################

		enter2:
			sleep 500
			MouseMove, 398, 414
			Click
			gosub verify
		return


	

;--------------------------------------------------------------WAIT GM (6) (waits character loby)----------------------------

	GM:
	while True
		{
		ImageSearch,,,622,519,800,600, *100 %entrance%
			
			if (ErrorLevel = 0)	
			{
				gosub GM2
				break
			}
			
			else
			{
				
			}

		}	


	return	

;-----------------------------------------------------------------------------------------Entrance Checker2
	GM2:
	while True
	{	
		ImageSearch,,,292,262,506,381, *100 %wait%
		
			if (ErrorLevel = 0)
			{
				sleep, 1000
			}
			else
			{
				break
			}
	}
return
	
;##############################################################   process2- frecuent login detection  entrance (7) -save time #####################################################
	process2:
	
		ImageSearch, value1, value2,0,0, 800,600,*100 %b%

			if (ErrorLevel = 0)
			{
		
				MouseMove, 370, 358
				Click
				gosub savetime
				gosub GM
				MouseMove, 398, 495
				Click
				gosub waitsignal
				gosub setupwindows
				return
		
			}

			else
			{
				gosub frecuent2
				return
			}
		    
	return



;--------------------------------------------------------------------------SAVE TIME------------------------------------------------
	savetime:
	timer = 0
	while True
	{	
		timer++
		if (timer < 550)
		{
			ImageSearch,,,317,286, 379, 330, *100 %save%
			
			If (ErrorLevel = 0)
			{
				Click, 400, 358
				gosub savetime2
				break
			}
			else
			{
			}
		}
		else	
		{
			break
	}	}
	return

;---------------------------------------------------------------Save time 2-----------------------------------------------------------------

	savetime2:
	while True
	{
		ImageSearch,,,438,499, 613, 546, *100 %server%
		
			if (ErrorLevel = 0)
			{
				sleep 1500
				click 540, 527
				break
			}
	
			else
			{
			
			}

		}
	return

;###########################################################################  Frecuent2 (8) #########################################################

	frecuent2:
	
		ImageSearch, k1, k2, 0,0,800,600,*100 %b2%
		
			if (ErrorLevel = 0)
			{
				MouseMove, 370, 358
				Click
				gosub savetime
				gosub GM
				MouseMove, 398, 495
				Click
				gosub waitsignal
				gosub setupwindows
				return
			}
		
			else

			{
				gosub Entrance
				return
			}
		   

	return

;--------------------------------------------------------------------------Entrance (9) -----------------------

	Entrance:

	MouseMove, 398, 495
	Click
	gosub waitsignal
	gosub setupwindows
	return

	

;----------------------------------------------------------------------Wait signal (10)


	waitsignal:
	gosub wincheck
	while True{

		ImageSearch, n1,n2, 567,568,652,621, *100 %h%
	
		if (ErrorLevel = 0)
		{
			sleep 500
			break
		}

	}

return


;#################################################################################### AUTO RQ PROCESS 1 WINDOWS SETUP ##############################################


	setupwindows:
	click, 254, 570
	sleep 400
	gosub wincheck
	sleep 600
	Click 624, 604             ;<-------------- Bag Click
	sleep 600
	Click 553, 502
	sleep 600
	MouseClickDrag, L, 613, 127, 740, 267
	sleep 600
	MouseClickDrag, L , 610, 137, 77, 43
	sleep , 600
	Click, 78, 445
	sleep, 600
	goto stall
	return


;-------------------------------------------------Stall setup-----------------

	stall:
	gosub wincheck
	loop
	{
		ImageSearch, a111, b111, 0,0, 800, 600, *100 %e%

			if (ErrorLevel = 0)
			{
				Click, 299, 403
				sleep 500
				Click, 312 , 71
				MouseMove, 375, 330
				sleep 2000
				Click
				Goto detect
				
			}

	}	
	
    return
  
;-----------------------------------------------------------Detect on screen first windows called batch----------------
	detect:
	while True{
		gosub wincheck
		ImageSearch,,, 0,0 ,800, 600, *100 %f%

			if (ErrorLevel = 0)
			{
				MouseClickDrag, L, 242, 176, 175, 465
				Click, 28, 517
				gosub detect2
				break
			}
		
			else if (ErrorLevel = 0)
			{
				
			}
		}
return

;-----------------------------------------------------Second window on rq to be detected--------------------

	detect2:
	while True{
		gosub wincheck
		ImageSearch, c1, c2, 0,0, 800, 600, *20 %g%

			if (ErrorLevel = 0)
			{	
				MouseClickDrag, L, 485, 263, 534, 111
				gosub START
				break
			}
	
			else
			{

			}

		  }
	return


;------------------------------------------------------------------------------------Wincheck
	wincheck:

		if WinExist("GodsWar Online [USA]")
		{
			return
		}
		  

		else
		{
			Run, GodsWar.exe, %almacen%
			sleep 1000
			WinWait, GodsWar Online [USA] 	
			WinActivate, GodsWar Online [USA]
			gosub process1

		}
		
	return
	
	
;###################################################################################################################################################
;------------------------------------------SECOND DATA PROCESS START RQ----------------------------------------------------------------------------------
;############################################################################################################################################################
;------------------------------------------------------------------------------------------------------------------------------------------------------

;-------------------not even in phone we make so many calls -RodolfoRP
START:
SetBatchLines, -1
SetDefaultMouseSpeed, 0 
SetMouseDelay, -1

bobis = True
sleep 1000			


	loop
	{

	if (bobis == "False")
	{
		goto Close 
	}
	
	else
	{
	
	}
		
		gosub QuestManagerClick    ;first click
	
		gosub RQimg1 		; detect random quest opt
		gosub RQimg2 		; detect claim sack opt
		gosub RQchecker
	
		
		gosub PersonalHelperClick     ; second click
		
	
		gosub Bugsackbatch 	; detect batch window (X) ----starting to bug 
		gosub PREBugsack  	; preparing to start clicking all the bags spots
		gosub RQchecker
		gosub ClickAll  	; click all bags
	
	

		gosub Last
		gosub Last2

	
	}
return




;----------------------------------The clicks labels---------------------------------
QuestManagerClick:
Click, 453 339
While True
{
	ImageSearch,,,5,535,106,562, *100 %RandomQuest%
		
		If (ErrorLevel = 0)
		{
			break
		}
		else
		{
			gosub AntiTrade
			Click, 453 339
		}
}
return

;----------------------------------ClickBatch
PersonalHelperClick:
Click, 392 290
while True
{
	ImageSearch,,,0,0,800,600, *100 %batch2%
		
		If (ErrorLevel = 0)
		{
			break
		}
		else
		{
			gosub AntiTrade
			Click, 392 290
		}
}
return

;-------------------------------AntiTrade
AntiTrade:
While True
{
	ImageSearch,,,230,415,292,449, *100 %trade%
		
		if (ErrorLevel = 0)
		{
			Click, 334, 434
		}
		else
		{
			break
		}
}
return



;--------------------------------------------------------------------------------------------------------

RQimg1:
while True
{
	ImageSearch,,,5,535,106,562, *100 %RandomQuest%

		if (ErrorLevel = 0)
		{
			Click, 44, 549
			break
		}

		else
		{
			gosub AntiTrade
		}
}
return


;--------------------------------------------------------------------------------------------------randomquestIMG2
RQimg2:
while True
{
	ImageSearch,v11,v22,351,32,482,63, *100 %ClaimSack%
	
	if (ErrorLevel = 0)
	{
		Click, 408, 46
		Click 705, 163
		break
	}

	else
	{
		gosub AntiTrade
	}
	
}
return


;-----------------------------------------------------------personal helper

Bugsackbatch:
while True
{
	ImageSearch,,,0,0,800,600, *100 %batchx%
	
		if (ErrorLevel = 0)
		{
			sleep 10
			Click, 31, 519
			gosub 2
			Break
		}

		else
		{
			gosub AntiTrade
			click, 30, 519
		}
}
return

;-----------------------------------------------------Bugsackbatch2
2:
loop
{
	ImageSearch,,,0,0,800,600, *100 %batchx%
		If (ErrorLevel = 0)
		{
			Click, 31, 519
		}
		else
		{
			gosub AntiTrade
			break
		}
}
return
;----------------------------------------------------------------------------------------------------------



PREBugsack:
while True
{
	ImageSearch,,,378, 47, 421, 91, *20 %RQimg4%

	if (ErrorLevel = 0)
	{
		sleep %delay%
		break
	}
	
	else
	{
		gosub AntiTrade
		click, 30, 519
	}
}

return


;-------------------------------------------------------------------------------------------------------------------------
ClickAll:
		Click, R, 34,  285
		Click, R, 66,  285
		Click, R, 99,  285
		Click, R, 132, 285
		Click, R, 164, 285
		Click, R, 199, 285
		Click, R, 34,  317
		Click, R, 65,  317
		Click, R, 99,  317
		Click, R, 132, 317
		Click, R, 164, 317
		Click, R, 199, 317
		Click, R, 34,  351
		Click, R, 66,  351
		Click, R, 99,  351
		Click, R, 132, 351
		Click, R, 164, 351
		Click, R, 199, 351
		Click, R, 34,  382
		Click, R, 66,  382
		Click, R, 99,  382
		Click, R, 132, 382
		Click, R, 164, 382
		Click, R, 199, 382
		Click, R, 605, 240
		Click, R, 638, 240
		Click, R, 672, 240
		Click, R, 706, 240
		Click, R, 740, 240
		Click, R, 770, 240
		Click, R, 605, 273
		Click, R, 638, 273
		Click, R, 672, 273
		Click, R, 706, 273
		Click, R, 740, 273
		Click, R, 770, 273
		Click, R, 605, 306
		Click, R, 638, 306
		Click, R, 672, 306
		Click, R, 706, 306
		Click, R, 740, 306
		Click, R, 770, 306
		Click, R, 605, 340
		Click, R, 638, 340
		Click, R, 672, 340
		Click, R, 706, 340
		Click, R, 740, 340
		Click, R, 770, 340
		Click, R, 605, 371
		Click, R, 638, 371
		Click, R, 672, 371
		Click, R, 706, 371
		Click, R, 740, 371
		Click, R, 770, 371
		Click, R, 605, 405
		Click, R, 638, 405
		Click, R, 672, 405
		Click, R, 706, 405
		Click, R, 740, 405
		Click, R, 770, 405
		Click, R, 605, 436
		Click, R, 638, 436
		Click, R, 672, 436
		Click, R, 706, 436
		Click, R, 740, 436
		Click, R, 770, 436
		Click, R, 605, 471
		Click, R, 638, 471
		Click, R, 672, 471
		Click, R, 706, 471
		Click, R, 740, 471
		Click, R, 770, 471
		Click, R, 605, 505
		Click, R, 638, 505
		Click, R, 672, 505
		Click, R, 706, 505
		Click, R, 740, 505
		Click, R, 770, 505
		Click, R, 605, 536
		Click, R, 638, 536
		Click, R, 672, 536
		Click, R, 706, 536
		Click, R, 740, 536
		Click, R, 770, 536
		Click, R, 605, 571
		Click, R, 638, 571
		Click, R, 672, 571
		Click, R, 706, 571
		Click, R, 740, 571
		Click, R, 770, 571
		Click, R, 605, 605
		Click, R, 638, 605
		Click, R, 672, 605
		return
;------------------------------------------------------------------------------------------------------------------------------

Last:
while True{

	Click, 370, 287
	ImageSearch,,,0,0,800,600, *100 %batch2%
	
		if (ErrorLevel = 0)
		{
			Click 33,521
			sleep 100
			Break
		}


		else
		{
			gosub AntiTrade
		}

	}

return

;---------------------------------------------clicks cancel button after sack bugged (reset)-----------------------------------------------------------------------last2

Last2:

	while True{
		ImageSearch,,,378, 52, 425, 93, *100 %RQimg4%
		
			if (ErrorLevel = 0)
			{
				Click, 766, 163
				break
			}		
		
			else
			{
				gosub AntiTrade
			}

	}			
			
			
			
return			
			
			
;################################################################# RQ CHECKER1 #############################
	
	RQchecker:
	gosub AntiTrade
	while True
	{
		ImageSearch,,,625,588,654,616, *150 %empty%
			
			if (ErrorLevel = 0)
			{
				break
			}
			
			else
			{
				bobis = False
				break
			}
	
			
	}
			
return		













;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SECOND PEACE OF CODE SECOND STAGE----------------------------------------

;--------------------#################################-------------------------------------------------------------------RELOG


Close:
Sleep 600
Click , 775, 13
sleep 400
Click, 369, 360
sleep 2000
goto process#1


process#1:
if WinExist("GodsWar Online [USA]")
		{
			
			WinActivate
			gosub loginCheck#1
			MouseMove, 0,0
			ControlSend,, %account%, A
			sleep 250
			ControlSend,, {Tab}, A
			ControlSend,, %password%, A
			sleep, 250
			ControlSend,, {Enter}, A
			goto verify#1
			return
		}
		
		else 
		{
			goto wincheck#1
			return
		}
return




;---------------------------------svbug detect
servercheck:
ouo = 0
loop
{
	ImageSearch,,,156,509,295,544, *170 %svbug%
	
		if (ErrorLevel = 0)
		{
			sleep 2000
			ouo++
					
				if (ouo >= 3)
				{
					Click, 221, 529
					sleep 400
					Click, 221, 529
					sleep 200
					Click, 402, 411
					gosub servercheck2Click
					
				}
				
		}
		else
		{
			break
		}
		
	
}
return
;---------------------------------------------------------servercheck2
servercheck2Click:
while True
	{
		ImageSearch,,,438,499, 613, 546, *100 %server%
		
			if (ErrorLevel = 0)
			{
				sleep 1500
				click 540, 527
				ouo = 0
				break
			}

	}
return






;--------------------------------------------------------------WaitSignal b bag

	waitsignal#1:
	while True
	{

		ImageSearch, n1,n2, 567,568,652,621, *100 %h%
	
		if (ErrorLevel = 0)
		{
			sleep 650
			goto, setupwindows#1
		}

	}

return



;---------------------------------------------------------------------------------verify#1

verify#1: 
while True
{ 
		Sleep, 2000           
		ImageSearch, x11, y11, 0,0,800,600,*100 %c%
		
			if (ErrorLevel = 0)
			{
			
			}
			else
			{
				goto verify#2
			}
}
	
		return

;-------------------------------------------------------------------------------------

verify#2:                 
		sleep, 300
		ImageSearch, x111, y111, 0, 0, 800, 600,*100 %d%

			If (ErrorLevel = 0)
			{
				MouseMove, 398, 360
				Click
				goto enter#1
				
			}

			else
			{
				gosub servercheck
				gosub GM#1
				goto process#2
			}

		return




;-------------------------------------------------------------

enter#1:
 
			sleep 500
			MouseMove, 398, 414
			Click
			gosub verify#1
			return


;---------------------------------------------------------------process2

process#2:
	sleep 800 
		ImageSearch, value1, value2,0,0, 800,600,*100 %b%

			if (ErrorLevel = 0)
			{
				MouseMove, 370, 358
				Click
				gosub savetime#1
				gosub GM#1
				MouseMove, 398, 495
				Click
				gosub waitsignal#1
				return
		
			}

			else
			{
				gosub frecuent#2
				return
			}
		    
	return

;----------------------------------------------------------------savetime2

savetime#1:                          ;<----------------------------16 SECS WINDOW
	timer = 0
	while True
	{	
		timer++
		if (timer < 550)
		{
			ImageSearch,,,317,286, 379, 330, *100 %save%
			
			If (ErrorLevel = 0)
			{
				Click, 400, 358
				goto savetime#2
				
			}
		}
		else	
		{
			break
		}
	}
	
	return


;####################################################################GM


GM#1:
timers = 0
	while True
	{
		
		ImageSearch,,,622,519,800,600, *100 %entrance%
			
			if (ErrorLevel = 0)	
			{
				gosub GM#2
				break
			}
			else
			{
				timers++
				sleep 1000
					
					if (timers >= 7)
					{
						break
					}
			}

	}	
return


;---------------------------------------------Wait for the char to appear
GM#2:
	while True
	{
		ImageSearch,,,292,262,506,381, *100 %wait%
		
			if (ErrorLevel = 0)
			{
				sleep, 1000
			}
			else
			{
				break
			}
	}
return

;--------------------------------------------ServerFull

ServerFull:
Loop
{

	ImageSearch,,,292,262,506,381, *100 serverfull.png
		
		if (ErrorLevel = 0)
		{
			sleep 25000
			Click 403, 359
			Goto savetime#2
		}
		else
		{
			gosub GM#1
			goto Entrance#1
		}
}
return

;##########################################################frecuent2
frecuent#2:
		sleep 300 
		ImageSearch, k1, k2, 0,0,800,600,*150 %b2%
		
			if (ErrorLevel = 0)
			{
				MouseMove, 370, 358
				Click
				gosub savetime#1
				gosub GM#1
				MouseMove, 398, 495
				Click
				gosub waitsignal#1
				return
			}
		
			else
			{
				goto ServerFull
			}
		   

	return
	
	


Entrance#1:

	MouseMove, 398, 495
	Click
	gosub waitsignal#1
	return
	
	
	
;----------------------------------------------------savetime2 SERVER AND LOGIN BUG
savetime#2:
	cagadita = 0					;<-----------------------------------Server to go back Or detect when bugged
	while True
	{
		ImageSearch,,,438,499, 613, 546, *100 %server%
		
			if (ErrorLevel = 0)
			{
				click 540, 527
				gosub GM#1
				goto savetime#3
			}
			else
			{
				cagadita++
				sleep 500
				
				if (cagadita >= 8) {
				
					ImageSearch,,,0,0,800,600, *100 %login%
					
						if (ErrorLevel = 0 )
						{
							Click, 401, 412
						}
				}
			}

	}
	return


;----------------------------------------------------------------- savetime#3
savetime#3:
ouo = 0
loop
{
	sleep 500
	ImageSearch,,,156,509,295,544, *170 %svbug%
	
		if (ErrorLevel = 0)
		{
			sleep, 2000
			ouo++
					
				if (ouo >= 4)
				{
					Click, 221, 529
					sleep 400
					Click, 221, 529
					sleep 200
					Click, 402, 411
					goto clickingsv
					
				}
				
		}
		else
		{
			gosub GM#1
			goto, process#2
		}
		
	
}
return

;--------------------------clickingsv
clickingsv:
while True
	{
		ImageSearch,,,438,499, 613, 546, *100 %server%
		
			if (ErrorLevel = 0)
			{
				sleep 1500
				click 540, 527
				goto savetime#3
				break
			}

	}
return
;--------------------------------------------wincheck2
wincheck#1:
	While True
	{

		if WinExist("GodsWar Online [USA]")
		{
			break
		}
		else
		{
			Run, GodsWar.exe, %almacen%
			sleep 1000
			WinWait, GodsWar Online [USA] 	
			WinActivate, GodsWar Online [USA]
			Goto, Process#1
			
		}

  	}
		
return




;#################################### LoginCheck
loginCheck#1:
	while True{
	
		ImageSearch,,,0,0,800,600, *100 %login%
	
			If (ErrorLevel = 0)
			{
				break
			}
		}

	return
	
	
	

;---------------------------------------------------------------Segundo proceso After log

setupwindows#1:
	SetMouseDelay,10
	SetDefaultMouseSpeed, 2
	click, 254, 570
	gosub wincheck
	sleep 600
	Click, 619, 604                ;<---------- bag click
	sleep 600
	Click 553, 502
	sleep 600
	MouseClickDrag, L, 613, 127, 740, 267              ;Big bag on the  down right
	sleep 600
	MouseClickDrag, L , 610, 137, 77, 43				; big bag on the uppper left
	sleep, 600                     ;<--------------------NPC CLICK    was there not anymore
	MouseClickDrag, L, 607, 244, 530, 241 			; clicks the sacks and puts them in the right hotkeys space
	Click, Right
	goto OpenSacks
	
;-------------------------Open sacks-------------------------------
OpenSacks:
	sleep 500
		While True
		{
			ImageSearch,,,528,579,565,616, *100 %empty% 
				
				If (ErrorLevel = 0)
				{
					Click, 85, 442
					sleep 300
					Click, 301, 401
					sleep 500
					Click, 314, 73
					sleep 800
					goto dropthings1
					
					
				
				}
				else
				{
					gosub antiMount
					Click, R , 530,241	
				}
		}
return
;----------------------------------AntiMount
antiMount:
	While True
	{
		ImageSearch,,,603,35,648,70, *200 %AntMount%
			If (ErrorLevel = 0)
			{
				Click, 493, 567
				return
			}
			else
			{
				break
			}
	
	}	
return
;-----------------------------------------------------------------------------
stall#1:
	gosub wincheck
	loop
	{
		ImageSearch, a111, b111, 0,0, 800, 600, *100 %e%

			if (ErrorLevel = 0)
			{
				Click, 299, 403
				sleep 500
				Click, 312 , 71
				MouseMove, 375, 330
				sleep 2000
				Click
				
				break
			}

	}

    return


;---------------------------------------------------------------------------

detect#1:
	sleep 1000
	Click, 374,341
	while True{
		gosub wincheck
		ImageSearch,,, 0,0 ,800, 600, *100 %f%

			if (ErrorLevel = 0)
			{
				MouseClickDrag, L, 242, 176, 175, 465
				Click, 28, 517
				gosub detect2#1
				break
			}
			else
			{
				
			}
		
		}
return

;----------------------------------------------------------------------------
detect2#1:
	while True{
		gosub wincheck
		ImageSearch, c1, c2, 0,0, 800, 600, *20 %g%

			if (ErrorLevel = 0)
			{	
				MouseClickDrag, L, 485, 263, 534, 111
				Click, 774, 168
				break
			}
	
			else
			{

			}

		  }
	return
	

;-----------------------------------------Dropthings-----------------------------
dropthings1:
While True
{
		ImageSearch, scroll1, scroll2, 16,266,215,400, *170 %scroll%
			
			If (ErrorLevel = 0)
			{
				MouseCLickDrag, L ,scroll1+13, scroll2+13 ,236, 461,
				Click
				Click, 351, 351
				sleep, 1000

			}
			
			else
			{
				goto subdropthings1
			}
}
return
;-----------------------------------subdropthings1

subdropthings1:
While True
{		
	ImageSearch,asd1,asd2,568,197,799, 629, *170 %scroll%
			
		if (ErrorLevel = 0)
		{
			MouseCLickDrag, L ,asd1+13,asd2+13 ,236, 461,
			Click
			Click, 351, 351
			sleep, 1000
		}
		else
		{
			goto dropthings2
		}
}
return	

;----------------------Dropthings2
dropthings2:
While True
{	
	
		ImageSearch,map1,map2,16,266,215,400, *170 %map%
	
		if (ErrorLevel = 0)
		{	
			MouseCLickDrag, L ,map1+13, map2+13 ,236, 461,
			Click
			Click, 351, 351
			sleep, 1000
		}
		else
		{
			goto subdropthings2
		}

}

subdropthings2:
While True
{
	ImageSearch,map11,map22,568,197,799, 629, *170 %map%
		
		if (ErrorLevel = 0)
		{
			MouseCLickDrag, L ,map11+13, map22+13 ,236, 461,
			Click
			Click, 351, 351
			sleep, 1000
		}
		else
		{
			Goto UseTP
		}
}

return

;----------------------------UseTP
UseTP:
gosub detect#1 
gosub AntiTrade
While True
{
	if (Talent = 1 && A_index < 15)
	{
			
		sleep 500
		ImageSearch,tp1,tp2,15,269,214,401, *150 %tp%
			
				if (ErrorLevel = 0)
				{
						Click, 378, 321
						sleep 100
						loop 
						{
						
							ImageSearch,,,391,413,427,441, *100 %batchx%
									
									if (ErrorLevel = 0)
									{
										
										Click, 35, 521
										loop
										{
											ImageSearch,,,374,46,427,93, *100 %RQimg4%
												
												if (ErrorLevel = 0)
												{
													tp1+= 14
													tp2+= 10
													Click, R, %tp1%, %tp2%
													sleep 100
													click 487, 73
													sleep, 500
													SendPlay, {2} {7}
													sleep 500
													Click, 712, 168
													sleep, 500
													goto , elpepe
													
													
												}
												else
												{
													
												}
										
										
										}
										
										
									}
									else
									{
										
									}
									
							
							}
						}
				else
				{
					goto elpepe
				}
	}
	else if (Talent != 1)
	{
		
		sleep 500
		ImageSearch,tp1,tp2,15,269,214,401, *150 %tp%
				
			if (ErrorLevel = 0)
			{
				tp1+= 14
				tp2+= 10
				MouseClickDrag,L, %tp1% , %tp2%, 248, 319
				Click
				sleep 200
				Click, 351, 351
				goto, elpepe
			}
			else
			{
				break
			}
	
	}
	else if (A_index >= 15)
	{
		msgbox, timeout
		break
	}
	else
	{
		break
	}
}
return

;------------------------------usemd2
elpepe:
SendPlay, {l}
While True
{
	ImageSearch,pepe1,pepe2,14,264,214,403, *150 %md2%
		
		if (ErrorLevel = 0 )
		{
		
			pepe1 += 14
			pepe2 += 10
			MouseClickDrag, L, %pepe1%, %pepe2%, 248, 319
			Click, R
			sleep 200
				
				loop
				{
					ImageSearch,,,526,575,567,623, *150 %md2%
						
						if (ErrorLevel = 0)
						{
							Click, R, 248, 319
						}
						
						else
						{
							break
						}
				}
		}
		else
		{	
			goto usemd3
			
		}
}
return

usemd3:
sleep 2700
while True
{
	ImageSearch,md31,md32,14,264,214,403, *170 %md3%
		
		if (ErrorLevel = 0)
		{
			md31 += 14
			md32 += 14
			MouseClickDrag, L, %md31%, %md32%, 265, 262
			Click, R
			sleep 200
				
				loop
				{	
					ImageSearch,,,524,571,563,622, *170 %md3%
						
						if (ErrorLevel = 0 )
						{
							Click, R, 265, 262
						}
						
						else
						{
							break
						}
					
				}
		}
		else
		{
			Sendplay, {l}
			sleep 500
			goto dropsilver
		}
}

return


;----------------------------------dropsilver
dropsilver:
While True
{
	ImageSearch, silver1, silver2, 11,264,214,403, *150 %silver%	
		
		if (ErrorLevel = 0)
		{
			MouseCLickDrag, L, silver1+13, silver2+14, 248, 319
			Click
			sleep 100
			click, 371, 356 
		}
		else
		{
			goto START
		}
}
return




pwe1:
;--------------------------------------------------------------------------------------
a := "HBITMAP:*" . Create_klk_png() 	  ; kakashi IMG
b := "HBITMAP:*" . Create_entrance3_png() ; Frecuent login entrance (3)
b2 := "HBITMAP:" . Create_characterUSED_png() ; character used entrance
c := "HBITMAP:*" . Create_entrance1_png() ; verifying(1)
d := "HBITMAP:*" . Create_entrance2_png() ; connection error(2)
e := "HBITMAP:*" . Create_stall_png()     ; stall setup
f := "HBITMAP:*" . Create_batch_png()	  ; batch image
g := "HBITMAP:*" . Create_secondwin_png() ; secondwin
h := "HBITMAP:*" . Create_signal_png()    ; signal before set up(b bag)
login := "HBITMAP:*" . Create_login_png() ; login checker
entrance := "HBITMAP:*" . Create_GM_png() ; character entrance checker

;------------------------------savetime----------------------------------------------------------

save := "HBITMAP:*" . Create_16secs_png() ; waits 16 secs on entrance
server := "HBITMAP:*" . Create_server_png() ; server route
svbug := "HBITMAP:*" . Create_ServerBug_png() ; serverbugged

;-----------------------------------------RQ start------------------------------------------------

RandomQuest := "HBITMAP:*" . Create_RandomQuest_png() ; waits for the CRQ to appear
ClaimSack := "HBITMAP:*" . Create_ClaimSack_png()     ; waits for the CS to appear
batchx := "HBITMAP:*" . Create_batchx_png() ; batch x windows link
RQimg4 := "HBITMAP:*" . Create_RQimg4_png() ; empty bag1
batch2 := "HBITMAP:*" . Create_batch2_png() ; bug sack
empty := "HBITMAP:*" . Create_empty_png()   ; empty back if rq is done	
wait := "HBITMAP:*" . Create_waitchar_png() ; wait for the char to appear
AntMount := "HBITMAP:*" . Create_AntiMount_png() ; anti mount img
map := "HBITMAP:*" . Create_map_png() ; RQ map drop
scroll := "HBITMAP:*" . Create_scroll_png() ; SCroll detect rq
tp := "HBITMAP:*" . Create_TP_png() ; tp picture
md2 := "HBITMAP:*" . Create_md2_png() ;md2 image
silver := "HBITMAP:*" . Create_silver_png() ;silver img
md3 := "HBITMAP:*" . Create_md3_png() ; md3 img
trade := "HBITMAP:*" . Create_trade_png() ;anti trade
jai = hay bobis	

return

;--------------------------------------------------AntiTrade

Create_trade_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 1212 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAACwAAAATCAIAAABkynguAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAMgSURBVEhLYwgL850wobGwMJXWqKgoraI8Bw1VVuQCHcDQ1lauamCm7xTsHBhLZ2TqHiGibGhtZc6gqG1on9GXOv1Y8cIzdEZZs0/6Vi+T1rVjEJDXNYrvME7sHigkZxXMwCupou6ZOYBIQs+RgVtERt4qmHikYB2SUdM7ccG6/KbJSrZhXgml0QXNQHHXmMLC5ilqDhHIiolBwiomDBz8YhK6jhK6DhI6RKGUwvqd+4+GJheu2bI7o6w5s7y5a+o8NSuf0xeuRmWWSek5oakngHQd+WU0GFg5eQXldYVVTUTUzAkiMXWLIyfOeoQlAdlhyXlHT55LK6rtn7FgwYp1NW39yCqJQqqmQkoGnAISDEzMrBx8IsBI4RaVI4ikVXRv3LotJK0CZOuZ2T1/8TIxPffajdvzFi7hFZNHVkkUEpHlFBBjZuNgYGRiZmHnZGHnIgaJSUjfuHGDm08AyNbU1nv85ElMXMKxY8c3btosKi6FrJJoxMnEwgZxBIjPysmDingxETs3/8lTpy2s7YDsgODQLdu2x8YnNbe2t3V0rVu/ESiLrBgbQrECYi/YEcwsICEuPnYeQWC8cPCJcvDjQ+k5BZs2bwsMjVy2YrWbd0B8cnpTa4eAmMyuPfsKSip4RaTQ1GNHfCLsvEJsXEBH8zCzsoHSBBu3AFCCS0iKR1SeV1yRV0IJDxKSVU/MLKxv6w2OThGQVrVw9PIMigKK65g5pOWVSaroISvGhXjE5LmEZYAJgo1HEJQmgKEBdAEwmfBLqwsq6gsrGwmrGNMaCSnq88tq8ogpcAqIs3BwMzCzsgPDAOgCYIYR17aT1HehAwKWEKLq5gJyWsBcCUwrDMDQAMYC0GniOvbSxp6y5n6y5v60RtIm3hJ6TsAgAUYNGxcfMCTYgDEEDAYpQzc5i0AF23AF2whaI2BpLW3kIaphySelCooOZ2cXVg5uQQU9GRNvoLSyY5yyE82Ron2UrJkf0OdsPALCIiIMkyY3q6opMjAyoiAkAOEwM4FoIMEEFgEqAbLBUlANQASUgiCIEjgCK0RHQEGgSnZWVi8PFwAEozhTf/6DBwAAAABJRU5ErkJggg=="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;---------------------------------MD3

Create_md3_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 3056 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;--------------------------------------silver

Create_silver_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 3004 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;######################################imgKAKASHI#########################################################################################

Create_klk_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 22436 << !!A_IsUnicode)
B64 := "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"
B64 .= "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;##################################Frecuent login - Entrance3#####################################################################################################
Create_entrance3_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 26764 << !!A_IsUnicode)
B64 := "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"
B64 .= "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;######################################################### Character in use #####################################


Create_characterUSED_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 26504 << !!A_IsUnicode)
B64 := "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"
B64 .= "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;########################################Verifying - Entrance1##################################################
Create_entrance1_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 37340 << !!A_IsUnicode)
B64 := "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"
B64 .= "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"
B64 .= "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;######################################################################Connection error - Entrance2###################################################################
Create_entrance2_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 37148 << !!A_IsUnicode)
B64 := "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FE478dif/vI31/3wx+zfc+/9aJiaX3vOM57xoue90PO8r33zms98/nO77LLjR973oVtu/fNRRxz5sU99/Lrrf/jm179hZnbutJNPfuChte//2KcfXrfu6EMPOfdFz52cGP/Fr3/30U9fNQjCpdOLX/uK83ffdeeV96+67G3vPuHoI978mosmxsa+9YUraOuf3/Wf69ZvuOID7xlvtV5wwat6NtTFU5Ovevk5e++5+4aNmz70qSvvvue+f3jmU3descPee+yGDP3HRz55+133qNNGVGjHTqtRe+FznvH4k46da3c+c/U1P7/5N0cddsizznoScNz/cXu9878+cufKe9/39n/81vd/9JyzzvjV7/7wwSuuROSe8oTTnv2UJ3le+dvfv+HL37x26fSSd//zG3/zh1uOP/rwT3/hK9d+/0ei0AKN5tPCCTVdKDz08NoHH1pzwlGHj7VaDz681m4QAqxfDmO59ILz99ljN5D0vo98avWDD+6wfMnLXvyCg/bft93pfO7L19zws5/D5XOe/9xTTziWoPX9H7vipl/+csnixZde+PK9dt/tgYce+ue3v3n9ho02JQdC4J24ivoyOZWVt66MOkMhYijN0+THj0pFt+TaYobtJCBiM0JGV0Jrr5TG3TjYNEw7wDUvo8T1YcErlZcvXfLn2+8YneRclu21x14nHnfSP/3r2171htcffMAhp5582tjY5KJFi793w4/+5V3veu0llxKnNxoNmHb2Ky7ctGn9Lit2LBdLcPe/PvqpC1/3j4/ba49ToEKp+LY3XfrbP/75xa+49D8//Elq/tmvfnvuK98wOzf3tBedT77ltr+s27DxH86/5Ce//HXeNLw8+/nPuee++8++5HXf/v6Pzn3BczlZrbiVsnPJGy77+a9/e8QhB47oMU8WlAUUJ1p9wctf/bkvf/3M00+GfwQw04umrvzSNfTnpGOPpOxYq1mv+m/+t/dOjY975fLuO+902AH7Xfb291z8xrfuuesuB+23L3ReNDnxmz/86V3v/whg4pb5FrakHBP2d3QdClAzW1teMkp2I96Te+FLX0SFL7nktbfecddL/uGZnJ1tdz5+5Reefe6F7/vYFQfs97hWs4m9Pnj/ff/pne990QWv+u0fb8HMvfL8c3/x69+89OJXQ4cLz73QJENVyrRY1flqOMwRJ0hSNEPNweBf4mtq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"
B64 .= "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"
B64 .= "z3jSvrutOPHQvYJNqw7Ye9fTjjvsogtfftDjdvXTdi3rXPjiZ370Qx848YTjr/vGl7trV77p4pfMrn/wGc94WqvqvvwFT8sr7224n6bz/W3z2pV0hi4xlrKHTTc7rncWQDgenWigYSrZUG3cEiXGbESBQSKTJIUBmkuEsGLk8AQjImvNL8vTFKNNkqGFzIFVpWpHNMzrtgpyLU7DEjMgmz9LwUjQNC5BEPR6/blg0O33t/8YgW64+ujj9hLtR/qGlqbx8C8MoLkjJvzTQ0CjrgMt22hC3laPUxbYMi69tJyEDKFgsZ8JDAfUoCFIcXEtp5uNMMcOWZsRlEimPXVHjhSJFTuyvPMEUc/sPaDRkWqgk1tys9WSzaOeR5xcu27tQQcdfOYZZ3R73WXLlpk0O6+4+JLVDzwE2fDcdt5pp9nZ9k0/+ekgCO9ZeW+j0Xz8aaetX7/hSU98IuLyhNMfP6pKA6PNLTVvlTUyoRxCWrckKGxG4wH0ePzWdP5npHwRHlMDqhiDZeGCJFPrOJQC5FmLUw0r5iSS9WhNYYWeeUSR/u8fxM2pKLoYuQANfAuDPiIPxuiRoEyAliX6RkavHWpxu2gvZb+9REP6SuDoaOukcZqLjztqQxxZBKqTt6U3qCnCwOwZG1kL8PRRAnueIh2jR0ijj/0VcU9URmpCoiEI5iSB86Yt6Kads/6aGKgl0Y02tWqJgRk17aoR3ghhwQPZ7rQ0fztRg7JHXrdhc7PZXDy9ND/M83/+x3vPePKTk6wQxYmkzT6lHsSpHvtLCssl/YcBtZ6XL3laH94bhEGU3HDTz9717+/Lz1OSlkf7W7Jap5r5MSgxdq3n1IGdoNdclBJWsfxBV64GjMvK6NY00SpEOBrqTSitUJZABoH8Bf1jQBE1V8EmhxlctxcP0PoahnSb6qdOHUIXdJE9XCNq6w16ncAWS+k7Q3pomOnxAXdp1WnOpW0TTbhEZaOjrVMYEsgARVSvHhqgSYBQzjFiF3QLEKfX1huSCKB1sYnUEjdqtFmhP1ho2orlpJhPDIKtAooFzWK1GSV1nSBUwqnzNnihAV8n19dazEANOhJNQK1aEoHkm1dKehHYXguv1ua6/d4gOOfcc1rjkzvvuvsee+3NydNOPfXWv9x1+1337LnXnkXPK1Vr3Mt5dhQkVvw16zfvuGLFCSee1Byb3He/A/pResuttz9uv31/dNPPb/r5r/5w61/yykv6QLyT7y9kmqYDdIPOUC0cRdPMw2WLFjGySagZizSJPUOFK1BPTqq+nxjpBZSgp08aBnqmipIg4WyqgpFtZ08VsguiAv2nRS26gyQktaJ9lYGAeItyGUulZIglgi7tPOuV3iGOueZEqIe+9B/jvSd0Fch/BBsfkfTNdIUx0nrojJ6q7tsJDBMpUNgrJ0baZl53oEiHcZRo0WSSof9QdegjNSQpozOmAxSGmwYWIPTpCnxudUPsFw5GJNVFslVvR+6I3EIG8o9c5USRzheN1Qp6QiuzKvCyWa6PlWvj5dpEOPTe+6FPLV2+47e+8bV/f9c7dtp1T05e+pa3P/Wssy599au+8s3vbm4PnHL9zpWrOV+stFY9tC4tVjd1wo999kuXXHzRt77x1eNOOImq3vyv/9loTnz9y1/87BWf2GffAyend/yXyy//7BUfv3f1gz/63needMZTuN3yOE3TAboh3NgnohF9GxXZfpUYiz5GD3Phqh71ZFmnPTM7s2FudlO3M9fttjtzc/ztd6NBoM+HBP2gbx87km8jQQ60ODWNUUcmpfAHL4fK0Ima4xHVuSDRpzl2tDZFygz/gjgHiknWtC7U/BAYLishb8NYmPdymwSCnb13H3vPuz742c9+7rqf3zr0tswIr1xzJ+zWiyvSqArhcOYqXgUFRzcS+38yME+r5oCCaRB79y/mkECBTvX0CnlxcpFevdF1mbdcVeag0DBBYDiYE4z0ni/6X2GzEtUhhaaC2LU9u2It2VCHaRrhTnIvx+3NM895+uO/cNXXN7SjUqVeqjZK+tafJ6T9ryQ6mCA9fQX/Ya9eSs961pm/u/UeIwMw0WhE1nywoN1Btfe19CII8rP4jmlc0EeuBClpFPEdAjgFfQKnjMWWHyspBHyaN5E+E0Is+X69UvUpI6M1SpwmXFFGX2FBqEDClsmrgqTqmCYR9WlOPdhLh3ss32fLjHDUPeO4/c8++yWXvPJsN8L85F1fqNyS3hxFicjhMI2v2cmhVpcEXXs/1CaIJf8mKhJ0dvUcyrwa4Ez3FU4iDRjPPjq236fPWuVOSVEVjaVvw2jie5gShQX2L+YQHelmqSI59hZLS6eqcjQKwMPFGTpR2ANxnJEfZw5T3n8p4HJFuPFbZb9Zrv0vZb9JB+gGnVGHGaQ8kQhrY5+fYmtLlCRDjBRfVwIE/xh5lhTisBANMn1gWXEE3HQh5pAwVFARUiwEs6m/zNF0p7F5VNopYgB6UkgDXEtpE9UgH0Orf3CLpEVSVKDeMapP1OrjtcZ4tdqwxYf6f9JQUPZgG3kbYVaflnHDPqDTdJCdGyXPHdAxT6s0GZEsA6zTjLS+IwGebO5eb1fIRJCFbbqseFsKBOLQv5IUCkGNFpLhEREh6nxurqQn6D+OUW59BXnpryTEmupNIn3pWUuTpFjzIBL7HgdEZ2Fgn2zRN3+0bFHYNdG0etijMq+ory5Ui9W60PO/kdU0HfD03yXpkjo3UgKay0CpyLHVx671shUCKPHXP2lKhB8oaoJM+EIW+cUs2WCpdD2VUn3GFRCkjGQZl9UUlI2jtN8P23P6T3ISV/wh+wctFoJp2RmCXq3o22EmkPoCOWIJYjzPJ2upoZBW8IpbuzVSRsgod81TfEuSVGi8SDk4oV6BTmpShsH8KFkfCombI1ogJkJylmR4ftxE3WVPulGTOPp+JCAsgZuB/u07DQxBu15WKpSj1GU0UE5fBtXLv0OCxnyKSB+EViaAhL76HxamYCG1VkeDJGFLa7ikvUm77LJLHHRRvPYMR59VQtD/d7I+5efRDTpDl8bHJ6CAdAQMlovjKMbp6z1tAQim6gV9yU8+kyuWCRTmrBlk8i0Sa3FJAbBBQAtH4IE0vdS1XvCXItHJAso4xgHqdbr6HIkiL+kZmMFFD+nXJ7doDvWmW2GjOCmfFVmFq5gt3E10BOp8q1SpVJ2dlpc/8P7PXPmZz+LTVJ1BtVI8eL8Vax98eOXGcGJ6SkbRwCKJV5+FbvCmuuPE5m/t4y44yySskv7ZEIW0WNB6IA8ZlmpltnqpuuS+FEs4yggH3YVkkAY3sCihzBsxopn3ozP6tQ7YD4PBtTfdJ7vp6b+olxGm8Wr5Zee98Morr/7Zr24p+y04h/jkN/9vJGgkhy0etFcsmz7ppCP/cOtdEeEuHELHxkm32wcHzaY+py12QTtJQxIMxNQcMYyWDAGBUU4HbU3NcEW+jJAIJXTBpFdX2BVt9MUnvG997oLCEnRpfsk3/Go1W16lavKuiUG7SyaFfZLpqmjj2g17TFeX7rj8j7c9EIRpMPTxaV56ztmvf+PFzs7L3P/+wKc/d9Xnb/jRjWiGU5/wxCXT493u3Geuvn5samJiqf0TcDlqdBoLgrs/4iYdoklxt1hkwFGIptW/OueYMaBZGQdGhevCrv6bb6lSqXAz2kqVkV030L8RtC+16nUqaTUzMUoy4PJXFD+xkcMmSYCmQ+STytF5sqEVv1z11VSSbnhg9VWf/8APfnCTVS+U/zWkcrn84Y98fvHOu8ISzcjh2DkO5oPR1Gtc9OQAQijNwgMalEdOHBu1pAZSSzeLlmakRq4tV+XBKIRXqVysoHwR06PXijmiQq3ZDjTPpflaW25Rq1XqjSa3g1RDjPCSv9MjlNJMNlz7wAMzGzad8/wnNhpj69bP3vD961PHPfW0U17yohe/8U2vdJYuKXz0g5/7zre+OV4vP+nM4+nQqgfXNOpVPKk3ve3jtXprYmL+P4z9tXDh/5TkDP71JZTiaO+vOYErSzMzM/1e+92XX1Bv1Lq9YOcdlwHK733nZ7O9+MynPv21l73CWTJZ+OhHP3/X7X88+qhD7rv/zmu/9VWv6tTrTdzpnffcb936bOmyFfo3Dv//gZm/p//7lLO46A7XrnlgybS76u7bgqDb63VwIM966nN23WXvX938h732Pfh1b7jQWba48ImPX+176d13/fHr37h2v/32O/qY/Trt4Lbb/twar/70l6t++sc1eo6Y1/r39Deccq0wTE84eNkJx+zcng322++AZqv6q1/eRnrmM87ac6+DB1HxlZee53rEp+Xybjsvu+uOW7uzD5xwwvGrH5h5xnPPXr+5N9sZ9gaxU6o6ZV+59Pf8N51HXK7CdFgPAIABYAASAAN4ABKgIpd51x2qH/7w55dMuFd86kN//P3v3vjmf+2FvZ/85MfLd9gpysrvfv/Vjv0D8b+n/3fSMBq86TXP99z44YdWn3jiyfVK/d/f9c8HH3rY+eddsm4mu/iVZzt77zb23et/3t+46oYbf/CVq7+y5z77nHz68YPBYG5u8MOf/GHdmk1Fr4J/iWkyx+bv6W826TGE/U2jcMmyqcefeMiYngD5P/7Bz+6+447nPv+5p55yem3RzqeeepSz3z6LX/KSi152/nmEvJvWbx6WXVs5Vx5E/STSA2P5Mi6gcQjFrPK/p7/N5AIb/Bo9rNAET8kb+l4t0ePpxImzqenJOAo/ecWnPvihdzonH7vzPSsfctxyMBh4niaBbIrAJXbXLK28I+FPcwCGQ00j6a+d0kaTMfxo0k/TTJpwyP1wtvkO9WgiQf/1Rd+81DOGOKODmjv2tHJWU5H6GZb0Ib4KFad6Z0w1FYslfctTrY8mMzRHRNfseYodaqO/Om/9yfTZS71SzimbJ+dKqummxN5Eo3w+D6bbrEyBgVOOCrldHZ4fWj4P7trzHirQcDI9FbH76ZvjefpqGYVVULUN87l+1eo4SZr1e0Ga2auoXNUkmyaeaNgWrRh5bRQ5pazVLSOyC+rO6K9uU0uxpnY1t0DJkv5/x2iimV/KGKngiMjFPj3JK8/vV/N2qBmgvCujZM0PKW9nRm3aMu3Rq20Fr1oJw6BZT/4/Hm2RW9xCYioAAAAASUVORK5CYII="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;#######################################################################Stall#####################

Create_stall_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 1492 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAACsAAAASCAIAAABNSrDyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAP0SURBVEhLY1i7dlZNTR4dUEtzOSYqKkpnMLO2VtCzMXPwMnP0pifSs/EQVtA1MNBj0A8sSJiwr3zJ2Yol5+iJ8uefDmxcK2PkzmAU32GeOmGgkFZAMYO6VxbxSNMnW907G00QjjR9cpyT6v1z2t1SGiEiugH5QK5fTru2Xy5cGTJScohmULAOlbcOQUOqDpFBmbX1Exa2TV+WUtmt6RIDFFRxiEir6tX3TERWiYxU7COKmiYu37DzzOUbEBEjn+Q5yzbcefDYzD8VrgwZSRt7MkjoOUnoOqKh4OTCOcvWxeVURaSVBCcVKpt7AQVVLLzWbNlt4RWNrBIT2frHn7pwBc5Vs/TZuueQvlMIXASB9JxENSwZBOR1RFRNRdUt4Ehc07KqubeyuVdCyxouKKlt8/v3779//wHJX79/z1q4EigYl1V298Gjj58+r9+2W1rHFqLS2ivi5NlLEDYQKRs7b9m5X8fGBy4CQSJq5sIqxrwSygzsvELcIrI84orIyMbFe92GTb2TZwZEJSvpmvFKgAQllXVWrNmgZ+4AV2Zg6aCmbwEUn794WWpOEUTQxNb1xKmzcDXSqnobt+xQ1TOHi0CRmAKXkBQrBw8DCzsnGHEhIzZObnVNncTk1BkzZ02aPEVOURkoKCgitmz5cqA4XJmSqnp1bd3kKVMPHTpcWlYBEdTRNzx27DhcjbCYxLr1G2QVlOAiSIiTmY0D6AIQh5WTBxXxQpCMvPLMWXMcXdyBbEFRyWXLV2jqGsBlgTZNmTZDz9CkoamltLwKIqhrYHLs+Am4GmFx6fUbNsopqqJZwcLBDbQX5AJWDm6gOjZuAXY+YXY+EQ4+EU5+UV0jCwcXTx1DM++AkIWLlxma2QDFuYUk+iZOaW7rMjC1Utc1Aorcun2nq7ff1ct/z74D5VV1PEISSuq6voGh585f1NQz5heVFpFSMLN22L1nn72LJ1AKqAWIQBbxCrFx8QPtZWHjZGDj5gfZKijJLSoHjBtecUU+CSVHr6C+yTNnzFvc0j3RwTNQQEoFKA5EwETQ1NE/fc6isLg0IBeobMK02Q1tvVFJWT6hsXIahpUNbbPmLwWiabMXahnb2nsEQLhAVNXQDjGER1SeW0SGU0CcnUcQ6H8GDj5hbmEZPkkVQXldISUDIWUjWiNBRX0BWS1gYuQUlAD6nwFIAa0XVjYS07IBZlBJfRdaI2BJAMyNgvI6PKJywOhgAAYAkAO0XsrIQ8bMV9bcj9ZIxtQb6A5gIcQnpQpMAAxcwlJCSoaS+s6y5v4KNmEKthG0RvLWodImXkA/88tqAnMAAxMzCzMbJyiHcPED+fRBrFx8wNzIzMrBzMoGAPufZ+MfELxeAAAAAElFTkSuQmCC"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;########################################################Windows called batch function-------------------------------------------

Create_batch_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 1292 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAABIAAAARCAIAAABfOGuuAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAANdSURBVDhPYxCVkisuLp4zZ05NXX1NQ2MtblRT31BeUTF37lw/TwcGF1fX5StWSCuqiRm6WsfkWsflW8fmW0XnWEZmWkZmWUZlAQVt4vKByCgknVFcx9zCwt3VgyE+Pr6yrp5BwU7Sq9DEJVDL3FnH0s05Oj+hsDO2oD0yt9XUIwIs6Grgk8hvnSWqba+poQ7SVtHQyGAYy6Xhkdw/q3H/1dz1h0z9I8PTqhOyG+0D4wwqGt223Tc5fkcywYvZLE7MLk1NQ58hDqyN0TCWUS9UycWz7PST8sd//DdtNnR2840rNEhPcr361PHRX70ZW3iMvZhN4sXs09U0DaHaGPSjmIzjmJUcXSpzsx5/T3r0w6SxQNbM3HzpKsePP43uvhKJCmPT8WMyjBazS0VoY9QNZTSKYjSM5Ne19Nm4K/rjP6/3L/SmTrN/9sbqwX+Z2fNZlKyYDCOYDMLFbBPVNA3A2uobGbX8GfVDmPRCmDQ8FSMSvS4+c//3zen7b+svvzSuXGXXlmDU9mXSC2bSDRSzioZqqwRqU3Vn1PJj1PJh1PTm0jQyXb3J/tN/y7/fDd9/Fy4JYZIxYdQGy2r5iJmFwrU1MMhZMGq4M6q7Mik7Clo6m+6/YP7rq+Gv31pvf4rOn8wqrMyo5sak7sao5iJmHKCmAdZWVVfPKK7NrGzPrOzAJq+lMrHW7Ocf3b+vVF/cUfz1Q+z7P7bQIGYpA0ZlB2YlOzE9F1AEAOMNqI1BRI1Z3pJZQkfY1dXw6iPdN/+l927g83QRPnGa58tf1pNnePR0mWWMmeUsxFRN1NT1QNqq6+oYBBWYJfT4JIRU9uzQfv1f7uojLgNjFlEpttpi5hefGV69YmosYZVSZJY2FFPSB2lLTExsaGpi4JNiE5CT7OvX3PpH7tpv/vo8fkl1CU1LET1l5oPbGf6+Zbh+StDJmllUXUxRRx3oSP8A/+i4OAYecR5BWeG4JLHELJGQSCENHXldawVda0kVfW4zI5aMFLb4eFZTZTYhOQEpZRlZZQZ9ff3wiAgeIQlmfmkhcSCSEBKTEpfXlFDSE1fSByIhGTVBcUkRCWkeMXkmLmFpeWUVFW0GASFhP3//5NS0yJi45PSsJCjKTEqDIbAIUCohNSMsPDwpJVVL2xAAc5AonL2pUOkAAAAASUVORK5CYII="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;#########################################SecondWin##########################################################

Create_secondwin_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 2584 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;###################################################Wait signal before setup rq###################################################################

Create_signal_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 2840 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAABwAAAAaCAIAAAArNqveAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAfmSURBVEhLJZVpcFPnFYavZFuWLMm60rUka7larQ3t+77LFpaNbYwX8IapbSR5keMFL8E22NSAwYADg9kDpIEyAwN1AQOlgYRpU2ZIS9KGUKAFJX/a/slM+6udaWd6JM7c8+muzz3fe17dD/nbP1of3HdVb2aXcGkkGUvoLE+0iCo3S3g43Rbm+xvELUlNetAYr1Ts31ttd/CiDaypI4b5ixXjByuqO8gaF6lCX8pVUMsrSvpGHEMzBoUBRc5dEC8uMuf3MHEdWm7hJvqUu5e1B1esLIzKxGi+uPDj9fg3r7claqQkUgGRSCBCEgjFFCKVTqIzyCibguI0nU+4cNJ56hfW0eNcU4CFrJ4SPvos8OC2q7uPpjAz6jqFQ7PKg8ccUgWfy2Gp8DKNkiuSMQoLiXIcjboV9Y01iU2VEj6VTCngyYqUHhJLRu7IaD956OrdLTTFqcpoCXLvjvGPz+N//6HtyhVN6w6h0ojVbVVML7qkCg6FQmbSKTiXnmyWLs8p1z51fr4effq46+7VjtH+xp2ZVFd7FYlCxOXM3l3mzalyhYqi1tETPVzkh2zP+RPizx+Yv3rqGx7TS6SoDGeyMAqUhiCIHKc9uOB4/ftA9ttg9pk/+9SbfeZ78wffnRXrgZntn6xdGxmoIxYQUAZJyCoRsKh2L6tvqgL5939G//S8beWQ6PXLaCSGG/WcwgIihpL8FvbqjPnVw0D2JeB82Uee7Lrr7S3nX2/Y/7Jme3lVu7ZPPp2sPHZg0GPCi4hEn5JX6xA7ney6Rgny4lXlf/838d2Lhu+/r/e68YICotsivHTQ+vVj37sXgXd/DmafeLP33G9uOr+7avvqvPG3J7WfHVWfH8YPdaAjNehkqm44tRlj0tilFF4ZKuRiEm4Z8ux55J//Gvzxx12vXvVTqSSLSXvy+PSv1/c+f9j69ok7+yvXq+vOry9bfndK/8XKhntLqpt7Ky6OSvY0scY3UkfilL5a7cJMr1LOB0uolEqdVqvVaJDkoEqkKOPJ2cEozi1DuxpDmZ1dEzNz59du3b6cfnvL9OVp84PD6lt7ZVcmxZfGpEA8nhS0u0mZypLxjeSBhHh2tNOolUEDzGazxWKx2WwIg8Uo45RhbIxKp6ok2EDThpMjpuW0ZX4mee7aufunq+/uV58eFB1PCk8PiT6dlJ8dlg3VMidaeV2u4g8q6alaxfxUt1knAajJZLJarS6XG1Fp1HCg1emYaGlLmHtzUfD2rubFx/i1GdHh2foTy+mlHZKZRvbiNv6RHvxUv+jwDtFGI7neTg9XFCZrNTMDG6cHYh4jRiAg7nz4fD7EZre7PR44oJIL5jtZ31yTZG/LX6xiD/dxD2ynzU00ZerlU/WcuSb+XDNvpomfqasw8osWe6SjTXhEV7q9Wt2/TV8bxmglxXqDwe5weLxexOV2e30+KJtGQS7vYmTXVdmf8b88hN38kHe8T7i9Rj6wNTBWL53eIvqgQTPU5E62VfZsku1pEY41iOo8irF2/0S3rSnOYrOK1Wq10+XKQeEHytRoNCiVsH4Yy95RvDnDeLRYdn1KsDqo7opKl+b7htuCI13xuYm+lSOTU5mGrSHeYBWrI8jtb3Du2RGY6bW3JlBWaaHBYAwGQ4FAEIG5A1csFrPohC9OcLLXhM9XGPfnOTemBWcy2rFm29Ej42fO7V+9sLK0NJXZUbM1okmYy9sDzJaIeLrTvX9ncCHlbKth0koKoTcA9fv9SCAY9Pn9fD6fSSM8Psp8d5n3myX22iz/xm7BxVH1Qre/udbT3hzpSBg7Yvq+TbbxbZbuKkV3raDGw5nrtC6n/Atp65YYg1RU6HK5AoGA2+1BQIJwOCwSiXLQY+jby/xH+zk3dwtvTOMXR1SLPd4tPnHCjPZXS8ZbDPPdppUh62iLPm4p7orxDqXshwdc450VVZ5yMD+gvF6Pw+FAIKFg0JhBJfzyp8xvz0qvfyi+OiH6+aR8NWNa7PW3R+SNdsZwNXuhQ35iQHN+TH80pUvVyGa7jAfS9l2durqITCZikykUmHFOTKcTgdYD1G63g6WW0/iTZeXqgOZMRnVhVHcs7TrQ5++KKba4sEycvtRZfjYjujQm+yglzzQZx9oMP2mQxt0SXMgvKCjQ6fShcMTvDwAOASLYFQQuoZCTzeZLk4I97fKlXsvKgHM56T24098dVzV68FQlbXYL9lEP70QST23ktIXlISPHvEHARBmwFshkslAoHI5EoETYcpYCbigUEgpxKc7eWccfb2R92Ko8lnYeSfsPJf1NAUm1Q9zpo44mGLsbWek4ZhAVVwgwjJnDkclkiUQCU66Kx6PRGKA80CiwFRChV+DW4uLicozm0rIafLyJZuW+bvP8dlNIz/FrOVEDY5ON6VYxBSwShVQIgaKoVCbT6XRgdJhyPA8NBoPAQWKxWDQajUQiQJZKZXA3rGzFpEKlqCyow9wahlrMFpbRS0tIhbDqEXILHwNF4VOUmyIYKN8ZKBACiDDmoLAXAWosBop4PB6jySQUCuExqBrkB0RRURHsU6lUBoOB4zh83KAucA+M4EqgQEtgJ+emfOSheYWjsUqQ4f2tsEFYLFalUqVQKOAfDG96b2wQKhfhcI4XDOYyGATpYIQTQPf5fUDPmR9wfki4GI5U5SIOCcWH8mrnXxEAyvsxRwvlr+RHeAYyx4bIn4nGYv8H3ahq1Q4tdicAAAAASUVORK5CYII="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}


;##########################################################################################ULTIMATE DETECT################################################

Create_GM_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 1660 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAAFQAAAAYCAYAAABk8drWAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAARySURBVGhD7ZldbBRVFMf/dz73s+3SLW2ltYAErEiipiHVaESoYohNGiFREhIMpn49Kg8kfjwUNTyY4BNNMMYHJUgkYCRWjSUYY1EIkFKwFYjQmiJtt9hu2/2emeu5M0OsDcHWpp0+zG9zsrvn3tk9+99zzr13l7W1fcp3796L06c74fP/iUSiaGp6Gmzdhsf5dasK67c0496axe6wz0zov5nG8WOHMHTmS7BI+XL+4OY3EC6OgXPuTvGZCYxuhXwWv7Z/BhYuu5vXPLJFeH1mA+Vi4tLPYMFYBa98oMF2+MyOkd4uMD26iJeuqPPLfZaIAh8fuAqmBqO8aMkqSIpCTskZ9ZkRXNwsE6nEH2CSrPJAcRnUUBRMVt0p3rBp7Ri2rh/BqqosLIvh/NUA9n8dx9krIVz4qAcFg+G9AxU48lOJ3aEa65N4e9sAgrqFNc21zot4gBDTyKSQHUuAMUnisqq7Q95QFuNoednAE3UmTl2UcPF3CVQwWL3MwjcnZRz4VsZwe4YEBQ5+p+CtVpVaFPBOcwEvPGNApbnxhqD7at5hGYXJgnqzzGtUFK9uJmEaDby5T8P3p2RbOIEiAwGNYyLDkGhPo/dPhqERhhdbdDtDW3flcVfcwj3VHGUNIeciz+C2oJ43TZGdT9WbOHJCQVvHP2IKDBO2mDakYP8gg0m+Wsrc1cstFApA7w36CAtoPfVc0FiUY0W1ZWemQGRlNMRRFOaIkokMvkX/EEPPNQmNj5lofNTEBWoNA8MLawPtuaBCMImiSGed53W1Fo5+kEP7viwuHc7glWcpDV0MWpQ6zst4eI2Ftfdb+PGcZPfShYTnglqW071lN5Luaww7P9Tw2p7bL5QnuyTIMkcmB5z9zcnqhYTngqZJmOQEw7IlpCwxlmLovCzhTM/tQxseZXj3Yw3vf6IilXGdCwiKWuSHY7Qppb3oVKMN/xzazTEVnVcUbNtkorTk3+8ncGJyHtMT+/GxDh0nzumOn3z2kHvN/NgkfSg+od0ts6OhrZN9UpIUDbIagKKFJllwTm08F8LhHyJYWsmw9/Ucnt/I8WQ9Q9M6ERh9yXTYEPNEvOIDTL1e+MTYVP/cmqONrAYhqZpzyhTCihglWeFKMAKZxGSyGFRpkRCD89cNNIXjoZU5bN84ivtqMrRR58jTAtQ3oKP1qxh+6Q6i79BlHDxejF37y92rHPa8NIitG5KoeW6l65kv6LhJezjLLJDlYRXyMHJpIajK9WjMVlsOkOpagAQVpSRS2OdOcNOAWcjByKbpnk5y6SQJqmg8UBSns3yRbYoeAonsCzoNxMnIzJOQmXFbzNzEiGhRJGhJBfRIDFq4hLI0Ype9+BXa586IchdlXkiNIk9iZpJDTg8NxioRjJVDiyyiDA1To6UV1M/Q/8QyRN9MkZijyCYTSP91HWzHju388y+OQokuRqi0CorIUL/kpwGnDDWof6aQHR1EOtGHpdWVYC0tO3l//w10dXW7E32mBzVFN+nEvx0BXUe8rBR/A5pujUKmqiqoAAAAAElFTkSuQmCC"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}
;###################################################################################################save time##################################################
Create_16secs_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 1352 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAACQAAAALCAYAAAAX+i97AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAOKSURBVDhPtVRJTFNRFD2//W1tFErLVBBqRQ1BECRODEpQASdko1GjQBzQiInRuDCujBs3mpi40IXRBcQ4K4oQBZyiJsYoikNwFgfQUkppIUztH7zv+SWEqJGFJ3n/vffv+/eee899X7BOcKpmsxEREQ7o9Ub8L6jazDB8PRI6gR5GgwG5czNRvrH451sNBoOIWemp2LqhGLu2lSHWHq1ZRgEWYBj+RkagszqD0YCy0vVYWVSIoiX53CAFezDY70HmzGQszMnGw8dPcf5KLTzeLm4fFRiDEaT+CDor2JxONcHpgCN+Co4c3I/5hcug0+kgkPHwgQOoOHMRvu4+DAwMwuvzQ1EU5GZnoHTNClhCQ1B36y6OVZyCeYyJJ7R8cR5UVcW5y7W4duMOJEnCzPRp2LB2FaKjInH/4SMcOnpCY6BBI8xiimzndneScwtPRlEVKOQkIjwSqSkpyM91wWSiHgu34+T5KjS9aMbm9Wtx9tJVNNy+B51ex50lJyUiLjYG23fvhT06CptKVqP5zTt8+dqGklUrUHn2Ip48b4Y1zMLP/xZETBRIOO5UKy3LjiFk3Fh0dnlxvLICfX29KFy8FIsW5HBClVS1gtx5mJ6ShKraerxsfo24GDuyZs+AIy4WoijCTtWwhIRQIjaMoeo1Nr1EkBJ1uTu4/yGMkFM0iD8zVBSZkwoEAnzf3kEfcm4COQrC6/WwFRS5H/Uk0+17D7h0e3aWY92WHQgEg6i+3oDTF6qpyvQhDZnkZbIaiKCRepURGknAZg1Dl8/HjnPobTH2fUmJicjJzEJ2RgbJ5+H94uv2I3HyZCQ4JyKUMl2+ZCmqaqrR2voJBQvz6DcRjnBbGGwkQT1Jx65ITtYcLq/VEgorC+T3o7e3D2kpU+F0xMFsNtEcj8+tbTz4vDmzcHj/Xrx934I2VzvnSoRi9k2ZNAnjSf/GpiaMI6m+fmuDj5x9+NhCQW0Is1jQcOsmnj57Tv8qPRFNoH6JokroUVN3E94uH/zdPXB3eBBPkkUSWUbku8sNWZbx9kML753oqAh0eLxo/ebilRokNdg3L169obbo5ySFialpqp56iN0elRqa9xTdMj0NHQUXaahQEAxIREag0pt4JgLZVZhoQeMfoCkyNP+Sjk9DL+k/JMsSz+JXD6kaMSaBIsmQyCZLtNc8cBsdVOm8FOhGcKCd9uzdKEGxNE7DFsAPWthgIP62dEkAAAAASUVORK5CYII="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;##########################################################################################################server################################
Create_server_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 2452 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;-------------------------------------------------------------------------------------------------------Random quest link

Create_RandomQuest_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 2096 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;################################################################################### CS link

Create_ClaimSack_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 3244 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;################################################################### batch X win link ################################################

Create_batchx_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 1292 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAABIAAAARCAIAAABfOGuuAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAANdSURBVDhPYxCVkisuLp4zZ05NXX1NQ2MtblRT31BeUTF37lw/TwcGF1fX5StWSCuqiRm6WsfkWsflW8fmW0XnWEZmWkZmWUZlAQVt4vKByCgknVFcx9zCwt3VgyE+Pr6yrp5BwU7Sq9DEJVDL3FnH0s05Oj+hsDO2oD0yt9XUIwIs6Grgk8hvnSWqba+poQ7SVtHQyGAYy6Xhkdw/q3H/1dz1h0z9I8PTqhOyG+0D4wwqGt223Tc5fkcywYvZLE7MLk1NQ58hDqyN0TCWUS9UycWz7PST8sd//DdtNnR2840rNEhPcr361PHRX70ZW3iMvZhN4sXs09U0DaHaGPSjmIzjmJUcXSpzsx5/T3r0w6SxQNbM3HzpKsePP43uvhKJCmPT8WMyjBazS0VoY9QNZTSKYjSM5Ne19Nm4K/rjP6/3L/SmTrN/9sbqwX+Z2fNZlKyYDCOYDMLFbBPVNA3A2uobGbX8GfVDmPRCmDQ8FSMSvS4+c//3zen7b+svvzSuXGXXlmDU9mXSC2bSDRSzioZqqwRqU3Vn1PJj1PJh1PTm0jQyXb3J/tN/y7/fDd9/Fy4JYZIxYdQGy2r5iJmFwrU1MMhZMGq4M6q7Mik7Clo6m+6/YP7rq+Gv31pvf4rOn8wqrMyo5sak7sao5iJmHKCmAdZWVVfPKK7NrGzPrOzAJq+lMrHW7Ocf3b+vVF/cUfz1Q+z7P7bQIGYpA0ZlB2YlOzE9F1AEAOMNqI1BRI1Z3pJZQkfY1dXw6iPdN/+l927g83QRPnGa58tf1pNnePR0mWWMmeUsxFRN1NT1QNqq6+oYBBWYJfT4JIRU9uzQfv1f7uojLgNjFlEpttpi5hefGV69YmosYZVSZJY2FFPSB2lLTExsaGpi4JNiE5CT7OvX3PpH7tpv/vo8fkl1CU1LET1l5oPbGf6+Zbh+StDJmllUXUxRRx3oSP8A/+i4OAYecR5BWeG4JLHELJGQSCENHXldawVda0kVfW4zI5aMFLb4eFZTZTYhOQEpZRlZZQZ9ff3wiAgeIQlmfmkhcSCSEBKTEpfXlFDSE1fSByIhGTVBcUkRCWkeMXkmLmFpeWUVFW0GASFhP3//5NS0yJi45PSsJCjKTEqDIbAIUCohNSMsPDwpJVVL2xAAc5AonL2pUOkAAAAASUVORK5CYII="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;#######################################################################################RQ img4 (empty bag)

Create_RQimg4_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 1096 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAIAAAACtmMCAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALLSURBVEhLbdXLTqM7FITRToe7BEMQT8AAifd/LoS4BAhn2V9kIp2ugbVdripv2z9h8/j4eH5+/vPz82dis9lUbLfbs7Mz/Pf3934C+XeCBgkpl1fx+fm5eXp6urm5+fr6Kgu7QpFsmJOTk8hhmLCf6GSAae+Pj4/t7e2tZeYoYFM3XX6hInSaWYqREjO1P/MYe5axD5ExG6iNM+q3a6NE49Kfnp5isvBGwm/nS+1aa4dOfXFxUSJGDcgsLpqmOjuMRBPQcBS/RGNFq/h5rD2mjtJYMvJaSvZ7aixqRWRwtKurK+ci0NH19bUeWwIp0onrBnNITHF5edkRpBAp4P39/fX1dU3VLy8vHlS92+3aiX15xxTLINFzk9JJac8lWiAjxreUvrFdpf/VkSz9S5Fu6nR4Hv4w0waG4eiKiVnoxwXPP4GhkS1RRVRKti47Hqb4UC9/nQpNIGo401VAUvh/j8d70xvXSYlH1gwZPap0DsM3//iMGWB11OVGshDE00tk1yxmfMnYpNUK5k69gDcuUkp14vboErb39/cm/gxAYdlu6l7JSAfxMUYwrU0fLD2NXO8+Tk799vbmQ1vnrQuKNVWAICMeU2umat/p8/OzENORaMEyqGtKnN8VXxko8CEG9NIvG72xSyjh8MQLNW/bcdR5LzUSql2OoBpPvzTSt3d3d1gV2MTOQE2ESVqRmSZlqOXiEo+3tqGqy3bHvQCGgXloJxiINaiAnojeCJQwBKlVthKRk602FbA0xg5kaZ0X8ioIDmoie0I2EJR6nG3uVAFrD66mq0f4XYPijEAa37nUCr9a7uRYQ2BXo5bxcEgErJHOEYx2ZvDL5isrnbOfy7478IZ9wgs0h0TVeLPdrg+bVIpiNdJfhVVAWvJJKkwztiuM/66WCw2rnoKBjpa/pWDpeKzYPDw8eJDmx+j6ZUFMGEn/2jXs9/v/AJ8AUy3qqoAZAAAAAElFTkSuQmCC"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;#############################################################Batch2 (bug sack) ##################
Create_batch2_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 860 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAAB4AAAAICAIAAABh3dhzAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAIaSURBVChTY5BSVcoqFFu2mnfBUt7CCklFXSURBWVpdaWcErH6NmFRBWUgyiwAKQAjPiCSUFERVVTRMVeobhJZtJyve6KQsa08kNvaLSyqqApEpvYKJdViDLIaSnMX8kUmSZrYS6/ZwBeZKA40WttMYdM2nkdPWCSVQUYr6SrqmMsDLVi6kk/XQgForqqh4vwl/HWtIkBDvYJl9K0UrF3lT57hgBjtESS7dhMvyOg5C/ncA6TFlOQ7+kSSssSARjv5yMxbzL/3AFdsiiTE4UAUkSA1ewE/WLOKd6g0kK2spwRkg5EqdqPnLuKbs5C/o09gwxY+KxdZoNHVjSI1TcLFlaLbd3PDjFaBGQ0yKzVPvK1HWFwZZCgEAY0G+rKxXQSI5iwUgBm9kK+8TiQuTWzLDl7fMCmg0Tv3cvmGShvZKHz+zKRtqoBpdHq+eHsv0GiouRCjr99kC4qWBqKKejGUABGRV2jpEk3PFzW1l/v9h/H9B+a375h//WJMyxUHmgs0Dtlon1CZxcv5VQ2AAaIqpgQ1GluALOSraxVOyhRduEzQ2Veme6LgjLn8miYKQFRRL7JkBZ8EMDJRjdYwVpw+RwCYNuLSJFNzJYxssUWjhIqSX7gUMEDyy0Q8gxSBCSsyScLcUQ4YLECkZqgQmyohqQoy2tBGwTdMBqIZiHTMFZOyJEtrxFKyJTVNlFQNlBMzJSFS2mZKoXHSACpVvqWVp7JKAAAAAElFTkSuQmCC"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}


;##########################################################################empty bag RQ one checker########################3
Create_empty_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 1288 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAAB0AAAAdCAIAAADZ8fBYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAANZSURBVEhLddbpUlpBEAVg3kAUFAlLwBXKfTdxidEq//v+L5PvzsELIjlFdXq6T5/p6RkMjY+Pj8FguLm5tfqztbW93f3R6+EMhtWn1+t3u92tTmeZufC5v79vbHe7h4eHZ2dnp5/gBxcXF3d3d0js7e3tzc3N9fU1y4erq6sZr2BWfHp6dHQ0HA4ba2vNk5OTp6enx8dHNk58lqJ6G7BE4fLyMkuph4eHkCF8TZyfn+/s7FS6x8fH9g8b6sqoBFR+FdTBRfLiUstzXWVCbIBqJ07YoBGiGqSbCEckDiaCkv/qpp7DZqCcGr8L4kvx8Wvgr9a1oXREtYYHHMtUBuRMMykQCcFORNzWsm6Ony5SYPmnIEv25eXlb4ES6lXnBcqDL7pJpFO6bpaEJXBy3XRZe7A4UtlJ1lKhExCZz8EOom4Az1kgl5bepcTzhrKBVM4UDjklrCVdb7noNpsUEwLpiEIaZ+NE9/n52U6cTAYNH4hEwTB3d3cbzfUNuyUkp0aB4ghFFDIHwcxaBBPEM4paxPdif3+/sbHRylyIRjf1wFefsloXRKDIVrqsPuqW9TuZTBqtVrua6Oc7JZQ2IwFRgTqeJcX4qmLBWPQ7mUwbrXbbPnTro6mHRX8llgh86kSKbulX83RtbnZOhIQRP9AaJD4LFeTNUeTnXVvOdNc3WhmuAeUNqJd+e3tDfX195bDRZd/f30USjBDdbKDcVVW606n3sG7SEHUk0nXjWWozujmTCCSLJqsDbeXSqvdwcFC9X16tq0BlGuQTKiLz9xtdWiCSaWg8ukBtd2+v+r75huSJ5ALz1QBliqnoq9bNOcQFQwMlaqGc/GL+PZajWzqbPViOesUQxdg4CRpoyJYcIkQ/v8dFF0NIs9jpMTwwED5IiUfaUgknTDaimqv/7qyl3+jaGYlVk/tNcRpkwTK3nw0SpEB0sd+5bl0JiomCgboWlyNLzpVCHkD2q4FM+sscslt0WTfA4uUa+ZkDXT1yNCtFN4ToRmR5vkIYgJqZ8AXBNsqIpusEEXJKfl3I//L/mzXGSlQa5Sg6JZ2mYJb+hs9+m+vT6VTL32FnpJVIip1RF+D3zmg0bozH406n0+v3V37Aj6KfMBqVf4rjh9pg8IXZW/D7/Xa7/Q8uxvdN6/dwDAAAAABJRU5ErkJggg=="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;############################################################# Wait character -----------------------------------
Create_waitchar_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 24212 << !!A_IsUnicode)
B64 := "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"
B64 .= "aHyPl+gQVqgyJ9lQaMaU86mwcNmWIKyozNElCsQC0CGZFcmsDoRGLG4LaAaX3Hm5zO5d09MqWNI4jVBMi0X6TwmFYkYoZbCUyiiIRguZBTCSMpKbInBBYEKuQ/+dWKWYLBdTlWJWrBZgMJoCj8mrIijJSuW8UoXBIEihek8LBbwEN/yOOo1hh/fVqCu7KDgbhokoiwrIQ+2AugAlEqp3bHdpIIvfoKYRUl8PDKozcTkoL4arIzthscCD7ZssE0JOjXWkR+i44AagUKBhiQ7ybhLoMfn9ahq6rbPhV6DQG8BgxJBACYl2YLiwEf1w1gFBQIelJAyfi1yeWSNiWQ3it8q5k/UGcLHSYxcMsZvS7LPwEdEdJa7oNDps7LHbcHszNwArfTT7dHgVY4igAT0wPNgVXTGyZ1Tp1PHoGtIoIiu/Q6F+dB2aLjJ4RNjSUiO55PsHQlM2hKKGdhXpCQRNzCsViEGTo9uTIkiq5tmP04zm03MSE3OSE3MTEwuziEQztCiXHSvkxosFUJUolybKxYlSYaKYG0OKk0tNlLIAKEeT1eGoBE1kABE0dJvNM82GgTwOVYOBmsWTdB8rukmlFvoZjc27CBZN7KlKSFeRciLTrJtIk5n/k4XQMRuhzHrA4hTFI4sJlJDNRAo9hro1C3+UpmCFdXG6O0EhCUlPnW50cw/rY472pz+xRIe9kQ328+PUSDwZ7+3GzpAzRNxgB+wcToiBpnEJoeH3p7BkDxXQzFF6GU6CZlPGGLv8/CkPYx7Gbl+AKsBEp2EbATqeh+30Rhrv7hObnzoQGs8qjORSg+cIIzktG3LFQPmgVuiX9yQkrew5FbRxhe5KarQlrwpo+3nJifmpiUVZJD1pBC8sx/OpsXySbjsUkqN5lgZlEzyDXphNkjKJRbmJ8UKC/odVtSI6mhLgEvOZQSS0GQBC5Y9QonjIBnRv0vZRKaA0aBlmHTUhahnig24IoA+1YU5oCWSRlDXDTtjdK+pn/Kr1Zx6RsKWXgsz8E7gJ288x4EkIcCjgUbQjx+LpuS2TmZsI/wrdIUcz0D0yuokDV6BpCTQzgd9WjCyK21VoXVzclhjHvhHAmfCJZEKEMp0VRcbQZugIdEz+wADNEKU7lyEukM/k0S0O/rmDxYjnoTDw2nV6V/8TFJPT89uHQpNJDn6EBcQAlKoli67OpkZIZVMtaAJbikWaaqNWLR1hZV4KHCQS5Qz90IRGcyeYRQkFFVZEP6HFHqgjIdWtmjKsi374iP2IX9XSuCQXWQganm7S8rusSG5w+fgKHAh1r+JUzIaCohHceF3H6SChQe1K412Gr5vIb9B7qNOjWqFhLkob4cM9aKirMTgAChdrlWmSoo3YDRixu77hRr7dpkoKWRFqN6rGURABKbprEz7qwGd0T7dlrLU2JmYhlLIAVrrFy6Z00WkwYmZAQ8dnM636oQm54Zpx5BniyJLfwI18/hxFhMssDYUmPTE4PPHYBFwERy3R75ZXQQyav8h+LA1mQ79+pQmpan5hZmKimMpJJbwEKwwaNrvPAB8ggx6AoonGNAsdmSk4gKuH999BA09len8KRS9ZRsxf4u2SrUjUs8uyXdF80WoabhfG40Ju10LRaNbgLii4RMp74D11O7x1zG7ghVMjejeobTbeDVcjobu3mcOR+pqn3XJaTRJrUdZ41IR4L4ogGWaG1IocDtBErTKtGXOTmT3QXCreibs0cbM37ZfjxQkjf2LzNVk+RDGR5gTCdeh2PeVVbJ8Zmv7EjYseioP50XenO6ZIBF26F7v50BiFkdT44KcRAAHyX+SqaHW4BZs6A9sQYCegJy9XkpU8trNiKoXaCuswJ7ozZeuiSzeqZP57IpTW8aDDbr7TsgHXRWdSKe2le1scGi7sj9CAJW33LIlmJdPEZFxBNDkSSWS1SHIRmDRfshqa2zH9KRfyJuE9ptVErkOjmXyE0G4hp+NpMoQVum/M7iGHxsNuskSNgfYj0cy3Xm+mdQoHLf4wogt64DqU4VIqg0ZlTjOjeSCAMqMBeobfez4m5IajE4oFHRZ3WI7Sbro4Mbodze5LE5q9iT6zPy5MZeLbey6Ft9CjZ2SrlITBicmGEdDBDXvoou9UI00OgcYsjCRGtxoIDVKNnEg1Dv0WsFLNVAtZsZijyVaohopZoYCAxX9nhNU+ZdhS1VJADJqZIGC4IJtjNSpN0cB3QPQBEAwOUMLcBZSwZUQMtxnFN+FAsmsCLNiSiSwBV5m+TMufxFXwkPwrjiSaJdkuG4HktHR/0vGnPH/Kp8jVMs2aonqiFih63UCxQBMSwiIC0YoSoB5JVHT02gMXmkIMa0tuAEQPWpQ3MInaG82JOILzNFRKxt0+8riaDvkKoTajGSBAg4NwhrDkL6Mt/cIW9lk+2rWXr3AhEWFxFiHMMakO4E95IkSyOg7pM0VSH6JRdTYNg2I3zUxC4WYZgUH32yEfKYGDmBh+0/AKT2swNCw8Df7VCOQoYAKIULFdpd8qT5TSWCISjRdS9B+0COyXzIVCSUNxT6yI9BsiGn+4iQbEwsnMlOgRCr7JBrimTSUSNxvEL4pi9NQmPbgJITdEm/lTi3tfI3pAiZ4vcbsgEsFLl1xBsivIeIxAdJqa17EobDHvsZoauzujmjWgQ7jw4tNms7d4mdovl5aUoPC+66HN0PC8dXsiM6BnPnzN05ERo8hHBEF/YJe+B02YZCAq9ab38q+AFUKhbwvWQxbD44fb+0XnAHrYk3j07GPD6SKSoggytZpBM3VQP/N6nk93p4KRlXsonaicBlX0jUiMKhqeoDKK13RI4XnaV0MsRp+JTngoNKXckDnCNI5C2StCEtYLCi0RoRCzELngPUVdpCRGE+EuYAKmotcDNUD+QRFHAxzwG/YYAz3vgsSFcpppYqYpYXyQrxBVNEGVxhhQo9Y9dGj0M3qQloklblQKYomORV1wkkYp0MyUZLgyDWjaJc2rmDUR3oN82Z+0UXM5bQP0mDQXDLmOST0PtTqbBMPNn2U8vtv2/Y7v8Ul6zHh61xofF15KChz0mAicxtMDi90NoHFepB3o5SiaWPFCwJErkE/0gIBCAvq28HVuNpH49mjn/nWGINXYXQR6nAO8GV0UJ0DnAEpoHiCyFmKCuQ77Fj30WZDFleRfijItWuFTybAzvQU8tWpuC1+Ees5QaIb9fBqVTnZU4OiCbZAcdGukLNiicmiwotH/b4CzpOQfUYkqZHavh54tAjEuCzRe6DHEio+X7DgOyhA+MktvZ37eoSvShgPjy9AgRM9duMHgZc/w6VJiI390sstSARSTnoGS20OdVVbsku5X7YbidQx/Et5jex3U6qbdNKw6Si0SdjbQRxs2JYYNAmg6ASLLiWIWiWINfQq1Fo0s+/B8x6p7No0EojinAWhcARDm8+yHzn9mZtOvGA1cEUARN3wjX++9RD6LYhDE0JgCoi1lPIySvrPtE7kdfy8DDisEENvCVkjUG9kgIfavuwwddIyB0LhGbkQRJgZCg5KY31MUHBKfhCV7tkI+gaAAb2SFaItG4RCPOBBsyaMMWGFP1pEII2YnWEd1zZ7a9HCV0TA4+0lWU3TCHHA6FYhY2TwBNdiGESBsCzS3y6+aTRU5MqIVC1ue33XdNmor06jp7H4NDerQiG0NzTD97FKPG7r0rFMilWnSnNyaze8jGjULBVpvYNBFXky3UQMTG8kjudMMSzPfnCZbsAEcn40s2ITLYFBCsYvZ//a+9X5hOwk705RWGmVmX3kgNKY0MWIog//jUxVRhgUa5hCghMYt6ElP9tsWbII7ZbV0c2e69sH+FGiYQj6ADoBjZsPCVg3FFJwQ5xeaBMigB+LbNDnS54MHsa+0eWL2Q46F8hXFgq35Kk2RoRkkolFX7HZYq7NZBEiZkTmZKLXCe+Y+3TBHJ6YYz7IB6nkQYkETWNB8DD1AjYZ8qM6f8ifQWfDCVcZb8F7+eBQSBSpraaSfogOFhrBV6F3TmmJi69Tp418nEvUfvBfU0mBjDekLIlHI9Cyx1AQdknvM5omdBlUDg0eETWVixNZyA6HhM/dQKjN/w1dC07bxEqYC9SwnEpXHzD+4x5gIPRDSHbgUWEHGg3ob3g7wWQwikdPSFW/YyNfqNrJURAdgPutrbL7QBixUQy5iPIUPtLemeBLR44tmXXHaiFkeDTFPuk4HvRa5JHyCTXJjN0dZdknZD0KYHmgKu2ms0ROZ4agJZTbsRg+/Vr2bUJQZILdgt5wM2BLdT22ikHGpcsExa+zmPM0BoizVajNRKUSjeZRMkChXjYmlrij1DTbRmJ7VgtnQ/Ut2t6EfGmov4MIVuzKbIrgOC5EDobG05NCZe5T2k5vRM73wBspFGBZkJ4hBESs00EITVjgrKnCx1LIhlQ2RDfL6BAp1NVpSpyRQOnAC1nVY75niiQIAZU9fs4dR0Ngsz32T3g6PZaUQixGh6h7d0QTxOFVFtKuKS1OSUZyjSvenav5k4HUdt2UYgcymWVUkNlWAhJeOqLqy7ms0ykzPUvlc04+J9LbQgHKr4ZIQRwJYAs2PofumMDxFhZMRNLAxZE78dyRQXbI7CaiTuXMw7GhYhQQocVjUOKiJkEKRACJN06HDqooDgNhsJHxuCA2l7YTLsGC0yRoMjZoeqRYHQ4OEQ6cfQnMQpzgQkThAWIl8pZe+IFnWy4YsOcgxHXx5anhqe0ScKLqz8NELTH1bOENc1Oo0Xskyf27v/GtsgrBn+FMPkchvKPbTEutOK0Dyq7iyYBZFswg+zLqGUOXBeAgguB2SEjiEoQWqQpOLaR4ur1BoQI+lPuym5gCh8ewm7K3pt9lgDw1NeXweFuphm3sJhQ8m9ttBvcaOier2WRvDsWngxXMpBCkdQd9jB6cnvJCLsGyXQTMjoekXZTCzNs7SQGhojrBcGX3w3ttXrVj63rkzoFF8R/YcxQMfNk2VmiXZtRRaUpUEy6EiCKr76F5Bpxl0W8EU1A6mOsFUd3M0yRSCRbkCq6TYl3zDQxFwRNhkCyfAqhgqLFk+G4oXk2hLlDzM6hU2p0QCFmbDdNvIdQJ/qh5M1WE/XheRCIigIlNUulUp0ZRQxAXfMgIbDcaeTaRsj6t3fxEpMz6aPJXCeqdFT6NRfo2qBN2AGhWm28PiTxD9HAeCO91vpxQHFx+8htkMTJ2iBM4hmMR1mylsmb0xrpnQzJ0AJEDFVpMjojD64OcYNDOdRnYJmo1IC3yjXjMbKOvp8RybOaeDwqGF4EJtHCyerC2e+tO0GACh03ht+hkEQFCb6tamZh8WW7hmbAyQa7ManttVJB8GjsuNC11Dpe07FERcmtqH+p9G6ujHR7xuAG5qixsQVhg9Fs1idiTJRmKkqK6O/o2cFNywO1b05D1rwjo9s4glbQSybURk4qZVR7uCHsoxqS3Z9jcW/XqD1+36bIl1tqX31757HXRTnRyoQTMM2+ybUg5APbDv+mye4k4DaD53u6ElRoTigP9Qo92oyQ4ymDgoio+LS+UP4TzZrS3GZSUFk37QccjS6XEQdseHHjqksFJb3Kktxp44iak3JXAzBSenoXF2qwgQsAsxvUNP/OWS2uKlPS2pTS0myCY7JACHCwEDg/2g0zeBO4GIPket2Gnjolv1QAtcundBCazjdfxgssa+I9HjT9bcDnILmKsmOQok048HIGWm/w6C5hGjxqz5Rs3XuerwAGQncAVqVKtew/GtBvHEg0jA4sgsgIDFpD/JHBcnTMK3W4JlsHiKXqIjTU563UnGUN8b+VcgVwPHdP3xZXsXfxM1xUVXabLVbtZmQBOFpwHV03nnNIKmBGhcxCZU1HSfmX46uoWEoOW1mwZNhFYoD6ACxJ9GZ3EtQELQoVs/doPocVue36kFk43aVLu2GAJA0CQ1ZKTeifYp4oBfrKXB1BL0M8orWfzWAwcYzXpXT1PgLBSDBsLGaXEHIhMidUnUj8nJHf57LY2aDnQ8i3mJhZrFJXrwHfGhaAmEyxoqMhRHyENlS5IsWXZ0CtM+0l4vJKYnAyTBkmuBEbiab6NW0Hz4E4MpnHNDmk502FwcFuDoansIdnTfkbJjJnaXnobHIDQKPQqOwGRReIJ30jAjLJM9X6Eh/vbuMNBERxINBCBjY48e82oDosG9cJQvnAfYQqTzgAFgiEHjGtkRO/zvCCk8zZk7d2xswfZThl4ZXTA+hu9voltQj+TTCilTqaFz4CshEaP7pYZR1+ymDlBgNrUp3imREAR8AM1s0LC93XS8dhB0G7XJJhMdpCfmATAtiEIP7xloe8KlZxjLaot38LtL7EbdQLHmqJpnMGhC7KhH9lMYbukSHMzYyUjonKmiwQq2887qEy59bs/W2W/ftRBfjHqADqO4tuIY+ESzZiIK+118O3w03A4XGgU22slCcSSaStVAZq1KNhIgNBtZshp48GZGkqN5OHNdshTRFEVLlB1Fc3WU5XymMxP9bAApsExkzRDV57Sk243U8BatI4DSRGnNoGfXFY2k0RRYiDZqBpzPUzVXhnT2+JLmSlwq5ED4E5sI4KmGr5rsXTiCRsNULOUnqaPJcWAAGIAEwGDQLCVozNRIYOYeuvfTa3ZdMn+bv1u09cgeq3Y4/og9D95nx/e85z1jqQRLCKh+g5GGzUw+D3vAdUfK2bDbSOAN3ZPMQPZaZtB1QQxDB36OtAB9FN+ZHieD8TgtL+jUa6CH1KwxBGOiBJYyD3wuQnIXhswBghvb9ZpdD9wmkpJ2yMfkZK07GTBFWwJYd6Qus/FOB9k0uo5BLWHTdDWKC4AJDt8PTSg2kwb7N+jHOxo1o+Zp9NNx9Nyd7ulWzUZPBTGMHmY8XSQxDoxHslQB6JAABwDSyIFcg+SFQoVMRbJHM+StumVTNEdkd/0uzAxXDG5NafhM1WhQgMYF3kj09kjheyPNPILPhqloQhI9PErPj9poQbdlIlCMJkcBADAADEACYAAPQAJUXG3eiKUjPN1+2H6rTz1yz6984eovPXT1Tdee9dlPX3DzNWcsGp2fzecMywxlbtG7Wr2GRqOj6QEAMAAMQAJgAA9AAlQcexw5TfaBe+5Ye+4pX3v0zk9d95HVO4p7rZIO3dc/9tDFF689/pSTj73kkrVr19E/LLfoXSzexGhuNDqaHgAAA8AAJAAG8AAkQMXVEyO2kf3iA5/9ysN3Xn/5qcvawolHrb77to/cdPVpJx614zlnrJrqWlvNndhqXoo0f4ve1eKtPHcCjY6mBwDAADAACYABPAAJUJEq8wFN7vEv3vfST5846Ygd69rW93/m8os/dtzvfv1v++zRPuHYlb6v/sPCPJLnLfpb0cI8Gh1NDwCAAWAAEgADeAASoCKWAY2ee/TBz/3r1+8/+oCpujrn85+56s5bLzrioO3P+/BhZ5159N+9f97fz01s0d+U0OhoegAADAADkAAYwAOQABVNGBvR5fRL659++l8e+cRFJ7a05MG7L77txnNuuOq0dRcct2xpU1dEyzIsS7MtzbT1LXoXC02MhkZzo9HR9AAAGAAGIAEwgAcgASqKMDqiiIl1F53777955T//49c/f/6ZDRuee/XVF1//1SsbXn52/frnNmx4YcOGFze8vP7nL7/w0svPb9G7WGhiNDQ194YXqOlffhYYAAYgATCAByABKqo0NrJ4UpaFpKbkqqUxRUyqYkoREnJ1XKqOiZVRsbxQLM4XSqEQz6aFLcW51cI21fz7K7n3VfJbC4U5UmmeVJ4vVxYqlUVKdVSuLJIqC/GSaZFUXiSVFtABC3Or+TmV/JxybrtSdptiZutSbptKYTuxPE8WFiriqCqOq+KYSivQIrmKj5sjFOeIxblSeYFcHVWEcS65OiZXxqQyNM40IZUmaFlJSJUJsTQuFEerhQXlwvxyfl6JKzcvn9kul9o6l3p/Pvm+fPL9hfQ2+C6KsLD3iTg+vvv8Cs6zMFcozJfKC2VhkVCeX8ptl09tnZ14X2biHzMT78slti6k8RXmlfMLoFJubik/F+/CntiffQU6SakyKhQXlrPzaM/CQqGM086qYkEV6dl2VcwqYkYWUlI1IZbH0RBVOudF1cKoUBgTSuPYiLaQqouk6kJcCkVYgFOla1KeFxOyVLm6QBHxRWLCyUSasR1XG19W7oldfL7PAibah76IMGbrONvEDkvF/w+hEz2qbgDilwAAAABJRU5ErkJggg=="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;------------------------------------------AntiMount
Create_AntiMount_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 1832 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAABQAAAAVCAIAAADJt1n/AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAATxSURBVDhPVct5WJIHAMfx15XbssymTUq7ZnPa8dAKj6yMvCEIBI9Q0EgQUUkUXkQFBUM5RRLxhZkXui01jyzJWuaauTTLsvTp6XC1p+NppXO6gjlLGOvp6Xn6/vX74/cB3L9cx8rkcIQKbkkVWKLnF+v5kuN5R6v5vBJergTMk+XyFQXqZkFVOy9fxeWJc3hF3AJJKguEuboBDFp6pb5B2/JT5cmfdUbTd1BHNdQJtQzoajug+tP6+nO1xl/qTKOG09eqoBNabU1Fhf6YVi+XKz9xdAKKxTKpoVVa2yXXNitVTRpZq1bWplB3qRoHyowDGsNlTeM1TesN9elbcn2nVKEvKVFLiuXCgqJFrusBnlDN1baA4mo+u4yfXSEBWxW5XVx2k6hprLDmtrj8Jr/tCVg7mmf4ldd4NUfdlpNflpOVm5nOWgzzAdJ4SrrUmMbWMJOLaYliXsrxQuaZzKQf2OVDGdqxLOH1zMoJhnSAmVrDqB+hVg/SxMYUpoCckOQI8wVwSbnYbD0WbI1vvFv38DkxqZGJaiZHnSWg2tHpg4TM0UTqVVxSN/pIzwFBDxb8cb+gHZNRGZXA/WyRGxCGZexN0cibLtHOT9L7/0JTTDH76qj7+rC7OkLQPfvJNwixQ+GM66Ga38Hel8yGEaLIFJ7fiiQddXb0AnYgohEECXT2JrF5Zpd0NhbZSUFAytBb4uC+QuRFQegQPfhKoOgFrucNNLXAujqLkQ0iqEb/eIXbkiDAd1vcZr+MnUfOwUtfh4PTB7fX5X3bXh0yYQwer997qyl0XBtyGyGYwneYif0LsefnIpRjXizTJjLk4YwFfOGULcGCPQkXiNlTR5jT8og7ZzCTT/NezeosT4Qzlw48bQu7n5x8L0g9jelewJ00+2keekpurs3qXOsSC2z3jN+NUGSQRqoPTXZRXv3GsP1jtNle2/5vwmorfzOO/0O0+0o8YdxL9HKV6s/VoruwomEPUr37RjoQAEvGrCkV+Pc24R91xj3712CzTb+T9qw223PbDGdOiBzCYe9E7ulHRA9tRDavCtO5YbVwSjEQiBDFEbt1McODlGfTgjnrtF3YvvJY/4mDg0qptG/L2FsZbiKA8ph/bi69ZRIe2eCCLl9KMsCiuEBgVDmHfKombvBy9COz2LzwdsFqtTo6OgIAIJPJ7Ns2a3vIncmOHE3i3MfSBn2DqpYH5q8IFq5ecQCIQEnYSN336AsjhDsvGl5YLJb5+fllTks/YOu81dxnuc59nIruCwnvDOB0rzxkcELmufocBEI8yTQfXj3qxJDqyr3xe1OTk/1nLzp9vsSOfb2/qdHqLWazxWz5e3DWdHA4OvEUpsIUK69xJ4mWwxOAsHUk+ubsKgrU3X6m90KvTCL1gK22yw8lxiUM9A88uPtgOGWgiNgcL2hgiMs2k3krfGOAXZGsdDhHkiqBICglkfpefJy76ypFobql7uQx9DFSUMGGnTQXeLzL1xgAszuNvpUJUnNLS0u91mx4f/84BwcHDBIPVUGKVCl1W0agN87bG7d0UwQQu/UwzZ+eQc1gs9iw5Stdlnzh9Omy9+hdzk7Odr54kSPIBblZ3MMhdOQWgt+m/S6efoCciq9Ij648SpSDqJgIVybJJycFg0f541F+uCgEHoUQgoej0QHYiB2VqnydqkDF4fCoaVmH6KUi1n+q1kyY2LkaHgAAAABJRU5ErkJggg=="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}


;-----------------------------------------------MapRQ

Create_map_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 2612 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;---------------------------------------------TP

Create_TP_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 2344 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;---------------------------------------------md2-------
Create_md2_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 2080 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}


;-----------------------------------------------------------login
Create_login_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 2400 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

;------------------------------------scroll
Create_scroll_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 3004 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAABoAAAAbCAIAAADtdAg8AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAhgSURBVEhLAVUIqvcABgUFQzo9hn2AmJGUrpigwpimyJmozJqqxp6mv6umw7671dXS2dnU0s/Lwbu6t6ytsaGltJyjxZmo1Zit05esx5eou5Kgo4CMZEVPEQgLACYiI4N8fp+PlaCQlaqSmcOSocGTobGZnbetmdXMnuffs+jiw93ZyM/LutDMvtzZ0NvZ0cbDwrOsrqiWnauPmbyPn8WPosaPorSGllcwPgBDNjqPhIeXhYuZh42eiI6xh5Slk5DCupff2r2+u6+2sZfDu4zOxpHMw43Ry47PzKPb1svj3tTj4NXT0s+0s7OalJWZio+rhpO1hZWDS14AQDQ5i3uBjnuBl3mDlnmCrXmLmoiGtK6PysGK3NCPxbySvLN+3dqC9fWb6+uP1tWIzcao6eHE5t/I4tvN39jLzMe9tbKtn5yZlY+PZ1ZZADsuM4FudYptd5Bqd5pqe75qh5V2fq2nn7y3p7WvkqObdb2xasK9aODeeOvqg9rVg6qifb+1hNHFidvPk9vQqNPLuMvEtcC7r7WxqYJ/egA5KS96X2l/W2iLW2ujW3PDWH2LZXCYkovCvK7r4s+moIisn1fXz1Tv7XDo5XHGum/g0ZHTyKGgmHawqGHDuGG+tni/t5O+taS6s6SSinkASCMwe09egUxejEpgsUlsvURue1Zg2M68+O7Y6N/CoJVclIlFmY1JmYxDuqxKnJFTqJpU38xu6NiO1MeXm5R+n5lhoJlaoJleopuFa2NVAEscLHVBU3o9UoY4U602X7EzX4RjaPLnz8q+no+DQZaHMJyNOIR5QY+CMuDbO8W8c6CXdYuCSrerPuDXUOfgica8kJePenFsUWFdTG9mVQBGFyd3MkqBLUqIKkq9JlqdJk+fj5C9spOGeTqwnC+2oSeCdi5bVC6MfSPe1THn3Hrh07XHu5ylnmibmi+6vTXS0FLQy3N/dl5RTUZwZ1UAQxEifiVEjSFHkx1FvxpTdCQ9m5aPiXswsZ0w3cEojHsgYFYxVUwojHka18g00cdY5tWy69u66tq3zb2dZGBCiIcks7MzhX1PbWRTem1VAGENKoUdQZ8XRq8USo4RPE8zK2VcKnttH6uWJ5iFHnZnIIl/Zm1iLox7GNTFMNvVSeDPpePRr+DOqtzIotrHoaaZflJMPUA8L3BnU2pjVQBVDydjGzNkES1eDSlJFyiQiICwpIOWiV2IeCaAbw6Lfk+6q45zZimPfRu8qjTDt0HbyZrey6XVwpnOupDWwpvYx6ZqY1UYExQ0IycuJCYATkNEioJ8UUQ3NywmamRi2s+849Kvy7iPiHk3bGE4zbuVt6iHdWclloMkw7BwsJ1Ry7eC0r2P1b+U2MSa2caeyLqbRT40MgsYdBAyWAslAH99dL++s9bPvLKhfaWRaceyiNK9k8Gtf5GAUL6oe864jLGge4BxKqaRRcu1hb2nbcKseciyhNO+k+PPp9vHoaudgiocGWMHJ40JN3kHLgCEhHu9vbLT08fj4M3c0LTHuJbDr4Wtl2qtl2u3oXW2n3OumG6kj1+7pHPCq3jCq3fJsYHQuo7TvpLSvZXYxZ+UhWctFBeJBTN5By5GBBsAWFdRqaOUz8e04tvG8OvX9+zT8eLE386sxK+FmYZhoY1mppFoppBnrphutZ9xvKV2xKt90LmL0byQ3Mef18ajcmNIQxMenQM4bAQoLAMRAHh1baGYg72xmdHDqenew/fw1vvy1P722fzw0/jpyc65j5OCYJyIY7mid7WecbSdb7Ocb6+YapaDX6GPaZKCX0Y8LVkLIpcCNmMCJEICGABZWFKeloK1q5PMwKfdz7To2rzm1rXo17b37M3+++D9+Nz05cTSvpeVhWSGdlSijmexnHLCqnu9pnltYEUkHxgWEA9cASGRATNkASMyARIAU1NOlI17rqONwrac0sSo5Ne659e36Ne06dey7Nu58ObI+e/T/PHV8+jLz72YkYJiaV5Fh3hYp5JsuKN2iXlZHA8QaAAkkgAyUwAcGQAJAGVlYo+Jep6TfbOnj8W4nNPFqN/StOnbvejZueDPrOPSru/dvPbmxfXoyezbt6qbeVhNN1RKNXJkSKOQaId9aRkHC3AAJ40AMUgAGRgACABIR0d4dm+HfmuZjnStn4PDtJfXyKre0LHs3sHx48by48Tn2Lbh0a7byaKznXNrXUJRSDJkWD5vYkiMe1ouLi4iAw11ACl5AClDABccAAoAIgkRJxcdR0E/eHBflYlxrZ6Ava2Nx7eVzb2b08Oi4dKy4dGx28mm3MmluqmIX1M6WE45dWdLal1DYVdCEQ8QPgEWbwAmVAAdPAAVHAAKADgAEz4BFjUIFzMdIkk/OHJpWJmKbp+NaqqXcbmog8W0kcm3k8Owir6qgqWVdWpdRV9UPmldRFlOODQvJxMHCkkBGVUAHUUAGDcAEyEADAAdAAo5ABRPARxQAhw6BhclEhU+NzBzaFSUg2GdimSolW+um3asmG+NfFp0Zkp5ak2Vgl6TgV9cUTsdGhQeAwtPABtFABg1ABIpAA4gAAsAGAAIJwAOPAEWTQEbVwEeTQEbMgISLBEXRjozhHljjX5fjnxalYNgk4FfYFQ8eGpNcGNIaFtCOjIkGAsNQQMYUAAcPAAVHgAKFwAIGAAIAAwABBEABi4AED8BFkgBGU8BHE4AG0gAGTQCEyYPE0I2LmBVQXltVI6CaXdsVU9GMjgxIigiGRYODC4FElEBHUMAFzoAFBYACAwABBAABQAKAAMWAAcxABErAA8jAAwdAAohAAsyABE+ABZDABcmAw4VDQwiHhcyLSQ+OzQ3NTEZFxIQCQkgAgxAARc6ABQmAA0tAA8fAAsKAAQHAAP8jv5Kx8CIbgAAAABJRU5ErkJggg=="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}


Create_ServerBug_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 2828 << !!A_IsUnicode)
B64 := "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"
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}


^x::pause

