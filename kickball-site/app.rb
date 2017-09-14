require "sinatra"
require "sinatra/reloader"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

def name_of_teams
  teams = []
  TeamData::ROLL_CALL.each do |name,roster|
    teams << name
  end
  teams
end

get '/' do
  erb :index
end

get '/teams' do
  @teams = name_of_teams
  erb :teams
end

get '/teams/:team_name' do
  @team = params[:team_name]
  @roster = TeamData::ROLL_CALL[:"#{@team}"]
  erb :players
end
