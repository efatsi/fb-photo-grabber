class User < ActiveRecord::Base
  attr_accessible :access_token, :name

  def self.from_access_token(token)
    fb_user = FbGraph::User.me(token).fetch
    user = find_or_create_by_name(fb_user.name)
    user.update_attribute(:access_token, fb_user.access_token)
    user
  end

  def wall_photos
    album_of_type('wall').photos
  end

  def profile_pics
    album_of_type('profile').photos
  end

  def friend_pics
    friends.flat_map do |friend|
      friend.photos_of_user
    end
  end

  private

  def friends
    fb_user.friends.select{|a| a.name.include?('Fatsi')}.map do |f|
      FbPhoto::Friend.new(f, self)
    end
  end

  def album_of_type(type)
    fb_user.albums.select{|a| a.type == type}.first
  end

  def fb_user
    @fb_user ||= FbGraph::User.me(access_token).fetch
  end

end
