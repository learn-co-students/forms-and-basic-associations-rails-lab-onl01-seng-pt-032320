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

  def note_content=(notes)
    notes.each do |note|
      content = self.notes.build(content: note)
      content.save
    end
  end
end
