defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "save creates a file with the given name" do
    deck = Cards.create_deck
    Cards.save(deck, "my_deck")
    {status, binary} = File.read("my_deck")
    assert status = :ok
  end

  test "load returns the saved deck" do
    deck = Cards.create_deck
    Cards.save(deck, "my_deck")
    loaded_deck = Cards.load("my_deck")
    assert loaded_deck = deck
  end

end
