class CreateDefaultForPublishedStatus < ActiveRecord::Migration[6.0]
  change_column_default :tutorials, :published_status, 'draft'
end
