class UsersController < ApplicationController


	def new
		@user = User.new
	end

	def create
		# get data from the form
		user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		#give the data to the model
		@user = User.new(user_params)
		#save the model
		if @user.save
		# redirect to show or index
			redirect_to root_path, notice: "Signed up Successfully!"
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end
	
end
