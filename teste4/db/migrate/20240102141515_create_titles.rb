# frozen_string_literal: true

# db/migrate/20240102141515_create_titles.rb

# Descrição da classe CreateTitles
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
