


class Bill

	attr_accessor :id, :url, :description, :author, :author_obj

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
    		# puts bill_hash[:author]
    		# puts "\n"
      		self.new(bill_hash)
    	end
  	end



  	# def add_bill_votes(vote_hash)
   #  	vote_hash.each {|key, value| self.send(("#{key}="), value)}
  	# end


  	# def find_bill_url(bill_id)
  	# 	self.each do |bill|
  	# 		if bill.bill_id == bill_id
  	# 			bill.url
  	# 		end
  	# 	end
  	# end


end
