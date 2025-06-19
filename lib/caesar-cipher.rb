class CaesarWriting
  def caesar_cipher(string = '', shift_key = 0)
    possible_letters = {
      lowercase: {
        'a' => 1,
        'b' => 2,
        'c' => 3,
        'd' => 4,
        'e' => 5,
        'f' => 6,
        'g' => 7,
        'h' => 8,
        'i' => 9,
        'j' => 10,
        'k' => 11,
        'l' => 12,
        'm' => 13,
        'n' => 14,
        'o' => 15,
        'p' => 16,
        'q' => 17,
        'r' => 18,
        's' => 19,
        't' => 20,
        'u' => 21,
        'v' => 22,
        'w' => 23,
        'x' => 24,
        'y' => 25,
        'z' => 26
      },
      uppercase: {
        'A' => 1,
        'B' => 2,
        'C' => 3,
        'D' => 4,
        'E' => 5,
        'F' => 6,
        'G' => 7,
        'H' => 8,
        'I' => 9,
        'J' => 10,
        'K' => 11,
        'L' => 12,
        'M' => 13,
        'N' => 14,
        'O' => 15,
        'P' => 16,
        'Q' => 17,
        'R' => 18,
        'S' => 19,
        'T' => 20,
        'U' => 21,
        'V' => 22,
        'W' => 23,
        'X' => 24,
        'Y' => 25,
        'Z' => 26
      }
    }
    letters = string.split('')
    letters.map! do |letter|
      letter = lowercase_translator(letter, shift_key, possible_letters) if possible_letters[:lowercase].key?(letter)
      letter = uppercase_translator(letter, shift_key, possible_letters) if possible_letters[:uppercase].key?(letter)
      letter
    end
    letters.join('')
  end

  def write(string = '', shift_key = 0)
    string = string_set_up while string == ''
    shift_key = shift_key_set_up while shift_key == 0 || shift_key > 25 || shift_key < -25
    caesar_cipher(string, shift_key)
  end

  def uppercase_translator(letter, shift_key, possible_letters)
    new_value = possible_letters[:uppercase][letter].to_i + shift_key
    if new_value > 26
      possible_letters[:uppercase].key(new_value - 26)
    elsif new_value < 1
      possible_letters[:uppercase].key(new_value + 26)
    else
      possible_letters[:uppercase].key(new_value)
    end
  end

  def lowercase_translator(letter, shift_key, possible_letters)
    new_value = possible_letters[:lowercase][letter].to_i + shift_key
    if new_value > 26
      possible_letters[:lowercase].key(new_value - 26)
    elsif new_value < 1
      possible_letters[:lowercase].key(new_value + 26)
    else
      possible_letters[:lowercase].key(new_value)
    end
  end

  def string_set_up
    puts 'What do you need to encrypt or decrypt?'
    gets.chomp
  end

  def shift_key_set_up
    puts 'What key?'
    gets.chomp.to_i
  end
end
