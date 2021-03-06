require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
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
          :slam_dunks => 7
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
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
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
      }
    }
  }
end

def num_points_scored(name)
  hash = game_hash
  hash.each do |location, info| 
    binding.pry
    info.each do |info, data|
      if data.include?(name)
          return hash[location][info][data_item][name][:points]
      end
    end
  end
end
end


def shoe_size(player_name)

playershoesize = 0 

 game_hash.collect do |team, stats|

  stats[:players].collect do |player, data|



    if player == player_name

      playershoesize += data[:shoe]

    end 

  end 

 end 

 playershoesize

end 

    



def shoe_size(name)

  game_hash.each do |team, details_hash|

    players_array = details_hash[:players]

      players_array.each do |player_details_hash|

        if player_details_hash[:name] == name

          answer = player_details_hash[:shoe]

        end

      end

  end

  answer

end



def team_names

  hash = game_hash

  array = []

  hash.each do |location, attributes|

    attributes.each do |attribute, info|

      if attribute == :team_name

        array << info

      end

    end

  end

  return array

end



def team_colors(team_name)

  hash = game_hash

  array = []

  hash.each do |location, attributes|

    if hash[location].values.include?(team_name)

      attributes.each do |attribute, info|

        if attribute == :colors

          return info

        end

      end

    end

  end

end



def player_numbers(team_name)

  hash = game_hash

  array = []

  hash.each do |location, attributes|

    if hash[location].values.include?(team_name) #if location hash include the team_name argument block_given then iterate over attributes value 

      attributes.each do |attribute, info| #this level has the team_name,colors, and players keys (under attributes), the info is the value of player names

        if info.class == Hash #if info = a hash iterate 

          info.each do |player, stats| #info hash has key of player names and value of stats keys (i.e points, number )

            stats.each do |stat, int|

              if stat == :number

                array << int.to_i

              end

            end

          end

        end

      end

    end

  end

  return array

end



def player_stats(name)

  hash = game_hash

  hash.each do |location, attributes|

    attributes.each do |attribute, info|

      if info.include?(name)

       return hash[location][attribute]

      end

    end

  end

end



def big_shoe_rebounds

  hash = game_hash

  player_name = ""

  shoe_size = 0

  hash.each do |location, attributes|

    attributes.each do |attribute, info|

      if info.class == Hash

        info.each do |player, stats|

            stats.each do |stat, int|

              if stat == :shoe

                if int > shoe_size

                  shoe_size = int

                  player_name = player

                end

              end

            end

          end

        return hash[location][attribute][player_name][:rebounds]

      end

    end

  end

end
