class OnlyInternationalLettersValidator < ActiveModel::EachValidator
  def validate_each(record, field, value)
    unless value.blank?
      record.errors.add(field, :invalid, message: "Only letters allowed") unless value =~ /^((?>\p{L}\p{M}*)|\')+$/
    end
  end
end
