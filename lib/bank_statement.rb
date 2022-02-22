require 'date'

class BankStatement
  attr_reader :transactions

  DATE_FORMAT = '%d/%m/%Y'.freeze
  HEADER = "date || credit || debit || balance\n".freeze

  def initialize(transactions)
    @transactions = transactions
  end

  def statement_formatter
    statement = ''
    statement << HEADER
    @transactions.reverse.each do |transaction|
      case transaction[:type]
      when 'debit'
        statement << "#{date_formatter(transaction[:date])} || || #{currency_formatter(transaction[:amount])} || #{currency_formatter(transaction[:balance])}\n"
      when 'credit'
        statement << "#{date_formatter(transaction[:date])} || #{currency_formatter(transaction[:amount])} || || #{currency_formatter(transaction[:balance])}\n"
      end
    end
    statement
  end

  private

  def currency_formatter(amount)
    format('£%.2f', amount)
  end

  def date_formatter(date)
    date.strftime(DATE_FORMAT)
  end
end
