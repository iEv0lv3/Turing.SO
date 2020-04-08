class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|

    t.string :subject
    t.text :content
    t.integer :upvotes
    t.integer :awards
    t.integer :type

    t.timestamps

    t.references :user, foreign_key: true 
    end
  end
end