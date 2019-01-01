class ApplicationService
  attr_accessor :errors
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def success?
    @errors.empty?
  end

  def errors
    @errors.to_h
  end
end
