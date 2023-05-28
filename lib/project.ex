defmodule Project do
  @moduledoc """
  Proporciona métodos para crear y manejar un mazo de cartas
  """

  @doc """
  Hello world.

  ## Examples

      iex> Project.hello()
      :world

  """
  def create_deck do
    values = ["Ace", "Two", "Three"]
    suits = ["Spades","Clubs","Hearts","Diamond"]

    for suit <- suits, value <- values do
      "#{suit} of #{value}"
    end
      
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
    end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end  

  def deal(deck, hand) do  #{/* devuelve una tupla*/}
    Enum.split(deck, hand)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exit"
    end
  end

  def create_hand(hand_size) do
    Project.create_deck
    |> Project.shuffle
    |>Project.deal(hand_size)
  end
end

