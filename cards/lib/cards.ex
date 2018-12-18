defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    # values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Solution 1
    # list comprehension, two list comprehensions is bad! Need to flattern it later!!!
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end

    # List.flatten(cards)
    # End of solution 1

    # Solution 2 (good one)
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether the deck contains a given card

  ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "King")
        false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # Solution 1
    # { status, binary } = File.read(filename)

    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "File '#{filename}' doesn't exist"
    # end

    # Solution 2
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "File '#{filename}' doesn't exist"
    end
  end

  def create_hand(hand_size) do
    #  Solution 1 (bad)
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    # Solution 2 (mysterious pipe operator :D)
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
