start:

stalk.listen:
put whisper tera teach stalk
stalk.loop:
if $Stalking.LearningRate > 10 then goto hide.listen
delay 10
goto stalk.loop

hide.listen:
put whisper tera teach hiding
hide.loop:
if $Hiding.LearningRate > 10 then goto skinning.listen
delay 10
goto hide.loop

skinning.listen:
put whisper tera teach skinning
skin.loop:
if $Skinning.LearningRate > 10 then goto tm.listen
delay 10
goto skin.loop

tm.listen:
put whisper tera teach targeted
tm.loop:
if $Targeted_Magic.LearningRate > 10 then goto stalk.listen
delay 10
goto tm.loop
