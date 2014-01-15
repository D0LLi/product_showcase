class BallotsController < ApplicationController

  def new
    @ballot = current_user.create_ballot
    @ballot.user = current_user
    @categories = ['Apparel', 'Boating Accessory', 'Boat', 'Combo', 'Electronics', 'Eyewear', 'Fishing Accessory', 'Fishmart Tackle', 'Fly Fishing Accessory', 'Fly Reel', 'Fly Rod', 'Footwear', 'Freshwater Reel', 'Freshwater Rod', 'Giftware', 'Kids Tackle', 'Line', 'Hard Lure', 'Soft Lure', 'Saltwater Reel', 'Saltwater Rod', 'Tackle Management', 'Technical Apparel', 'Terminal Tackle', 'Best of Show'] 
    t = String.new( "A" )
    @hsh = Hash.new
    @categories.each do |cat| 
      ary = Array.new
      for i in "001".."099"
        ary.push(t+i)
      end
      @hsh[cat] = ary
      t = t.next
    end
    @categories.each do |cat|
      @vote = @ballot.votes.build(:category=>cat)
    end
  end

  def create
    @ballot = Ballot.new(params[:ballot])
    if @ballot.save
      @ballot.votes.each do |vote|
        vote.save(false)
      end
      flash[:notice] = "Successfully created ballot"
      redirect_to ballots_path 
    else
      render :action => 'new'
    end
  end

  def show
    @ballot = Ballot.find(params[:id])
  end

  def update
    @ballot = Ballot.find(params[:id])
    if @ballot.update_attributes(params[:ballot])
      @ballot.votes.each do |vote|
        vote.save()
      end
      flash[:success] = "Ballot updated"
      redirect_to @ballot
    else
      render 'edit'
    end
  end

end
