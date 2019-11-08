## Disarm Script
## v.01 by Kalros

$disarmed = false
weapon_name = 'paingrip'

scripts = ['ubermonk', 'bigshot', 'sbounty', 'transcend', 'fbigshot', 'sloot', 'go2']

def toggle_scripts(pause, script_list)
	script_list.each {|s| eval("#{pause}_script '#{s}'") if running? "#{s}"}
end

Thread.new {
  while true
    GameObj.loot.find {|i| i.name == "ora-spiked black paingrip"} ? $disarmed = true : $disarmed = false
    sleep 0.5
  end
}

while true
	sleep 0.5
	if $disarmed
		echo "You have been disarmed!"
		print "\a"
		toggle_scripts('pause', scripts)
		waitrt?
		fput "get #{weapon_name}"
    	wait_until {!$disarmed}
    	echo "You are no longer disarmed!"
    	toggle_scripts('unpause', scripts)
    end
end

    	


