



class Party

	attr_accessor :name, :members

	@@all = []

	def self.all
		@@all 
	end


	def initialize(party)
		@name = party
		@members = []
		puts self.name
    	@@all << self
	end


	def self.create_party(party_name)
		party = self.new(party_name)
  	end


	def self.add_member(party, party_member)
		self.all.each do |party|
			if party.name == party
				party.members << party_member
			end
		end
  	end

  	


end
