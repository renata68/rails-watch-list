class Movie < ApplicationRecord
  has_many :bookmarks


  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  before_destroy :check_for_bookmarks

   private

  def check_for_bookmarks
    if bookmarks.any?
      errors.add("Cannot delete movie while bookmarks exist")
      return false
    end
  end
end
