


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
      	bill = self.all.detect {|o| o.id == id}
    end




end
