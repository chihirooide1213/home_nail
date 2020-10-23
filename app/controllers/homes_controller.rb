class HomesController < ApplicationController

	def top
		now = Time.current
		nail_ranking = Comment.where(created_at: Time.now.all_month).group(:nail_id).order("avg(comments.rate) desc").limit(3).pluck("nail_id,avg(comments.rate)")
			@nail_ranking = nail_ranking.map do |r|
	      {
	        nail:Nail.find(r[0]),
	        average:r[1]
	      }
	    end
	end

	private
	def nail_params
		params.require(:nail).permit(:user_id, :name, :price, :image_id, :introduction)
	end
end
