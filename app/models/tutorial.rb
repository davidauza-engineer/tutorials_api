class Tutorial < ApplicationRecord
  enum published_status: [:draft, :published]
end
