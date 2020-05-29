class AddIndexToTutorialsTitle < ActiveRecord::Migration[6.0]
  add_index :tutorials, :title
end
