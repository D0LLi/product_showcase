class VotesController < ApplicationController

  def create
    @vote = current_user.ballot.votes.build(:vote)
    @vote.save
  end

end
