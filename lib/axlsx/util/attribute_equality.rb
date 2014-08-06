# encoding: UTF-8
module Axlsx
  module AttributeEquality
    # Check for equality (used to check for duplication)
    def ==(v)
      self.class.attributes.all?{ |attr| v.send(attr.to_sym) == self.send(attr.to_sym) }
    end

    # Attempt to merge this object with another object, only updating the new properties
    def merge(new_obj)
      self.class.attributes.each do |opt|
        opt = opt.to_sym
        unless self.send(opt).nil?
          new_obj.send("#{opt}=", self.send(opt)) if new_obj.send(opt).nil?
        end
      end
      new_obj
    end
  end
end
