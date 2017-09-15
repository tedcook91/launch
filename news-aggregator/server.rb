require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'csv'
require_relative 'app/article.rb'

set :bind, '0.0.0.0'

def array_of_article_objects
  articles = []
  CSV.foreach('articles.csv', headers: true) do |row|
    articles << Article.new(row["id"], row["title"], row["url"], row["description"])
  end
  articles
end

get '/' do
  redirect to "/articles"
end

get '/articles' do
  @articles = array_of_article_objects
  erb :index
end

get '/article/:id' do
  @article = array_of_article_objects.find { |a| a.id == params[:id]}
  erb :show
end

get '/articles/new' do
  erb :new
end

post '/articles' do
  CSV.open("articles.csv", "a") do |csv|
    csv << [array_of_article_objects.length + 1, params[:title], params[:url], params[:description]]
  end
  redirect to "/"
end
