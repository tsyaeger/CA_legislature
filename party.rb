



class Party

	attr_accessor :name, :members

	@@all = []

	def self.all
		@@all 
	end


	def initialize(party)
		@name = party
		@members = []
    	@@all << self
	end


	def self.find_or_create(party)
		find_by_name || create_party


	def self.create_party(party_name)
		party = self.new(party_name)
  	end


    def find_by_name(name)
      	self.all.detect {|o| o.name == name}
    end


	# def self.add_member(party, party_member)
	# 	self.all.each do |party|
	# 		if party.name == party
	# 			party.members << party_member
	# 		end
	# 	end
 #  	end



  	# def add_member(member)
	  #  	@members << member unless @members.include?(member)
		 #     member.party = self
		 #    end
  	# 	end
  	# end


end
