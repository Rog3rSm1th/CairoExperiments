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

fn main() {
    // "Hello world!"
    print_felt(22405534230753963835153736737);
}