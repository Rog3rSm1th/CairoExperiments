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

fn gcd(x: felt, y: felt) -> felt {
    /// Return the GCD of two integers
    ///
    /// # Arguments
    /// * `x` - felt
    /// * `y` - felt

    match y {
        0 => x,
        _ =>  {
            let x_u128 = u128_from_felt(x);
            let y_u128 = u128_from_felt(y);
            let x_mod_y = integer::u128_to_felt(u128_mod(x_u128, y_u128));
            let res = gcd(y, x_mod_y);
            res
        },
    }
}

fn main() {
    print_felt(gcd(15, 5));
    print_felt(gcd(72, 81));
}