require "nantoka/version"
require "natto"

module Nantoka
  class << self
    def nantoka(text)
      raise ArgumentError if text.nil? || !text.is_a?(String)
      replace_to_nantoka(text)
    end

    private

    def first_noun_index_of(parse_result)
      parse_result.each_with_index do |word, index|
        return index if word[:type] == "名詞"
      end

      return 0
    end

    def parse(text)
      result = []

      Natto::MeCab.new.parse(text) do |n|
        result << { surface: n.surface, type: type(n.feature) } if n.surface
      end

      result
    end

    def replace_to_nantoka(text)
      parse_result = parse(text)
      parse_result[first_noun_index_of(parse_result)][:surface] = "なんとか"
      parse_result.map { |w| w[:surface] }.join("")
    end

    def type(feature)
      feature.split(",")[0]
    end
  end
end
