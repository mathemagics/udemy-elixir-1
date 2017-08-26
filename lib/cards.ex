defmodule Cards do
  @moduledoc """
    provides methods for creating and handling a deck of cards
  """

  @doc """
    returns a list of strings for a deck of cards
  """
  def create_deck do
    values = [
      "Ace", "Two", "Three", "Four", "Five", "Six", "Seven",
      "Eight", "Nine", "Ten", "Jack", "Queen", "King"
    ]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

    ## Examples
        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true

  """

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    divides a deck into a hand and the remaining cards of the deck.
    the `count` argument  indicates how many cards should be in thr hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, rest} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, count) do
    Enum.split(deck, count)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "File does not exist"
    end
  end

  def create_hand(count) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(count)
  end

end
