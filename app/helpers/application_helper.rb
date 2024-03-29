# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type.to_sym
    when :notice
      'alert-success'
    when :alert, :error
      'alert-danger'
    else
      'alert-info'
    end
  end
end
