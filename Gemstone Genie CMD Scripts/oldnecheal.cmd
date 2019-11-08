    consume:
    if (%heal = 0) then goto preserve
    pause .2
    match preserve significant injuries
    matchre consume2 (head|chest|left leg|right leg|left arm|right arm|left eye|right eye|neck|abdomen|back)
    gosub do health
    matchwait
    consume2:
    var healspot $1
    pause .2
    if "$Guild" = "Necromancer" && $Thanatology.LearningRate < 34 then
    {
    gosub playercheck
    if ((%playercount = 0) || ((%playercount = 1) && (matchre("%players", "Fyrn")))) then
      {
      if (matchre("$roomobjs", "(\S+) (that|which) appears dead") then var ritualtarget $1
      matchre consume (\.\.\.wait|but are unable to discern|but fail to cut its body)
      matchre consume3 (precise motions with your ritual|precise cuts with your ritual|This corpse has already|A failed or completed ritual)
      matchre arrange This ritual may only be performed on a|Rituals do not work upon the undead\.|The consumption ritual
      gosub do prep cf
      gosub do "rt" "perform consume other %ritualtarget"
      matchwait
      }
    }
    consume3:
    send resync
    delay 5
    gosub do cast %healspot
        consume:
    if (%heal = 0) then goto preserve
    pause .2
    match preserve significant injuries
    matchre consume2 (head|chest|left leg|right leg|left arm|right arm|left eye|right eye|neck|abdomen|back)
    gosub do health
    matchwait
    consume2:
    var healspot $1
    pause .2
    if "$Guild" = "Necromancer" && $Thanatology.LearningRate < 34 then
    {
    gosub playercheck
    if ((%playercount = 0) || ((%playercount = 1) && (matchre("%players", "Fyrn")))) then
      {
      if (matchre("$roomobjs", "(\S+) (that|which) appears dead") then var ritualtarget $1
      matchre consume (\.\.\.wait|but are unable to discern|but fail to cut its body)
      matchre consume3 (precise motions with your ritual|precise cuts with your ritual|This corpse has already|A failed or completed ritual)
      matchre arrange This ritual may only be performed on a|Rituals do not work upon the undead\.|The consumption ritual
      gosub do prep cf
      gosub do "rt" "perform consume other %ritualtarget"
      matchwait
      }
    }
    consume3:
    send resync
    delay 5
    gosub do cast %healspot
    