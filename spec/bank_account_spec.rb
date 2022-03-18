# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  subject(:account) { described_class.new }
  let(:statement) do
    "date || credit || debit || balance
24/03/2022 || || 500.00 || 2500.00
24/03/2022 || 2000.00 || || 3000.00
24/03/2022 || 1000.00 || || 1000.00
"
  end

  it 'creates an instance of bank_account' do
    expect(account).to be_a(BankAccount)
  end

  describe '#balance' do
    it 'has an initial balance of 0' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'increases the balance' do
      account.deposit(100)
      expect(account.balance).to eq(100)
    end

    context 'if the user tries to deposit a negative number' do
      it 'raises a NegativeAmountError' do
        expect { account.deposit(-10) }.to raise_error(NegativeAmountError)
      end
    end
  end

  describe '#withdraw' do
    it 'decreases the balance' do
      account.deposit(100)
      account.withdraw(10)
      expect(account.balance).to eq(90)
    end

    context 'if the balance is £0.00' do
      it 'raises a InsufficientFundsError' do
        expect { account.withdraw(10) }.to raise_error(InsufficientFundsError)
      end
    end

    context 'if the user tries to withdraw a negative number' do
      it 'raises a NegativeAmountError' do
        account.deposit(100)
        expect { account.withdraw(-1) }.to raise_error(NegativeAmountError)
      end
    end
  end

  describe '#print_statement' do
    it 'prints a formatted statement showing the various transactions' do
      allow(Date).to receive(:today).and_return Date.new(2022,3,24)
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
      expect { account.print_statement }.to output(statement).to_stdout
    end
  end
end
