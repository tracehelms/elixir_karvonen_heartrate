# Heartrate
Calculates your target heart rate for exercise given your age and resting heart rate. Uses the [Karvonen Method](https://en.wikipedia.org/wiki/Heart_rate#Karvonen_method) for calculation.

## Running In iex
```
$ iex -S mix
iex> Heartrate.CLI.main(["--age", "27", "--resting-pulse", "75"])
Age: 27, Resting Pulse: 75

Intensity | Rate
 55%      | 140.0
 60%      | 146.0
 65%      | 152.0
 70%      | 158.0
 75%      | 164.0
 80%      | 169.0
 85%      | 175.0
 90%      | 181.0
 95%      | 187.0
{:ok}
iex>
```

## Running From The Command Line

Compile into a binary
`$ mix escript.build`

Run the script

```
$ ./heartrate --age=27 --resting-pulse=65
Age: 27, Resting Pulse: 65

Intensity | Rate
 55%      | 135.0
 60%      | 142.0
 65%      | 148.0
 70%      | 155.0
 75%      | 161.0
 80%      | 167.0
 85%      | 174.0
 90%      | 180.0
 95%      | 187.0
```
