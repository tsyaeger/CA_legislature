



class Rep

	attr_accessor :first_name, :last_name, :district, :party, :contact_url

	@@all = []

	def self.all 
		@@all
	end

	def initialize(rep_hash)
		rep_hash.each{|k,v| self.send(("#{k}="), v)}
		@@all << self
	end


	def self.create_from_collection(rep_array)
		rep_array.each do |rep_hash|
			puts rep_hash

			party = rep_hash[:party]
		  	party_obj = Party.find_or_create_by_name(party)
		  	rep_hash[:party] = party_obj

			self.new(rep_hash)
		end
	end
	


  	def self.set_rep_party_obj
		Rep.all.each{|rep| Party.add_member(rep)}
  	end




	def self.last_names
  		last_names = self.all.collect{|obj| obj.last_name}
  	end


  	def self.parties
  		parties = self.all.collect{|obj| obj.party}.uniq
  	end



	# def party=(party)
	# 	@party = party
	# 	party.add_member(self) unless party.members.include?(self)
	# end




 #  	def self.get_rep_party(rep_name)
 #  		self.all.find{|rep| rep.last_name == rep_name}
 #  	end



  	 def find_rep_url(last_name)
  		self.each do |rep|
  			if rep.last_name == last_name
  				rep.contact_url
  			end
  		end
  	end




end