



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


	def self.add_member(member)
    	@members << member
  	end


end
