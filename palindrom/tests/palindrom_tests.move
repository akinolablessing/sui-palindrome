module 0x1::PalindromeTests {
    use std::vector;
    use std::debug;
    use 0x1::Palindrome;

    fun assert(cond: bool, code: u64) {
        if (!cond) abort(code);
    }

    #[test]
    fun test_empty_is_palindrome() {
        let v = vector::empty<u8>();
        assert(Palindrome::is_palindrome(&v), 1);
    }

    #[test]
    fun test_single_char_is_palindrome() {
        let mut v = vector::empty<u8>();
        vector::push_back(&mut v, 65u8); // 'A'
        assert(Palindrome::is_palindrome(&v), 2);
    }

    #[test]
    fun test_simple_palindrome_even() {
        let mut v = vector::empty<u8>();
        vector::push_back(&mut v, 97u8);
        vector::push_back(&mut v, 98u8);
        vector::push_back(&mut v, 98u8);
        vector::push_back(&mut v, 97u8);
        assert(Palindrome::is_palindrome(&v), 3);
    }

    #[test]
    fun test_simple_palindrome_odd() {
        let v = vector::from_bytes(b"racecar" as vector<u8>);
        assert(Palindrome::is_palindrome(&v), 4);
    }

    #[test]
    fun test_not_palindrome() {
        let mut v = vector::empty<u8>();
        vector::push_back(&mut v, 97u8);
        vector::push_back(&mut v, 98u8);
        vector::push_back(&mut v, 99u8);
        vector::push_back(&mut v, 97u8);
        assert(!Palindrome::is_palindrome(&v), 5);
    }

    #[test]
    fun test_palindrome_with_numbers() {
        let v = vector::from_bytes(b"12321" as vector<u8>);
        assert(Palindrome::is_palindrome(&v), 6);
    }

    #[test]
    fun test_case_sensitive_by_default() {
        let v = vector::from_bytes(b"AaA" as vector<u8>);
        debug::print(&vector::from_bytes(b"Running case-sensitive test" as vector<u8>));
        assert(!Palindrome::is_palindrome(&v), 7);
    }
}
