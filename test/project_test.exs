defmodule ProjectTest do
  use ExUnit.Case
  doctest Project

  test "create_deck makes 15 cards" do
    deck_length = length(Project.create_deck)
    assert deck_length == 15
  end
end
