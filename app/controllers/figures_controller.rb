class FiguresController < ApplicationController

  get '/figures/new' do
    erb :"figures/new"
  end

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/edit"
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles.build(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks.build(name: params[:landmark][:name])
    end
    @figure.save
    erb :"figures/show"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles.build(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks.build(name: params[:landmark][:name])
    end
    if params[:figure][:title_ids].nil?
      @figure.titles.clear
    end
    if params[:figure][:landmark_ids].nil?
      @figure.landmarks.clear
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
