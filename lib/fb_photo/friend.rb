module FbPhoto
  class Friend

    def initialize(friend, user)
      @friend = friend
      @user   = user
    end

    def albums
      @friend.albums(:limit => 100).map{|a| Album.new(a) }
    end

    def photos_of_user
      albums.flat_map do |a|
        a.photos_of_user(@user)
      end
    end
  end
end