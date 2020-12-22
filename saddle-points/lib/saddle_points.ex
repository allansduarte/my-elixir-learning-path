defmodule SaddlePoints do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    row = fn line ->
      String.split(line) |> Enum.map(&String.to_integer/1)
    end

    str
    |> String.split("\n")
    |> Enum.map(row)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str),
    do: rows(str) |> transpose()

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rows = rows(str)
    cols = rows |> transpose()

    for {row, x} <- Enum.with_index(rows),
        {col, y} <- Enum.with_index(cols),
        Enum.max(row) == Enum.min(col) do
      {x, y}
    end
  end

  defp transpose(rows),
    do: rows |> Enum.zip() |> Enum.map(&Tuple.to_list/1)
end
