require 'date'

class BankStatement
  attr_reader :transactions
  DATE_FORMAT = '%d/%m/%Y'
  HEADER = "date || credit || debit || balance\n"

  def initialize(transactions)
    @transactions = transactions
    @statement = ""
  end

  def print_statement
    @statement << HEADER
    statement_builder
    @statement
  end

  private

  def currency_formatter(amount)
    '£%.2f' % amount
  end

  def date_formatter(date)
    date.strftime(DATE_FORMAT)
  end

  def statement_builder
    @transactions.reverse.each do |transaction|
      if transaction[:type] == 'debit'
        @statement << "#{date_formatter(transaction[:date])} || || #{currency_formatter(transaction[:amount])} || #{currency_formatter(transaction[:balance])}\n"
      elsif transaction[:type] == 'credit'
        @statement << "#{date_formatter(transaction[:date])} || #{currency_formatter(transaction[:amount])} || || #{currency_formatter(transaction[:balance])}\n"
      end
    end
  end
end
