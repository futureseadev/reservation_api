class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :paginated, ->(p) { page(p).order('created_at DESC') }
end
