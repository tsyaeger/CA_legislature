
require 'colorize'

class Script


	def intro_msg
		puts "Hello. Please select from the below options."
	end


	def options_msg

		puts "\n"
		puts "1) Find representatives by district"
		puts "2) Find representative by name"
		puts "3) Find bills by author"
		puts "4) Find bills by id"
		puts "5) View all representatives"
		puts "6) Contact representative"
		puts "7) View bill details online"
		puts "Type 'exit' to quit"
		puts "\n"

		input = gets.strip
	end




	def find_reps_by_district
		puts "Enter district number"
		input = gets.strip
		if input.length == 1
			district = input.rjust(2, '0')
		else
			district == input
		end
		district
	end


	def view_reps_by_district(reps)
		reps.each do |rep|
			puts "#{rep.house} - #{rep.first_name} #{rep.last_name} - #{rep.party.name}"
		end
		puts "\n"
	end




	def find_rep_by_name
		puts "Enter representative's last name"
		input = gets.strip.upcase
	end


	def find_rep_by_name_msg(rep)
		puts "\n#{rep.first_name} #{rep.last_name}".colorize(:blue)
		puts "#{rep.party.name}"
		puts "District: #{rep.district}" 
	end





	def find_bills_by_author
		puts "Enter author's name"
		input = gets.strip.upcase
	end


	def view_bills_by_author(bills)
		puts "\n"
		bills.each do |bill|
        	puts "#{bill[0]}".colorize(:blue) + ": #{bill[1]}"
		end
      	puts "\n"
    end



	def find_bill_by_number
		puts "Enter bill id"
		input = gets.strip
	end


	def view_bill(bill)
		puts "view"
		puts "\n#{bill.id} - Author: #{bill.author.last_name}, #{bill.author.first_name} - Description: #{bill.description}"
	end



	def contact_rep_q
		puts "Enter last name of representative"
		input = gets.strip
	end


	def view_bill_online_q
		puts "enter bill.id"
		id = gets.strip.upcase
	end


	def view_all_reps_msg
		puts "1) View by name\n2) View by district"
		input = gets.strip
	end




	def exit_message
		puts "Goodbye."
	end


end
