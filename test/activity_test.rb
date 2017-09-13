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

  def test_split_divides_total_cost_by_participants
    activity = Activity.new("Bowling", {"Molly" => 10, "Peter" => 20, "Sam" => 0})
    assert_equal 10, activity.split("Bowling")
  end

  def test_owes_returns_difference_for_split_cost
    activity = Activity.new("Bowling", {"Molly" => 10, "Peter" => 20, "Sam" => 0})
    assert_equal 0, activity.owes("Bowling","Molly")
  end

  def test_owes_returns_difference_for_split_cost_test_negative
    activity = Activity.new("Bowling", {"Molly" => 10, "Peter" => 20, "Sam" => 0})
    assert_equal -10, activity.owes("Bowling","Peter")
  end

  def test_owes_returns_difference_for_split_cost_test_positive
    activity = Activity.new("Bowling", {"Molly" => 10, "Peter" => 20, "Sam" => 0})
    assert_equal 10, activity.owes("Bowling","Sam")
  end

end
