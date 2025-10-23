module 0x1::Palindrome {
    use std::vector;

    public fun is_palindrome(bytes: &vector<u8>): bool {
        let len = vector::length(bytes);
        let mut i = 0u64;

        while (i < (len / 2)) {
            let a = vector::borrow(bytes, i);
            let b = vector::borrow(bytes, (len - 1) - i);
            if (!(*a == *b)) {
                return false;
            }
            i = i + 1;
        }
        true
    }
}
