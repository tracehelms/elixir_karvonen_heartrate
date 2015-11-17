defmodule Heartrate do

  def main(args) do
    args
    |> parse_args
    |> print_chart_header
    |> calculate_percentages(55..95)
    |> print_chart
  end

  def parse_args(args) do
    parse = OptionParser.parse(args, strict: [age: :integer, resting_pulse: :integer])

    case parse do
      { [age: age, resting_pulse: resting_pulse], _, _} ->
        {age, resting_pulse}
      {_, _, _} ->
        raise "You must provide integers for age and resting-pulse"
    end
  end

  def calculate_percentages(_, min..max) when min > max, do: []
  def calculate_percentages({age, resting_pulse}, min..max) do
    [ {min, target_pulse(age, resting_pulse, min / 100)} | calculate_percentages({age, resting_pulse}, (min + 5)..max) ]
  end

  def target_pulse(age, resting_pulse, intensity) do
    (220 - age - resting_pulse) * intensity + resting_pulse
    |> Float.round
  end

  def print_chart_header({age, resting_pulse}) do
    IO.puts("Age: #{age}, Resting Pulse: #{resting_pulse}\n")
    IO.puts("Intensity | Rate")
    {age, resting_pulse}
  end

  def print_chart([]), do: {:ok}
  def print_chart([ {intensity, pulse} | tail]) do
    left_string = String.ljust(" #{intensity}%", 10)
    right_string = "| #{pulse}"
    IO.puts(left_string <> right_string)
    print_chart(tail)
  end

end
