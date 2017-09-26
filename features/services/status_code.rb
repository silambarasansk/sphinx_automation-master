# frozen_string_literal: true
class StatusCode
  STATUS_CODES = {
    unavailable: 503,
    timeouts: 504,
    not_found: 404
  }.freeze

  def self.http_status_code_for(reason)
    STATUS_CODES[reason.to_sym] || 200
  end
end
