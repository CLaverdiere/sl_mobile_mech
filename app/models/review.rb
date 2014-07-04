class Review < ActiveRecord::Base
  after_initialize :default_values

  private
    def default_values
      self.name ||= 'Anonymous'
    end
end
