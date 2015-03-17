class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :course, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :results, :courses
    add_foreign_key :results, :users
  end
end
