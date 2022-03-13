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
        statement << debit_transaction(transaction)
      when 'credit'
        statement << credit_transaction(transaction)
      end
    end
    statement
  end

  private

  def currency_parse(amount)
    format('%.2f', amount)
  end

  def date_parse(date)
    date.strftime(DATE_FORMAT)
  end

  def debit_transaction(transaction)
    "#{date_parse(transaction[:date])} || || #{currency_parse(transaction[:amount])} || #{currency_parse(transaction[:balance])}\n"
  end

  def credit_transaction(transaction)
    "#{date_parse(transaction[:date])} || #{currency_parse(transaction[:amount])} || || #{currency_parse(transaction[:balance])}\n"
  end
end
