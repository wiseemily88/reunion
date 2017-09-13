require 'pry'
class Activity
  attr_reader :activity_name
  attr_accessor :participants



  def initialize(activity_name, participants)
    @activity_name= activity_name
    @participants = participants
  end

  def total_cost(activity_name)
    costs = @participants.values
    sum = 0
      costs.each do |cost|
        sum += cost
     end
     sum
  end

  def split(activity_name)
    number_of_people = @participants.length
    total_cost(activity_name)/ number_of_people
  end

  def owes(activity_name, person)
    split_value = split(activity_name)
    person_value = @participants[person]
    split_value - person_value
  end

end
