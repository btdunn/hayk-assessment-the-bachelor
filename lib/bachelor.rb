require 'pry'

def get_first_name_of_season_winner(bachelor, season)
  winner = ""
  bachelor[season].find do |season_winner|
    winner = season_winner["name"].split.first if season_winner["status"] == "Winner"
  end
  winner
end

def get_contestant(bachelor)
  bachelor.reduce([]) do |contestants, season|
    contestants << season[1]
  end.flatten
end

def get_contestant_name(bachelor, occupation)
  get_contestant(data).find do |contestant|
    if contestant["occupation"] == occupation
    return contestant["name"]
    end
  end
end

def count_contestants_by_hometown(bachelor, hometown)
  hometown_counter = []
  get_contestant(bachelor).select do |contestant|
    if contestant["hometown"] == hometown
    hometown_counter << contestant["hometown"]
    end
  end
  hometown_counter.length
end


def get_occupation(bachelor, hometown)
  get_contestant(bachelor).find do |contestant|
    return contestant["occupation"] if contestant["hometown"] == hometown
  end
end

def get_average_age_for_season(bachelor, season)
  ages = bachelor[season].map do |contestant|
    contestant["age"].to_f
  end
  total_age = ages.sum
  number_of_contestants = ages.length

  (total_age / number_of_contestants).round(0)
end