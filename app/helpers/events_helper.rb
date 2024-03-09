# frozen_string_literal: true

module EventsHelper
  def start_end_time(event)
    content_tag(:small, "Start #{event.start_at} -  #{event.end_at}", class: 'text-muted')
  end
end
