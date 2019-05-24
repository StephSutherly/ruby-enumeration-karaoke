class Song

attr_reader(:name, :artist_name)

  def initialize(name, artist_name)
    @name = name
    @artist_name = artist_name
  end

end
