# CSV reader
This project is a basic csv reader which takes a file location and returns a custom csv type. 

## Setup
Adding to your current dependencies 

```sh
gleam add Csv_reader
```

## Example usage

```gleam
import project3

pub fn main() {
  csv_from_file("./filename.csv")
  |> io.debug
}
```
