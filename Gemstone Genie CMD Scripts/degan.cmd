put #playsystem SystemHand

matchre boat ^The Degan ties off to the
matchre pier ^Captain.*barks the order to tie off the Degan to the pier
matchwait

boat:
put #playsystem SystemHand
put go degan
boatd:
put info
matchre pier ^Captain.*barks the order to tie off the Degan to the pier
matchwait 300
goto boatd

pier:
put #playsystem SystemHand
put go pier
