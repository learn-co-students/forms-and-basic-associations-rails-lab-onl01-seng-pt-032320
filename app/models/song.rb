class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(n)
    self.artist_id = Artist.find_or_create_by(name: n).id
  end

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(n)
    self.genre_id = Genre.find_or_create_by(name: n).id
  end

  def note_content
    self.notes if self.notes
  end

  def note_content=(contents)
    contents.each do |c|
     
      if !c.empty?
        note = Note.create(content: c, song_id: self.id)
        self.notes << note
      end
    end
  end
 
end
