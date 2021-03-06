defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """


  def create_deck do
    values = ["Ace", "Two", "Three", "Four" , "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

    suits = ["Spades", "Diamonds", "Clubs", "Hearts"]

    for suit <- suits, value <- values do
      #for value <- values do
        "#{value} of #{suit}"
      #end
    end

    #List.flatten(cards)
  end

  def shuffle(deck) do
    Enum.shuffle(deck) 
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do 
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File 404"
    end
  end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end
end
