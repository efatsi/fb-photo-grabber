module FbPhoto
  class Album

    def initialize(album)
      @album = album
    end

    def photos_of_user(user)
      photos.select do |p|
        p.tags.any?{|t| t.name == user.name}
      end
    end

    private

    def photos
      @album.photos(:limit => count)
    end

    def count
      @album.count
    end
  end
end