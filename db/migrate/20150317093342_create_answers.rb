class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :result, index: true
      t.references :option, index: true

      t.timestamps null: false
    end
    add_foreign_key :answers, :results
    add_foreign_key :answers, :options
  end
end
