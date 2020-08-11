class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def song_notes=(note_array)
    note_array.each do |note|
      new_note = Note.find_or_create_by(content: note)
      self.notes << new_note
    end
  end

end
