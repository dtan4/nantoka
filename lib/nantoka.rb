require "nantoka/version"
require "natto"

module Nantoka
  class << self
    def nantoka(text)
      raise ArgumentError if text.nil? || !text.is_a?(String)
      replace_to_nantoka(text)
    end

    private

    def replace_to_nantoka(text, nantoka_number = 1)
      result = ""
      nantoka_count = 0

      Natto::MeCab.new.parse(text) do |n|
        next unless n.surface

        if type(n.feature) == "名詞" && nantoka_count < nantoka_number
          result << "なんとか"
          nantoka_count += 1
        else
          result << n.surface
        end
      end

      result
    end

    def type(feature)
      feature.split(",")[0]
    end
  end
end
