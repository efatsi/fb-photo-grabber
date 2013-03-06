class User < ActiveRecord::Base
  attr_accessible :access_token, :name

  def self.from_access_token(token)
    fb_user = FbGraph::User.me(token).fetch
    find_or_create_by_name(fb_user.name, :access_token => fb_user.access_token)
  end

  def photo
    fb_user.albums.first.photos.first
  end

  def fb_user
    @fb_user ||= FbGraph::User.me(access_token).fetch
  end

  def wall_photos
    album_of_type('wall').photos
  end

  def profile_pics
    album_of_type('profile').photos
  end

  private

  def album_of_type(type)
    fb_user.albums.select{|a| a.type == type}.first
  end
end
