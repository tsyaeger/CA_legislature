


require_relative "../Cli_leg_project/scraper.rb"
require_relative "../Cli_leg_project/bill.rb"
require_relative "../Cli_leg_project/rep.rb"

Dir["/Cli_leg_project/*.rb"].each {|file| require file }

require 'nokogiri'


class CommandLineInterface

	def run
		make_bills
	end


	def make_bills
		bills_array = Scraper.scrape_leg
		Bill.create_from_collection(bills_array)
	end


	def make_assembly
    	assembly_array = Scraper.get_assembly
    	Assembly.create_from_collection(assembly_array)
  	end



end


test = CommandLineInterface.new
# test.testme
test.run