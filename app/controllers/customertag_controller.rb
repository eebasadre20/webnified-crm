class CustomertagController < ApplicationController	
	def index
		@customer_tag = Customer.order(:name).where("name like ?", "%#{params[:name]}%")
		puts "*********#{@customer_tag}************"
		render json: @customer_tag.map(&:name)
	end
end
