extern fn print(message: Array::<felt>) nopanic;
extern fn u128_to_felt(a: u128) -> felt nopanic;

fn print_felt(message: felt) nopanic {
    /// Print a felt
    ///
    /// # Arguments
    /// * `message` - felt

    let mut arr = array_new::<felt>();
    array_append::<felt>(arr, message);
    print(arr);
}

fn factorial(n: felt) -> felt {
    /// Returns the factorial of n
    /// n!
    ///
    /// # Arguments
    /// * `n` - felt

    match n {
        0 => 1,
        _ => n * factorial(n - 1),
    }
}

fn combinations(k: felt, n: felt) -> felt {
    /// Returns the number of combinations of k among n elements
    /// n! / (k! * (n - k)!)
    ///
    /// # Arguments
    /// * `k` - felt
    /// * `n` - felt

    if (k > n) {
        0
    } else {
        // n!
        let factorial_n = factorial(n);
        // k!
        let factorial_k = factorial(k);
        // (n-k)!
        let factorial_n_min_k = factorial(n-k); 

        // Convert to u128
        let factorial_n_u128 = u128_from_felt(factorial_n);
        let factorial_k_u128 = u128_from_felt(factorial_k);
        let factorial_n_min_k_u128 = u128_from_felt(factorial_n_min_k);

        let numerator = factorial_n_u128;
        let denominator = factorial_k_u128 * (factorial_n_min_k_u128);

        // return u128_to_felt(denominator);
        let result_u128 = integer::u128_div(numerator, denominator);
        return integer::u128_to_felt(result_u128);
    }
}

fn main() {
    // Tests 
    print_felt(combinations(2, 5));
    print_felt(combinations(4, 5));
}