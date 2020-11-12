class VotesController < ApplicationController

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      flash[:success] = "Vote successfully created"
      # redirect_to root_path
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Something went wrong"
      # redirect_to root_path
      redirect_back(fallback_location: root_path)
    end
  end
  

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_back(fallback_location: root_path, notice: 'You disliked the article.')
    else
      redirect_back(fallback_location: root_path, alert: 'You cannot unvote post that you did not vote before for it.')
    end
  end
end
