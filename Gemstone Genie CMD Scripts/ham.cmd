include base.cmd

start:
gosub put.1 "throw" "^\[Roundtime"
put health
echo $stamina
gosub put.1 "get ham" "^You deftly|^You pick"
goto start


Fatigue:

100    No message.
90+    You are slightly fatigued.
80-89  You are somewhat tired.
70-79  You are tired.
60-69  You are fatigued.
50-59  You are very tired.
40-49  You are very fatigued.
30-39  You are extremely tired.
20-29  You are extremely fatigued.
10-19  You are on the verge of complete exhaustion.
0-9    You are completely exhausted.

Prompt fatigue:
100    No message.
90+    You're winded
80-89  You're tired
70-79  You're tired
60-69  You're fatigued
50-59  You're worn-out
40-49  You're worn-out
30-39  You're worn-out
20-29  You're beat
10-19  You're exhausted
0-9    You're exhausted