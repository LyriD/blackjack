module Blackjack

  class Deck < Cards::Deck

  private

    def base_rank_values
      {
        туз: 11, двойка: 2, тройка: 3, четверка: 4, пятерка: 5,
        шестерка: 6, семерка: 7, восьмерка: 8, девятка: 9, десятка: 10,
        валет: 10, дама: 10, король: 10
      }
    end

    def all_ranks
      base_rank_values.map {|rank, value| Cards::Rank.new(rank, value) }
    end
  end
end
