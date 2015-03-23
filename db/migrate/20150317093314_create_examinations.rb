class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.references :course, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :examinations, :courses
    add_foreign_key :examinations, :users
  end
end
