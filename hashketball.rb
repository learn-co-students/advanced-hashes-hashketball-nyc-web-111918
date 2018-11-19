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
=begin
re-write the hasketball methods,
using methods: .each, .collect, .select, .map,
think:
****** NOTE:
************ methods return value, (is it the expected value?)
************ which method most closely achieves the method goal?
************ how does the method operation correlate to the goal?
************ create comments describing parameters:
******************* what is being passed in to the block?
******************* what are we doing with it?
=end

=begin
num_points_scored takes:
-- :name of a :players
---- ∃_(:name) | { :name ∈ {:players["Player Name"]} }
-- on the :home || :away team
---- { :players ∈ {:home} || :players ∈ {:home} }
num_points_scored should return a integer value :points
-- :points symbol is located in:
-- the players hash of either the :home || or :away team
-- so, we access a players :points by identifying
-- which :players "Player Name" is passed to access
-- the "Player Name" :points symbol
---- :points ∈ { {:players["Player Name"]} }
=end

################### Iterative, level by level approach ##################
=begin
points = nil
******** each block 1 ********
location= :home, :away,
team_data = { :team_name: "", :colors: [], :players => {} }
team_data[:players] == game_hash[:home | :away][:players]
******** each block 1 ********
******** each block 2 *********
team_data[:players] => {
"Player Name" => {
    :number: 0..n,
    :shoe: 0..n,
    :points: 0..n,
    :rebounds: 0..n,
    :assists: 0..n,
    :steals: 0..n,
    :blocks: 0..n,
    :slam_dunks: 0..n
  }
}
player = team_data[:players].keys => "Player Name"
player_hash = team_data[:players]["Player Name"]
points = player_hash[:points]
******** end each block 2 *********
return the points variable updated in each block 2
=end
def num_points_scored(name)
  points = nil
  game_hash.each {
    |location, team_data|
      team_data[:players].each {
        |player, player_hash|
        if player == name
          points = player_hash[:points]
        end
      }
  }
  points
end

def player_stats(name)
  stats = nil
  game_hash.each {
    |location, team_data|
      team_data[:players].each {
        |player, player_hash|
        if player == name
          stats = player_hash
        end
      }
  }
  stats
end

=begin
Copy & Paste ^^^^^^^ only changing the symbol to return
Discussed DRY principles with vicky, and this helps to
really understand why method building helps achieve
that goal, and simplifies code.
=end

def
def shoe_size(name)
  player_shoe_size = nil
  game_hash.each {
    |location, team_data|
      team_data[:players].each {
        |player, player_hash|
        if player == name
          player_shoe_size = player_hash[:shoe]
        end
      }
  }
  player_shoe_size
end

def team_colors(team_name)
  team_colors_arr = []
  game_hash.each {
    |location, team_data|
      if team_data[:team_name] == team_name
        for color in team_data[:colors]
          team_colors_arr << color
        end
      end
  }
  team_colors_arr
end

def team_names
  teams = []
  game_hash.each {
    |location, team_data|
    team_data.each_key {
      |key|
      if key == :team_name
        teams << team_data[:team_name]
      end
    }
    #binding.pry
  }
  teams
end

def player_numbers(team_name)
  nums = []
  game_hash.each {
    |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each {
        |player, player_hash|
        nums << player_hash[:number]
      }
    end
  }
  nums
end

def largest_shoe_size
  largest_size = 0
  player = nil
  game_hash.each {
    |location, team_data|
    team_data[:players].each {
      |name, player_hash|
      if shoe_size(name) > largest_size
        largest_size = shoe_size(name)
        player = player_hash
      end
    }
  }
  player
end

def big_shoe_rebounds
  largest_shoe_size[:rebounds]
end
################### Method Building Approach ##################

=begin
def num_points_scored(name)
  player = find_the_player(name)
  player.fetch(:points)
end

def shoe_size(name)
  player = find_the_player(name)
  player.fetch(:shoe)
end

def team_colors(team_name)
  team = find_the_team(team_name)
  team.fetch(:colors)
end

def team_names
  teams.map{|t| t.fetch(:team_name)}
end

def player_numbers(team_name)
  find_the_team(team_name)[:players].map{ |player_name, stats| stats[:number] }
end

def player_stats(player_name)
  find_the_player(player_name)
end

def big_shoe_rebounds
  player_biggest_shoe_size.fetch(:rebounds)
end

def teams
  game_hash.values
end

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def find_the_team(team_name)
  teams.find {|team| team.fetch(:team_name) == team_name}
end

def find_the_player(name)
  players.fetch(name)
end

def player_biggest_shoe_size
  players.max_by{|player, stats| stats.fetch(:shoe)}[1]
end
=end
