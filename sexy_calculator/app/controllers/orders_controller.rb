class OrdersController < ApplicationController
	def new
		@order = Order.new
	end
	def create
		# get data from the form
		order_params = params.require(:order).permit(:width, :depth, :height, :distance, :additional_slack, :starting_u, :ending_u, :racks_crossed, :racks_through, :aisles)
		#give the data to the model
		@order = Order.new(order_params)
		@order.user = current_user
		#save the model
		if @order.save
			# redirect to show or index
			redirect_to edit_order_path(@order)
		else
			render :new
		end
	end
	def edit
		@order = Order.find(params[:id])
	end
	def update
		# get data from the form
		order_params = params.require(:order).permit(:width, :depth, :height, :distance, :additional_slack, :starting_u, :ending_u, :racks_crossed, :racks_through, :aisles)
		#give the data to the model
		@order = Order.find(params[:id])
		#save the model
		if @order.save
			# redirect to show or index
			redirect_to @order
		else
			render :edit
		end
	end
	def show
		@order = Order.find(params[:id])
	end
	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to new_order_path
	end

end
