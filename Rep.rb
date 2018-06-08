



class Rep

	attr_accessor :first_name, :last_name, :district, :party, :contact_url

	@@all = []

	def initialize(rep_hash)
		rep_hash.each{|k,v| self.send(("#{k}="), v)}
		@@all << self
	end


	def self.create_from_collection(rep_array)
		rep_array.each do |assembly_hash|
			self.new(assembly_hash)
		end
	end
	

	def self.last_names
  		last_names = self.all.collect{|obj| obj.last_name}
  	end


  	def self.parties
  		parties = self.all.collect{|obj| obj.party}
  	end



end