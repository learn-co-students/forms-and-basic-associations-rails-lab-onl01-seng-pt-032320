class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    self.artist ? self.artist.name : nil 
  end

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find_by_id(id)
      self.notes << note 
    end
  end

end
