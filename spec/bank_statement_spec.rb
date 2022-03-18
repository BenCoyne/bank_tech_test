# frozen_string_literal: true

require 'bank_statement'

describe BankStatement do
  
  let(:transactions) do
    [
      { date: Date.today, type: 'credit', amount: 100, balance: 100 },
      { date: Date.today, type: 'debit', amount: 10, balance: 90 },
      { date: Date.today, type: 'debit', amount: 20, balance: 70 }
    ]
  end

  subject(:statement) { described_class.new(transactions) }

  it 'returns an instance of BankStatement' do
    expect(statement).to be_a(BankStatement)
  end

  describe '#print_statement' do
    it 'returns the bank statement as a string' do
      allow(Date).to receive(:today).and_return Date.new(2022,3,24)
      expect(statement.statement_formatter).to eq(
        "date || credit || debit || balance
24/03/2022 || || 20.00 || 70.00
24/03/2022 || || 10.00 || 90.00
24/03/2022 || 100.00 || || 100.00
"
      )
    end
  end
end
