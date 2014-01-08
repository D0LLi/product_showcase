class BallotController < ApplicationController
  def new
    @ballot = current_user.ballot.build
    @ballot.user = current_user
    @categories = ['Apparel', 'Boating Accessory', 'Boat', 'Combo', 'Electronics', 'Eyewear', 'Fishing Accessory', 'Fishmart Tackle', 'Fly Fishing Accessory', 'Fly Reel', 'Fly Rod', 'Footwear', 'Freshwater Reel', 'Freshwater Rod', 'Giftware', 'Kids Tackle', 'Line', 'Hard Lure', 'Soft Lure', 'Saltwater Reel', 'Saltwater Rod', 'Tackle Management', 'Technical Apparel', 'Terminal Tackle', 'Best of Show'] 
  end

  def create
  end

end
