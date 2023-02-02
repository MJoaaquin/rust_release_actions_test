fn main() {
    println!("Hola, Mundo");
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    #[ignore]
    fn expensive_test() {
        println!("EXPENSIVEE!")
    }
}
