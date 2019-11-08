## *** Move items from one container to the next
## *** %1 is item, %2 is first container, %3 is second container

gosub routinecommon

var resonance roomrecovery
put #var monitor ""
	

loopmove:

	gosub put.1 "get %1 from %2 %3" "%get.msg"
	gosub put.1 "put %1 in %4 %5 %6" "%put.msg"
	
	goto loopmove
	




















include routinecommon.cmd