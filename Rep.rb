



class Rep

	attr_accessor :first_name, :last_name, :district, :party, :contact_url

	@@all = []

	def initialize(rep_hash)
		rep_hash.each{|k,v| self.send(("#{k}="), v)}
		@@all << self
	end


	def create_from_hash(rep_array)
		hash.each do |assembly_hash|
			self.new(assembly_hash)
		end
	end
	

	def self.last_names
  		last_names = self.all.collect{|obj| obj.last_name}
  	end


end