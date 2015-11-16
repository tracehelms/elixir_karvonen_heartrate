defmodule CliTest do
  use ExUnit.Case

  import Heartrate.CLI

  test "options for age and resting pulse are parsed" do
    assert parse_args(["--age", "27", "--resting-pulse", "70"]) == {27, 70}
  end

  test "an exception is raised if you dont have the right args" do
    assert_raise RuntimeError, "You must provide integers for age and resting-pulse", fn ->
      parse_args(["--age", "a", "--resting-pulse", "70"])
    end

    assert_raise RuntimeError, "You must provide integers for age and resting-pulse", fn ->
      parse_args(["--age", "25", "--resting-pulse", "a"])
    end

    assert_raise RuntimeError, "You must provide integers for age and resting-pulse", fn ->
      parse_args(["wat"])
    end
  end

  test "target_pulse calculates correctly" do
    assert target_pulse(22, 65, 0.60) == 145
    assert target_pulse(22, 65, 0.65) == 151
    assert target_pulse(22, 65, 0.90) == 185
    assert target_pulse(22, 65, 0.95) == 191
  end

  test "calculate percentages" do
    assert calculate_percentages({22, 65}, 60..65) == [{60, 145}, {65, 151}]
    assert calculate_percentages({22, 65}, 85..95) == [{85, 178}, {90, 185}, {95, 191}]
  end
end
