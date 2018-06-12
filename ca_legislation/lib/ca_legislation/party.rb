



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


	def self.find_or_create_by_name(party)
		find_by_name(party) || create_party(party)
	end


	def self.create_party(party_name)
		party = self.new(party_name)
  	end


    def self.find_by_name(name)
      	self.all.detect {|o| o.name == name}
    end




  	def add_member(rep)
	   	@members << rep unless @members.include?(rep)
	    if rep.party == nil
      		rep.party = self
	    end
  	end


	def self.members
  		members = self.all.collect{|obj| obj.members}
  	end





end
