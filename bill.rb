


class Bill

	attr_accessor :id, :url, :description, :author

	@@all = []

	def self.all
		@@all 
	end


	def initialize(bill_hash)
		bill_hash.each {|key, value| self.send(("#{key}="), value)}

    	@@all << self
	end





	def self.create_from_collection(bills_array)
    	bills_array.each do |bill_hash|

			rep = bill_hash[:author]
		  	rep_obj = Rep.find_by_name(rep)
		  	bill_hash[:author] = rep_obj
      		self.new(bill_hash)
    	end
  	end




    def self.find_by_id(id)

    	bill = self.all.detect {|o| o.id == id.upcase}

    	# puts 'searching ids'
    	# self.all.each do |bill|
    	# 	if bill.id
    	# 		puts 'put id'
    	# 		puts bill.id
    	# 		if bill.id == id.upcase
    	# 			puts "MATCH"
    	# 			bill 
    	# 		end
    	# 	end
    	# end
      	# bill = self.all.detect {|o| o.id == id}
    end




    def self.find_by_author(last_name)
    	rep_bills = []

      	self.all.each do |bill|
      		if bill.author
      			if bill.author.last_name == last_name
      				rep_bills << bill
      			end
      		end
		  end
		  bills = rep_bills.collect{|bill| [bill.id, bill.description]}
      puts "\n"
		  bills.each do |bill|
        puts "#{bill[0]}: #{bill[1]}"
		  end
      
    end



end




