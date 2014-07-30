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
        if self.send(opt)
          new_obj.send("#{opt}=", self.send(opt)) unless new_obj.send(opt)
        end
      end
      new_obj
    end
  end
end
