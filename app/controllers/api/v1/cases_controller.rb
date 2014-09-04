class Api::V1::CasesController < ApplicationController

	def index
		response = HTTParty.get('https://testco.desk.com/api/v2/cases',
								:basic_auth => {:username => 'sholton311@gmail.com', :password => 'Cat23456#'})
		render :json => response.body
	end

end
