class OnlyLatinAlphanumericSymbolsValidator < ActiveModel::EachValidator
  def validate_each(record, field, value)
    unless value.blank?
      record.errors[field] << "Only latin letters and numbers allowed" unless value =~ /^[A-Za-z_0-9]+$/
    end
  end
end
