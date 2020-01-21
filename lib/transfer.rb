class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender 
    @receiver = receiver
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
end

def execute_transaction
  if valid? && sender.balance > amount && self.status =="pending"
    sender.balance -= amount
    receiver.balance += amouunt
    self.status = "complete"
  else
    reject_transfer
  end
end

def reverse_transfer 
  if valid?
  self.status = "reversed"
  
  
  
  
  
  
  
  
  
  
  
  
  
