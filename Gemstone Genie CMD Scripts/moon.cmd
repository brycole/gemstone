####################
#UPDATE TRIGGER#####
####################
put #trigger {^@Update Moons} {#statusbar 2 Katamba: $moonKatamba;#statusbar 3 Yavash: $moonYavash;#statusbar 4 Xibar: $moonXibar}

########################
#OBSERVE MOON TRIGGERS###
########################
put #trigger {^You scan the heavens for the three moons:} {#var moonKatamba TRUE;#var moonYavash TRUE;#var moonXibar TRUE;#statusbar 2 Katamba: $moonKatamba;#statusbar 3 Yavash: $moonYavash;#statusbar 4 Xibar: $moonXibar}
put #trigger {^Katamba is nowhere to be seen\.} {#var moonKatamba FALSE;#parse @Update Moons}
put #trigger {^Yavash is nowhere to be seen\.} {#var moonYavash FALSE;#parse @Update Moons}
put #trigger {^Xibar is nowhere to be seen\.} {#var moonXibar FALSE;#parse @Update Moons}


#######################
#RISE/FALL TRIGGERS#####
#######################
put #trigger {^Katamba sets, slowly dropping below the horizon\.} {#var moonKatamba FALSE;#parse @Update Moons}
put #trigger {^Katamba slowly rises above the horizon\.} {#var moonKatamba TRUE;#parse @Update Moons}
put #trigger {^Yavash sets, slowly dropping below the horizon\.} {#var moonYavash FALSE;#parse @Update Moons}
put #trigger {^Yavash slowly rises above the horizon\.} {#var moonYavash TRUE;#parse @Update Moons}
put #trigger {^Xibar sets, slowly dropping below the horizon\.} {#var moonXibar FALSE;#parse @Update Moons}
put #trigger {^Xibar slowly rises above the horizon\.} {#var moonXibar TRUE;#parse @Update Moons}

########################
#Perc Moon Triggers######
########################
put #trigger {^Yavash is a.+moon and is not visible\.} {#var moonYavash FALSE;#parse @Update Moons}
put #trigger {^Xibar is a.+moon and is not visible\.} {#var moonXibar FALSE;#parse @Update Moons}
put #trigger {^Katamba is a.+moon and is not visible\.} {#var moonKatamba FALSE;#parse @Update Moons}
put #trigger {^You're certain that Xibar is} {#var moonXibar TRUE;#parse @Update Moons}
put #trigger {^You're certain that Yavash is} {#var moonYavash TRUE;#parse @Update Moons}
put #trigger {^You're certain that Katamba is} {#var moonKatamba TRUE;#parse @Update Moons}

########################
#Phase Moon Jewelry#####
########################

#Set within the black disc of the rope bracelet is the image of a waning gibbous moon.
#Set within the blue disc of the copper armband is the outline of a waxing crescent moon.
#Set within the red disc of the silver necklace is the image of a waning crescent moon.


put #trigger {^Set within the red disc of the.+is the outline} {#var moonYavash FALSE;#parse @Update Moons}
put #trigger {^Set within the blue disc of the.+is the outline} {#var moonXibar FALSE;#parse @Update Moons}
put #trigger {^Set within the black disc of the.+is the outline} {#var moonKatamba FALSE;#parse @Update Moons}
put #trigger {^Set within the red disc of the.+is the image} {#var moonYavash TRUE;#parse @Update Moons}
put #trigger {^Set within the blue disc of the.+is the image} {#var moonXibar TRUE;#parse @Update Moons}
put #trigger {^Set within the black disc of the.+is the image} {#var moonKatamba TRUE;#parse @Update Moons}

##CHANGE THESE TO MATCH YOUR JEWELRY THINGS.
put #alias moonjew look my rope bracelet;look my silver necklace;look my copper armband


#############################
#ATMO Moon Armband Triggers##
#############################
put #trigger {by a miniature luminescent version of the moon Katamba\.} {#var moonKatamba TRUE;#var moonYavash FALSE;#var moonXibar FALSE;#parse @Update Moons}
put #trigger {by a miniature luminescent version of the moon Yavash\.} {#var moonYavash TRUE;#var moonKatamba FALSE;#var moonXibar FALSE;#parse @Update Moons}
put #trigger {by a miniature luminescent version of the moon Xibar\.} {#var moonXibar TRUE;#var moonKatamba FALSE;#var moonYavash FALSE;#parse @Update Moons}

put #trigger {by two miniature luminescent versions of the moons Xibar and Katamba\.} {#var moonXibar TRUE;#var moonKatamba TRUE;#var moonYavash FALSE;#parse @Update Moons}
put #trigger {by two miniature luminescent versions of the moons Xibar and Yavash\.} {#var moonXibar TRUE;#var moonYavash TRUE;#var moonKatamba FALSE;#parse @Update Moons}
put #trigger {by two miniature luminescent versions of the moons Yavash and Xibar\.} {#var moonXibar TRUE;#var moonYavash TRUE;#var moonKatamba FALSE;#parse @Update Moons}
put #trigger {by two miniature luminescent versions of the moons Yavash and Katamba\.} {#var moonYavash TRUE;#var moonKatamba TRUE;#var moonXibar FALSE;#parse @Update Moons}
put #trigger {by two miniature luminescent versions of the moons Katamba and Yavash\.} {#var moonYavash TRUE;#var moonKatamba TRUE;#var moonXibar FALSE;#parse @Update Moons}
put #trigger {by two miniature luminescent versions of the moons Katamba and Xibar\.} {#var moonXibar TRUE;#var moonKatamba TRUE;#var moonYavash FALSE;#parse @Update Moons}

put #trigger {by three translucent spheres that seem to drift about without purpose or reason\.} {#var moonKatamba FALSE;#var moonYavash FALSE;#var moonXibar FALSE;#parse @Update Moons}
put #trigger {by three miniature luminescent versions of the moons Xibar, Yavash, and Katamba\.} {#var moonKatamba TRUE;#var moonYavash TRUE;#var moonXibar TRUE;#parse @Update Moons}
put #trigger {by three miniature luminescent versions of the moons Xibar, Katamba, and Yavash\.} {#var moonKatamba TRUE;#var moonYavash TRUE;#var moonXibar TRUE;#parse @Update Moons}
put #trigger {by three miniature luminescent versions of the moons Yavash, Xibar, and Katamba\.} {#var moonKatamba TRUE;#var moonYavash TRUE;#var moonXibar TRUE;#parse @Update Moons}
put #trigger {by three miniature luminescent versions of the moons Yavash, Katamba, and Xibar\.} {#var moonKatamba TRUE;#var moonYavash TRUE;#var moonXibar TRUE;#parse @Update Moons}
put #trigger {by three miniature luminescent versions of the moons Katamba, Yavash, and Xibar\.} {#var moonKatamba TRUE;#var moonYavash TRUE;#var moonXibar TRUE;#parse @Update Moons}
put #trigger {by three miniature luminescent versions of the moons Katamba, xibar, and Yavash\.} {#var moonKatamba TRUE;#var moonYavash TRUE;#var moonXibar TRUE;#parse @Update Moons}