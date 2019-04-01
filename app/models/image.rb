class Image < ApplicationRecord
  belongs_to :repair
  belongs_to :sale
  belongs_to :organization
end
