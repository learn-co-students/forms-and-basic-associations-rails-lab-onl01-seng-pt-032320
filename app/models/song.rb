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

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end
 
end
