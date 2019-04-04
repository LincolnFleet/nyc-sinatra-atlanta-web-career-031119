class LandmarksController < ApplicationController
  set :views, 'app/views/landmarks'
  get '/landmarks' do
    @landmark=Landmark.all
    erb :index
  end
  get '/landmarks/new' do
    erb :new
  end
  post '/landmarks' do
    @landmark=Landmark.new(params)
    @landmark.save
    redirect "landmarks/#{@landmark.id}"
  end
  get '/landmarks/:id/edit'  do
    @landmark=Landmark.find_by(param[:id])
    erb :edit
  end
  get '/landmarks/:id' do
    @landmark=Landmark.find_by(params[:id])
    erb :show
  end
end
