setvariable p basket

start:

put get my $gemp from my %p
pause
apploop:
if $Appraisal.LearningRate < 10 then
	{
	put app my $gemp careful
	pause
	goto apploop
	}

end:
put put my $gemp in my %p
put #parse app done.
echo app done.