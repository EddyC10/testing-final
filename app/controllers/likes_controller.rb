class LikesController < ApplicationController
  def user_likes
    user_like = Like.new

    user_like.fan_id = session.fetch(:user_id)
    user_like.shoe_id = params.fetch("shoe_id")

    user_like.save

    redirect_to "/shoes", notice: "Shoe successfully liked"
  end

  def user_unliked
    shoe_id = params.fetch("id")

    user_like = @current_user.likes.where(shoe_id: shoe_id)[0]
    user_like.destroy

    redirect_to "/", notice: "Shoe successfully unliked"
  end
end
