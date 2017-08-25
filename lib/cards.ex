defmodule Cards do
  def create_deck do
    values = [
      "Ace", "Two", "Three", "Four", "Five", "Six", "Seven",
      "Eight", "Nine", "Ten", "Jack", "Queen", "King"
    ]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

    cards = for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, count) do
    Enum.split(deck, count)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

end
