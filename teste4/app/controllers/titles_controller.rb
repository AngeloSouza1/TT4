# frozen_string_literal: true

# app/controllers/titles_controller.rb

# Descrição da classe TitlesController
class TitlesController < ApplicationController
  def index
    titles = Title.all

    titles = titles.where(year: params[:year]) if params[:year].present?
    titles = titles.where(genre: params[:genre]) if params[:genre].present?
    titles = titles.where(country: params[:country]) if params[:country].present?

    titles = if params[:order] == 'year_asc'
               titles.order('published_at ASC')
             else
               titles.order('published_at DESC')
             end

    titles_response = titles.map do |title|
      {
        id: title.id,
        title: title.title,
        genre: title.genre,
        year: title.year,
        country: title.country,
        published_at: title.published_at.strftime('%Y-%m-%d'),
        description: title.description
      }
    end

    render json: titles_response
  end
end
