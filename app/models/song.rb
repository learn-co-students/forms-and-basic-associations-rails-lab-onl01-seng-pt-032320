class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  def artist_name=(name)
      self.artist = Artist.find_or_create_by(name: name)
    end

    def artist_name
      artist.try(:name)
    end

    def genre_id=(id)
      self.genre = Genre.find_or_create_by(id: id)
    end

    def genre_id
      genre.try(:id)
    end
    
    def note_contents
      self.notes.collect(&:content)
    end
  
    def note_contents=(note_contents)
      note_contents.each do |content|
        unless content.empty?
          self.notes << Note.create(content: content)
          self.save
        end
      end
    end
end