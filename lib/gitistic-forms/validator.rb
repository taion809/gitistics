# TODO: Make this a DSL.

module GitisticForms
    class Validator
        attr_reader validation #no witty name for this i guess..

        def initialize(validator_obj = nil)
            if validator_obj.nil?
                @validation = validator_object.new
            else
                @validation = validator_obj
            end
        end

        def make(fields, rules, messages)
            rules.each do | key, rule |
                rule_list = rule.split('|')

                rule_list.each do |r|
                    if r.scan(':')
                        t = r.split(':')
                        r = t[0]
                        value = t[1]
                    end

                    case r
                    when 'required'
                        if self.validate_required(fields, key) == false
                            @validation[key] = "#{key} is a required field."
                        end
                    when 'same'
                        if self.validate_same(fields, key, value) == false
                           @validation[key] = "#{value} does not match #{key}"
                        end
                    end
                end
            end

            return @validator_object
        end

        def validate_required(fields, rule)
            fields.fetch(rule, false)
        end

        def validate_same(fields, rule, target)
            if self.validate_required(fields, key) == false
                return false
            elsif self.validate_required(fields, rule) == false
                return false
            end

            fields.fetch(target).eql?(fields.fetch(rule))
        end
    end
end