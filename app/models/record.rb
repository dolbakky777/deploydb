class Record < ActiveRecord::Base

  validates :name, presence: true
  validates :commit_hash, presence: true

  attr_accessible :name
  attr_accessible :deploy_date
  attr_accessible :commit_hash
  attr_accessible :brunch
  attr_accessible :remarks

  default_scope :order => 'created_at DESC'
  paginates_per 3

  class << self
    def search(query)
      rel = order("deploy_date desc, id desc")
      if query.present?
        rel = rel.where("name LIKE ? OR remarks LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end

