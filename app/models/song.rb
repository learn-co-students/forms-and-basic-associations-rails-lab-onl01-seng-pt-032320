class Song < ActiveRecord::Base
has_many :notes
belongs_to :artist 
belongs_to :genre



  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def genre_id=(id)
      genre = Genre.find(id)
      self.genre = genre
  end
  
  def notes=(contents)
    contents.each do |con|
      if !con.empty?
        self.notes.build(content: con)
      end
    end      
  end
 
end
