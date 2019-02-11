require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "You can fill the form with a random word, click the play button, and get a message that the word is not in the grid" do
    visit new_url
    fill_in "input", with: "TOTO"
    binding.pry
    click_button "btn"
    binding.pry
    # assert test: "New game"
    # assert_selector "li", count: 10
  end
end
