class UsersController < ApplicationController
	def index
		@user = current_user
		@favorites = Favorite.all
	end

	def edit
		@user = User.find(params[:id])
	end

	private
	def user_params
  		params.require(:user).permit(:last_name, :first_name,:last_name_kana, :first_name_kana, :address, :telephone_number, :email)
  	end
end
