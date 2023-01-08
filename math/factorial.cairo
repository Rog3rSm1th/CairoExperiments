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

fn factorial(n: felt) -> felt{
    /// Returns the factorial of n
    /// n!
    ///
    /// # Arguments
    /// * `n` - felt

    if (n <= 1) {
        return 1;
    }

    let result = n * factorial(n - 1);
    return result;
}

fn main() {
    print_felt(factorial(0));
    print_felt(factorial(1));
    print_felt(factorial(5));
    print_felt(factorial(1337));
}