class Song
  
  attr_reader(:title, :artist, :number)

  def initialize(title, artist, number)
    @title = title
    @artist = artist
    @number = number
  end

end