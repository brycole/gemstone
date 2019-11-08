## cave opening
	search.cave:
pause
put search

match search.cave You find some
match move.cave You find a dark open
matchwait 5
goto search.cave
pause
pause
	move.cave:
	move go open
	move se
	move se
	move se
	move se
	move se
	move e
	move climb curt
	move ne

	
	
	}
else 
{
	put retreat
	put retreat
	move sw
	move climb curt
	move w
	move nw
	move nw
	move nw
	move nw
	move nw
	move go open
	send .aesry bank
	waitfor stands on a slight rise
	waitfor stands on a slight rise
	goto main.link
}