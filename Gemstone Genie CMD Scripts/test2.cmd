debuglevel 10


var skills Sorcery|Augmentation|Warding|Utility


echo %skills

eval skills replace("%skills", "Sorcery|", "")
echo %skills