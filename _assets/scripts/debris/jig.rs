use std::env;
use std::fs::File;
use std::io::{BufRead, BufReader};

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: {} <input_file>", args[0]);
        std::process::exit(1);
    }

    let input_file = &args[1];
    let file = File::open(input_file).expect("Failed to open input file");
    let reader = BufReader::new(file);

    for line in reader.lines() {
        let line = line.expect("Failed to read line");
        let parts: Vec<&str> = line.split(&['[', ']', '=', ' ', '(', ')'][..]).filter(|s| !s.is_empty()).collect();

        if parts.len() >= 8 && parts[0] == "master_polls.data" {
            let pollster = parts[1];
            let month = parts[2];
            let state = parts[4];
            let poll_data: Vec<&str> = parts[6].split(',').collect();

            if poll_data.len() == 3 {
                let biden_support = poll_data[0];
                let trump_support = poll_data[1];
                let sample_size = poll_data[2];

                println!(
                    "add_poll!({}, {}, {}, {}, {}, {})",
                    month, state, pollster, biden_support, trump_support, sample_size
                );
            }
        }
    }
}