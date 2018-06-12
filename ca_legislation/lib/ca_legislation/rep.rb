

class Rep

    attr_accessor :first_name, :last_name, :district, :party, :contact_url, :bills_authored, :house

    @@all = []

    def self.all 
    	@@all
    end

    def initialize(rep_hash)
        @bills_authored = []
        rep_hash.each{|k,v| self.send(("#{k}="), v)}
        @party.add_member(self) unless @party.members.include?(self)

        @@all << self
    end


  	def self.set_rep_party_obj # HOW TO SET FOR PARTICULAR PARTY?
		    Rep.all.each{|rep| Party.add_member(rep)}
  	end


    def self.create_from_collection(rep_array)
		    rep_array.each do |rep_hash|

    			party = rep_hash[:party]
    		  party_obj = Party.find_or_create_by_name(party)
    		  rep_hash[:party] = party_obj

    			self.new(rep_hash)
  		  end
    end
	

    def add_authored_bill(bill)
      @bills_authored << bill unless @bills_authored.include?(bill)
    end


    def self.find_by_name(last_name)
      	rep = self.all.detect {|o| o.last_name == last_name.upcase}
    end


    def self.find_by_district(district)
    	# puts "finding district"
    	# puts self.all.collect{|o| o.district}
      	rep = self.all.select {|o| o.district.to_s == district.to_s}
 		
    end


    def self.last_names
  		last_names = self.all.collect{|obj| obj.last_name}
  	end


  	def self.parties
  		parties = self.all.collect{|obj| obj.party}.uniq
  	end


    def self.find_rep_url(last_name)
  		self.each do |rep|
  			if rep.last_name == last_name
  				rep.contact_url
  			end
  		end
  	end



end