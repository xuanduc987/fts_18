class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :examination, index: true
      t.references :option, index: true

      t.timestamps null: false
    end
    add_foreign_key :answers, :examinations
    add_foreign_key :answers, :options
  end
end
