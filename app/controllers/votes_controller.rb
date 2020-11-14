class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      flash[:notice] = 'Vote successfully created'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_back(fallback_location: root_path)
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
