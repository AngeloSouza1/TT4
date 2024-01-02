# frozen_string_literal: true

# app/controllers/titles_controller.rb

# Descrição da classe TitlesController
class TitlesController < ApplicationController
  def index
    titles = Title.all
    titles = filter_titles(titles)
    titles = order_titles(titles)

    titles_response = titles.map do |title|
      {
        id: title.id,
        title: title.title,
        genre: title.genre,
        year: title.year,
        country: title.country,
        published_at: title.published_at.to_s,
        description: title.description
      }
    end

    render json: titles_response
  end

  private

  def filter_titles(titles)
    titles = titles.where(year: params[:year]) if params[:year].present?
    titles = titles.where(genre: params[:genre]) if params[:genre].present?
    titles = titles.where(country: params[:country]) if params[:country].present?
    titles
  end

  def order_titles(titles)
    params[:order] == 'year_asc' ? titles.order('published_at ASC') : titles.order('published_at DESC')
  end
end
