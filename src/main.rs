#[cfg(debug_assertions)]
const VERSION: &str = "development build";

#[cfg(not(debug_assertions))]
const VERSION: &'static str =
    const_format::formatcp!("{} ({})", env!("GIT_TAG"), env!("GIT_COMMIT"));

fn main() {
    println!("HOLAAA {}", VERSION);
}
