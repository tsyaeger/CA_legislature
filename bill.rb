


class Bill

	attr_accessor :id, :url, :description, :author

	@@all = []

	def self.all
		@@all 
	end


	def initialize(bill_hash)
		bill_hash.each {|key, value| self.send(("#{key}="), value)}

		# @author.add_authored_bill(self) unless @author.bills_authored.include?(self)

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


    def self.find_by_author(last_name)
    	rep_bills = []

    	# puts last_name
      	self.all.each do |bill|
      		# puts bill.id
      		if bill.author
      			# puts bill.author.last_name
      			if bill.author.last_name == last_name
      				rep_bills << bill
      			end
      		end
		end
		bills = rep_bills.collect{|bill| [bill.id, bill.description]}
		bills.each do |bill| 
			puts "\n"
			puts "#{bill[0]}: #{bill[1]}"
		end
    end


end




