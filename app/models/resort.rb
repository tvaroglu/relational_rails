class Resort < ApplicationRecord
  belongs_to :region

  def self.only_true
    Resort.where(active: true)
  end
end
