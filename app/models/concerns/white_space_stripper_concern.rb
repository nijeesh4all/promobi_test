module WhiteSpaceStripperConcern
  extend ActiveSupport::Concern

  included do
    before_validation :strip_white_spaces
  end

  protected

  def strip_white_spaces
    attribute_names.each do |name|
      if send(name).respond_to?(:strip)
        send("#{name}=", send(name).strip)
      end
    end
  end

end
