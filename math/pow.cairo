extern fn print(message: Array::<felt>) nopanic;

fn print_felt(message: felt) {
    /// Print a felt
    ///
    /// # Arguments
    /// * `message` - felt

    let mut arr = array_new::<felt>();
    array_append::<felt>(arr, message);
    print(arr);
}

fn pow(base: felt, exponant: felt) -> felt {
    /// Returns the value of `base` to the power of `exponant`
    ///
    /// # Arguments
    /// * `base` - felt
    /// * `exponant` - felt

    match exponant {
        0 => 1,
        _ => {
            let result = base * pow(base, exponant - 1);
            result
        },
    }
}

fn main() {
    // Tests
    print_felt(pow(2, 8));
    print_felt(pow(3, 10));
    print_felt(pow(5, 15));
}