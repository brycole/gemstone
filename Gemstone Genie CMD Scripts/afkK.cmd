debuglevel 10

startafk:
#matchre talk ^\w+ says,|explains,|whispers,|You hear the voice|^You hear the voice of|^You hear a voice
matchre talk2 Stoh|whispers,|stoh
#matchre asks asks,
matchre exit SEND|System Announcement
matchwait

exit:
delay 5
put hide
pause
pause
put stow hammer
delay 1
#put say Gotta rn.
#put say run! Sorry.
echo DONE
put quit
exit

asks:
put gaze
delay 5
put say I'm ok.
matchre talk2 ^\w+ says,|explains,|asks,|whispers,|You hear the voice|^You hear the voice of|^You hear a voice
matchwait 300
goto startafk


talk:
delay 5
put say Yo
delay 10
matchre talk2 ^\w+ says,|explains,|whispers,|You hear the voice|^You hear the voice of|^You hear a voice
matchwait 300
goto startafk

talk2:
put grunt
delay 5
matchre talk3 whispers,|Stoh|stoh
#matchre talk3 ^\w+ says,|explains,|asks,|whispers,|You hear the voice|^You hear the voice of|^You hear a voice
matchwait 300
goto startafk

talk3:
#put say It's fien.
delay 1
#put say fine.
delay 10
put cough
#matchre endafk ^\w+ says,|explains,|asks,|whispers,|You hear the voice|^You hear the voice of|^You hear a voice
matchre endafk Stoh|stoh|whispers,
matchwait 300
goto startafk

endafk:
delay 5
put #script abort all except afkk
pause
pause
#put say I'm out for a bit.
put wave
put south
delay 3
put quit
exit
