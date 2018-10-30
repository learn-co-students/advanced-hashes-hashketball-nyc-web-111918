# Write your code here!
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def all_players
  players = game_hash[:home][:players].merge(game_hash[:away][:players])
end

def get_player
  player = players.fetch(name)
end

def num_points_scored(name)
  players = game_hash[:home][:players].merge(game_hash[:away][:players]) #Could make this its own method for re-use
  player = players.fetch(name) #Could make this its own method for re-use
  player.fetch(:points)
end

def shoe_size(name)
  players = game_hash[:home][:players].merge(game_hash[:away][:players])
  player = players.fetch(name)
  player.fetch(:shoe)
end

def get_team(team_name)
  game_hash.values.find do |team|
    team.fetch(:team_name) == team_name
  end
end

def team_colors(team_name)
  get_team(team_name).fetch(:colors)
end

def team_names
  game_hash.values.collect do |team|
    team.fetch(:team_name)
  end
end

def player_numbers(team_name)
  get_team(team_name)[:players].collect do |player, number|
    number[:number]
  end
end

def player_stats(name)
  players = game_hash[:home][:players].merge(game_hash[:away][:players])
  players.fetch(name)
end

def big_shoe_rebounds
  biggest_shoe.fetch(:rebounds)
end

def biggest_shoe
  players = game_hash[:home][:players].merge(game_hash[:away][:players])
  players.max_by {|name, data| data.fetch(:shoe)}[1]
end
