require 'insufficient_funds_error'

describe InsufficientFundsError do
  it 'can raise a InsufficientFundsError' do
    expect { raise InsufficientFundsError }.to raise_error(InsufficientFundsError)
  end

  it 'raises a custom message' do
    expect { raise InsufficientFundsError }.to raise_error(
      'Sorry you do not have enough funds to withdraw at this time'
    )
  end
end
