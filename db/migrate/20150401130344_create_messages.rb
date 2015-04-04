class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string "Title"
    	t.text "Text"
      t.timestamps null: false
    end
  end
end
