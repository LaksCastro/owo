defmodule ElixirSample do
  @moduledoc """
  Documentation for `ElixirSample`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirSample.hello()
      :world

  """
  def world do
    " World"
  end

  def hello do
    IO.puts("Hello" <> world())
  end

  def hi do
    IO.puts("Hi" <> world())
  end
end

ElixirSample.hi()
