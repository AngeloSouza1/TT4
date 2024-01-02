# frozen_string_literal: true

class CreateTitles < ActiveRecord::Migration[7.1]
  def change
    create_table :titles do |t|
      t.string :title
      t.string :genre
      t.string :year
      t.string :country
      t.date :published_at
      t.text :description

      t.timestamps
    end
  end
end
