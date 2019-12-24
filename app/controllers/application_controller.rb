
require_relative  '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.create(params)
    # binding.pry
    redirect "articles/#{article.id}"

  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    # binding.pry
    params.delete("_method")
    @article.update(params)
    redirect "articles/#{article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.delete
    redirect "articles/#{article.id}"
  end
end
