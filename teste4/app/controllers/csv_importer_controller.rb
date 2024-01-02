# frozen_string_literal: true

class CsvImporterController < ApplicationController
  require 'csv'

  def create
    file_path = Rails.root.join('csv', 'netflix_titles.csv')

    unless File.file?(file_path)
      return render json: { error: 'Arquivo CSV não encontrado' }, status: :unprocessable_entity
    end

    CSV.foreach(file_path, headers: true) do |row|
      title_attributes = {
        title: row['title'].presence || 'Default Title',
        genre: row['genre'].presence || 'Default Genre',
        year: row['year'].presence || 'Default Year',
        country: row['country'].presence || 'Default Country',
        published_at: row['published_at'].presence || Time.current,
        description: row['description'].presence || 'Default Description'
      }

      Title.find_or_create_by(title_attributes)
    end

    render json: { success: true, message: 'CSV importado com sucesso!' }
  rescue StandardError => e
    render json: { error: "Falha na importação do CSV: #{e.message}" }, status: :unprocessable_entity
  end
end
