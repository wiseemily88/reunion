require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

 def test_an_instance_of_activity_exists
   activity = Activity.new("Bowling", {'Molly' => 10, 'Peter' => 20, 'Sam' => 0})

   assert_instance_of Activity, activity
 end

  def test_an_activity_has_a_name
    activity = Activity.new("Bowling",{'Molly' => 10, 'Peter' => 20, 'Sam' => 0})
    assert_equal "Bowling", activity.activity_name
  end

  def test_an_activity_has_a_particpants_hash

    activity = Activity.new("Bowling", {'Molly' => 10, 'Peter' => 20, 'Sam' => 0})
    expected = {'Molly' => 10, 'Peter' => 20, 'Sam' => 0}
    assert_equal expected , activity.participants
  end

  def test_an_particpants_return_value_owed_by_participant
    activity = Activity.new("Bowling", {"Molly" => 10, "Peter" => 20, "Sam" => 0})

    assert_equal 10, activity.participants["Molly"]
  end

  def test_total_cost_returns_total_cost_of_an_activity
    activity = Activity.new("Bowling", {"Molly" => 10, "Peter" => 20, "Sam" => 0})

    assert_equal 30, activity.total_cost("Bowling")
  end

  

  Add to the Activity class so that it supports the following functionality. Note, it is assumed that the cost of each activity is split evenly between all participants.

You can split the cost of an activity
You can find out how much each person is owed/owes
If a participant paid less than their fair share they owe a positive amount.
If a participant paid more than their fair share they owe a negative amount (meaning they are owed money).
end
