class PhotosController < ApplicationController

  def wall
    @photo_type = 'wall'
    @photos = current_user.wall_photos
    render :partial => 'show_photos'
  end

  def profile
    @photo_type = 'profile pictures'
    @photos = current_user.profile_pics
    render :partial => 'show_photos'
  end

  def friends
    @photo_type = "friend's pictures (Fatsi's only at the moment)"
    @photos = current_user.friend_pics
    render :partial => 'show_photos'
  end

end
