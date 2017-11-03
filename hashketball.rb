require "pry"

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

def num_points_scored(some_name)
  point_value = ""
    game_hash.each do |location, team_data|
        if team_data[:players].keys.include?(some_name)
            point_value = game_hash[location][:players][some_name][:points]
        end
    end
    point_value
end

def shoe_size(some_name)
  size = ""
  game_hash.each do |location, team_data|
    if game_hash[location][:players].keys.include?(some_name)
      size = game_hash[location][:players][some_name][:shoe]
    end
  end
  size
end

def team_colors(team)
  loc_holder = ""
  game_hash.each do |loc, team_data|
    if game_hash[loc][:team_name] == team
      loc_holder = loc
    end
  end
  game_hash[loc_holder][:colors]
end

def team_names
  game_hash.map do |loc, team_data|
    game_hash[loc][:team_name]
  end
end

def player_numbers(team)
  loc_holder = (game_hash.select { |loc, att| game_hash[loc][:team_name] == team }).keys[0]
  game_hash[loc_holder][:players].map do |player_name, field|
    game_hash[loc_holder][:players][player_name][:number]
  end
end

def player_stats(name)
  loc_holder = ""
  game_hash.each do |loc, team_data|
    if game_hash[loc][:players].include?(name)
      loc_holder = loc
    end
  end
  game_hash[loc_holder][:players][name]
end

def big_shoe_rebounds
  biggest_shoe_player = ""
  shoe_size_hash = {}
  big_shoe_rebounds_value = ""
  game_hash.each do |loc, team_data|
    game_hash[loc][:players].each do |player_name, player_stats|
      shoe_size_hash[player_name] = game_hash[loc][:players][player_name][:shoe]
    end
  end
  biggest_shoe_player = shoe_size_hash.key(shoe_size_hash.values.max)
  game_hash.each do |loc, team_data|
    if game_hash[loc][:players].include?(biggest_shoe_player)
      big_shoe_rebounds_value = game_hash[loc][:players][biggest_shoe_player][:rebounds]
    end
  end
  big_shoe_rebounds_value
end

def most_points_scored
  highest_scoring_player = ""
  point_hash = {}
  game_hash.each do |loc, team_data|
    game_hash[loc][:players].each do |player_name, stat_hash|
      point_hash[player_name] = game_hash[loc][:players][player_name][:points]
    end
  end
  highest_scoring_player = point_hash.key(point_hash.values.max)
end

def winning_team
  score_array = []
  score_hash = {}
  total_score_hash = {}
  game_hash.each do |loc, team_data|
    score_hash[game_hash[loc][:team_name]] = []
    game_hash[loc][:players].each do |player_name, player_stats|
      score_hash[game_hash[loc][:team_name]] << game_hash[loc][:players][player_name][:points]
    end
  end
  score_hash.each do |team, array|
    sum = 0
    array.each do |i|
      sum += i
    end
    total_score_hash[team] = sum
  end
  total_score_hash.key(total_score_hash.values.max)
end

def player_with_longest_name
  name_length_hash = {}
  game_hash.each do |loc, team_info|
    game_hash[loc][:players].each do |name, stats|
      name_length_hash[name] = name.length
    end
  end
  name_length_hash.key(name_length_hash.values.max)
end
