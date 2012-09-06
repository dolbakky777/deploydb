class Record < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :deploy_date
  attr_accessible :commit_hash
  attr_accessible :remarks

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

