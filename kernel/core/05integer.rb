class Integer < Numeric

  # TODO - This is extremely lame.
  CHARACTERS = ["\000", "\001", "\002", "\003", "\004", "\005", "\006", "\a", "\b", "\t", "\n", "\v", "\f", "\r", "\016", "\017", "\020", "\021", "\022", "\023", "\024", "\025", "\026", "\027", "\030", "\031", "\032", "\e", "\034", "\035", "\036", "\037", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}", "~", "\177", "\200", "\201", "\202", "\203", "\204", "\205", "\206", "\207", "\210", "\211", "\212", "\213", "\214", "\215", "\216", "\217", "\220", "\221", "\222", "\223", "\224", "\225", "\226", "\227", "\230", "\231", "\232", "\233", "\234", "\235", "\236", "\237", "\240", "\241", "\242", "\243", "\244", "\245", "\246", "\247", "\250", "\251", "\252", "\253", "\254", "\255", "\256", "\257", "\260", "\261", "\262", "\263", "\264", "\265", "\266", "\267", "\270", "\271", "\272", "\273", "\274", "\275", "\276", "\277", "\300", "\301", "\302", "\303", "\304", "\305", "\306", "\307", "\310", "\311", "\312", "\313", "\314", "\315", "\316", "\317", "\320", "\321", "\322", "\323", "\324", "\325", "\326", "\327", "\330", "\331", "\332", "\333", "\334", "\335", "\336", "\337", "\340", "\341", "\342", "\343", "\344", "\345", "\346", "\347", "\350", "\351", "\352", "\353", "\354", "\355", "\356", "\357", "\360", "\361", "\362", "\363", "\364", "\365", "\366", "\367", "\370", "\371", "\372", "\373", "\374", "\375", "\376", "\377"]

  def times
    i = 0
    while i < self
      yield i
      i += 1
    end
    self
  end
  
  def upto(val)
    i = self
    while i <= val
      yield i
      i += 1
    end
    return self
  end
  
  def downto(val)
    i = self
    while i >= val
      yield i
      i -= 1
    end
    return self
  end

  def to_i
    self
  end

  def chr
    raise RangeError.new("#{self} is out of the valid character range") if self > 255 || self < 0
    CHARACTERS[self].dup
  end

  def [](i)
    if i < 0
      0
    else
      (self >> i) & 1
    end
  end

  def **(exp)
    if exp < 0 || !(Integer === exp)
      Float(self)**Float(exp)
    else
      out = 1
      base = self
      while exp > 0
        if (exp & 1) != 0
          out *= base
          exp -= 1
        else
          base *= base
          exp >>= 1
        end
      end
      out
    end
  end

end
