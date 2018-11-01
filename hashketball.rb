def game_hash
  game_hash= {
    home:{
      team_name:"Brooklyn Nets",
      colors:["Black", "White"],
      players:{
        "Alan Anderson"=>{
          number:0,
          shoe:16,
          points:22,
          rebounds:12,
          assists:12,
          steals:3,
          blocks:1,
          slam_dunks:1
        },
        "Reggie Evans"=>{
          number:30,
          shoe:14,
          points:12,
          rebounds:12,
          assists:12,
          steals:12,
          blocks:12,
          slam_dunks:7
        },
        "Brook Lopez"=>{
          number:11,
          shoe:17,
          points:17,
          rebounds:19,
          assists:10,
          steals:3,
          blocks:1,
          slam_dunks:15
        },
        "Mason Plumlee"=>{
          number:1,
          shoe:19,
          points:26,
          rebounds:12,
          assists:6,
          steals:3,
          blocks:8,
          slam_dunks:5
        },
        "Jason Terry"=>{
          number:31,
          shoe:15,
          points:19,
          rebounds:2,
          assists:2,
          steals:4,
          blocks:11,
          slam_dunks:1
        },
      }
    },
    away:{
      team_name:"Charlotte Hornets",
      colors:["Turquoise", "Purple"],
      players:{
        "Jeff Adrien"=>{
          number:4,
          shoe:18,
          points:10,
          rebounds:1,
          assists:1,
          steals:2,
          blocks:7,
          slam_dunks:2
        },
        "Bismak Biyombo"=>{
          number:0,
          shoe:16,
          points:12,
          rebounds:4,
          assists:7,
          steals:7,
          blocks:15,
          slam_dunks:10
        },
        "DeSagna Diop"=>{
          number:2,
          shoe:14,
          points:24,
          rebounds:12,
          assists:12,
          steals:4,
          blocks:5,
          slam_dunks:5
        },
        "Ben Gordon"=>{
          number:8,
          shoe:15,
          points:33,
          rebounds:3,
          assists:2,
          steals:1,
          blocks:1,
          slam_dunks:0
        },
        "Brendan Haywood"=>{
          number:33,
          shoe:15,
          points:6,
          rebounds:12,
          assists:12,
          steals:22,
          blocks:5,
          slam_dunks:12
        },
      }
    },
  }
end
def num_points_scored(name)
  points=nil
  game_hash.each do |team, teamdata|
    teamdata[:players].each do |playername, playerdata|
      if playername==name
        points=playerdata[:points]
      end
    end
  end
  return points
end
def shoe_size(name)
  size=nil
  game_hash.each do |team, teamdata|
    teamdata[:players].each do |playername, playerdata|
      if playername==name
        size=playerdata[:shoe]
      end
    end
  end
  return size
end
def team_colors(teamname)
  colors=[]
  game_hash.each do |team, teamdata|
    if teamdata[:team_name]==teamname
      colors=teamdata[:colors]
    end
  end
  colors
end
def team_names
  output=[]
  game_hash.each do |key, value|
    output.push(value[:team_name])
  end
  output
end
def player_numbers(teamname)
  numbers=[]
  game_hash.each do |team, teamdata|
    if teamdata[:team_name]==teamname
      teamdata[:players].each do |playername, playerdata|
        numbers.push(playerdata[:number])
      end
    end
  end
  numbers
end
def player_stats(name)
  stats={}
  game_hash.each do |team, teamdata|
    teamdata[:players].each do |playername, playerdata|
      if playername==name
        stats=playerdata
      end
    end
  end
  return stats
end

def big_shoe_rebounds
  largest={name: "", size: nil}
  game_hash.each do |team, teamdata|
    teamdata[:players].each do |playername, playerdata|
      if largest[:size]==nil || playerdata[:shoe]>largest[:size]
        largest[:name]=playername
        largest[:size]=playerdata[:shoe]
      end
    end
  end
  return player_stats(largest[:name])[:rebounds]
end
