class FiguresController < ApplicationController
  
  #SHOW All Figures (Index)
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  #Shows the NEW Figure Form (New)
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  #SHOW the edit specific Figure Form (Edit)
  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    # binding.pry
    erb :'figures/edit'
  end 


  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  #Creates NEW Figure - Redirects to the specific Figure page
  post '/figures' do
    figure = Figure.create(params[:figure])
    figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].blank?
    figure.titles << Title.create(params[:title]) unless params[:title][:name].blank?

    redirect to "/figures/#{figure.id}"
  end

  post '/figures/:id' do
    # binding.pry
    figure = Figure.find_by_id(params[:id])
    figure.update(params[:figure])
    figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].blank?
    figure.titles << Title.create(params[:title]) unless params[:title][:name].blank?

    redirect to "/figures/#{figure.id}"
  end


end






