class CreateIntermediateones < ActiveRecord::Migration
  def change
    create_table :intermediateones do |t|
      t.belongs_to :user, index: true
      t.belongs_to :messages, index: true

      t.timestamps null: false
    end
  end
end
