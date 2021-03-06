class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"/landmarks/edit"
  end

  post '/landmarks' do
    # binding.pry
    Landmark.create(params[:landmark])
  end

  patch '/landmarks/:id' do
    # binding.pry
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

end
