module WePair
  class Clipboard
    def self.copy(input)
      return unless system("which pbcopy")
      str = input.to_s
      IO.popen('pbcopy', 'w') { |f| f << str }
      str
    end
  end
end
