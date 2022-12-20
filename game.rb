system("clear") || system("cls")
highest = 0
extra_life = 0
multiplier = 1
accumulated_pts = 0

if File.exists?("log.txt")
	f = File.read("log.txt")
	data = f.split

	highest = data[7].to_i 
	extra_life = data[5].to_i 
	multiplier = data[3].to_i 
	accumulated_pts = data[1].to_i 
end

while true
	puts '		



					TYPEDOWN RB
	'	
	print '				Highest Score: '
	puts highest			
	puts '






					[P]LAY GAME
					[B]UY POWERUPS
					[H]ELP
					[A]BOUT
					[S]AVE PROGRESS
					[E]ND'


	input = gets.chomp

	if input.downcase == 'h'
		system("clear") || system("cls")
		puts 'GAME MECHANICS:
	Type down the word about the blinking cursor.

	VIEW:

	word
	wo_

	You are given 15 seconds to type down all the 
	words you can without flaw.
	Any mismatching input will end your run in the game.

	There are also powerups to help you with the game.
	Please check the BUY POWERUP area buy powerups.

		'

		puts 'Click anything to return to the main menu.'
		input = gets.chomp
		system("clear") || system("cls")
		next
	elsif input.downcase == 'b'
		system("clear") || system("cls")
		while true

			puts '		



					TYPEDOWN RB
	'	
	print '				Accumulated Points: '
	puts accumulated_pts			
	print '






					[E]XTRA LIFE ['
print extra_life
puts ']'
print '					[M]ULTIPLIER [x'
print multiplier
puts ']'
print '					[L]EAVE STORE
					'


		input = gets.chomp
			system("clear") || system("cls")
		if input.downcase == 'e'
			print '		



					TYPEDOWN RB

'
print '				Accumulated Points: '
puts accumulated_pts

print'				EXTRA LIFE COSTS 50 PTS
			Effect: Any misinput will keep you continuing 
			in the game.
			This item will deplete per misinput.
			Do you wish to proceed buying an extra life?[y/n] '
			choice = gets.chomp
			if choice == 'y'
				if accumulated_pts >= 50
					accumulated_pts = accumulated_pts - 50
					extra_life = extra_life + 1
					puts '
			You have successfully bought an extra life.'
				else
					puts '
			You do not have enough pts to buy this item.'
				end
			elsif choice == 'n'
				puts '
			This is understood.'
			else
				puts '
			Invalid input.'
			end 
		elsif input.downcase == 'm'
			print '		



					TYPEDOWN RB

'
print '				Accumulated Points: '
puts accumulated_pts

print'				MULTIPLIER COSTS 100 PTS
			Effect: This will multiply your score 
			per correct answer.
			Do you wish to proceed buying a multiplier?[y/n] '
			choice = gets.chomp
			if choice == 'y'
				if accumulated_pts >= 100
					accumulated_pts = accumulated_pts - 100
					multiplier = multiplier + 1
					puts '
			You have successfully bought a multiplier.'
				else
					puts '
			You do not have enough pts to buy this item.'
				end
			elsif choice == 'n'
				puts '
			This is understood.'
			else
				puts '
			Invalid input.'
			end 
		elsif input.downcase == 'l'
			system("clear") || system("cls")
			break
		end
		input = gets.chomp
			system("clear") || system("cls")
	end
	elsif input.downcase == 'a'
		system("clear") || system("cls")
		puts '		



			TYPEDOWN RB

			DEVELOPED BY: MOHAMMED D. PARAISO
			DESIGNED BY: MOHAMMED D. PARAISO
			PROGRAMMING LANGUAGE USED: RUBY
		'

		puts 'Click anything to return to the main menu.'
		input = gets.chomp
		system("clear") || system("cls")
	elsif input.downcase == 's'
		system("clear") || system("cls")
		print '		



			TYPEDOWN RB

			SAVE PROGRESS? [y/n] '
		choice = gets.chomp
		if choice.downcase == 'y'
			if !File.exists?("log.txt")
				File.write("log.txt","test")
			end
				File.open("log.txt", "w"){ |f| f.write "accumulated_pts: #{accumulated_pts}\nmultiplier: #{multiplier}\nextra_life: #{extra_life}\nhighest: #{highest}\n" }
			puts 'Successfully saved progress.'
		elsif choice.downcase == 'n'

		end
		puts 'Click anything to return to the main menu.'
		input = gets.chomp
		system("clear") || system("cls")
	elsif input.downcase == 'e'
		puts 'Exiting application...'
		x = gets.chomp
		system("clear") || system("cls")
		break
	elsif input.downcase == 'p'
	system("clear") || system("cls")

	if !File.exists?("dictionary.txt")
		File.write("dictionary.txt","test")
		File.open("log.txt", "w"){ |f| f.write "filter\npat\nstumble\ntape\nEurope\nkettle\nshark\nroute\nfan\ntenant\nfairy\nemphasis\naviation\ncampaign\nperform\ncheck\nsalmon\ninvite\nconcentrate\nmutual\nproduction\ncircle\nthank\nremedy\nminimum\nbase\nunfair\ndifferent\nadoption\ndetector\nimperial\npair\nvat\near\ndeadly\ncolor-blind\nsnow\nsermon\nsunshine\nballet\ninject\nrich\nflock\ntight\nrepresentative\ntrap\nloss\ncrisis\nfreeze\nsolo\n" }
		system("clear") || system("cls")
	end

	file = File.read('dictionary.txt')

	dictionary = file.split
	pts = 0
		while true
			setword = dictionary[rand(dictionary.length())]

			user_input = Thread.new do
				print "		



				Scoreboard: #{pts} pts
				Extra Life: #{extra_life}


					
				"
				puts setword
				print "				"
			  	Thread.current[:value] = gets.chomp
			end

			if !defined?(timer)
				comt = 0
				timer = Thread.new { 
					while (comt < 15)
					    sleep 1
					    comt = comt +1
					end
					user_input.kill
					timer.kill
				}
			end


			user_input.join
			if user_input[:value] == setword
			  system("clear") || system("cls")
			  pts = (pts*multiplier) + 1

			  next
			else
				if extra_life > 0
					extra_life = extra_life - 1
					system("clear") || system("cls")
				else 
			  system("clear") || system("cls")
			  accumulated_pts = accumulated_pts + pts
			  puts "		



	You have successfully answered #{pts} words correctly
	You currently have #{accumulated_pts} pts
	"
			if highest < pts
			  highest = pts
			 end
			  print "	Play again? [y/n]   "
			  ans = gets.chomp
				  if  ans == 'y'
				  	pts = 0
				  	system("clear") || system("cls")
				  	next
				  else
				  	break
				  end
			end
		end
	end
end
	system("clear") || system("cls")
end