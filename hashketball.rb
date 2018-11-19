# Write your code here!
def game_hash
  game = 
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      },
    
        
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      },
    },
  }
  
end

def num_points_scored(player_name)
  hashy = game_hash
  hashy.each do |k1,v1|
    v1.each do |k2,v2|
      if k2 == :players
        v2.each do |k3,v3|
          if k3 == player_name
            return hashy[k1][k2][k3][:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  hashy = game_hash
  hashy.each do |k1,v1|
    v1.each do |k2,v2|
      if k2 == :players
        v2.each do |k3,v3|
          if k3 == player_name
            return hashy[k1][k2][k3][:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  hashy = game_hash
  hashy.each do |k1,v1|
    v1.each do |k2,v2|
      if v2 == team_name
        y = hashy[k1][:colors]
        return y
      end
    end

  end
end

def team_names
  y = []
  hashy = game_hash
  hashy.each do |k1,v1|
    v1.each do |k2,v2|
      if k2 == :team_name
        y << hashy[k1][k2]
      end
    end
  end
  return y
end


def player_numbers(team)
  x = []
  hashy = game_hash
  hashy.each do |k1,v1|
    v1.each do |k2,v2|
      if hashy[k1][:team_name] == team
        if k2 == :players
          v2.each do |k3,v3|
            x << hashy[k1][k2][k3][:number]
          end
        end
      end
    end
  end
  return x
end

def player_stats(player)
  hashy = game_hash
  hashy.each do |k1,v1|
    v1.each do |k2,v2|
      if k2 == :players
        v2.each do |k3,v3|
          if k3 == player
            return hashy[k1][k2][k3]
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  most_rebounds = 0
  hashy = game_hash
  hashy.each do |k1,v1|
    v1.each do |k2,v2|
      if k2 == :players
        v2.each do |k3,v3|
            playa_shoe = hashy[k1][k2][k3][:shoe]
            playa_rebounds = hashy[k1][k2][k3][:rebounds]
            if playa_shoe>biggest_shoe
              most_rebounds = playa_rebounds
            end
        end
      end
    end
  end
  return most_rebounds
end
  






