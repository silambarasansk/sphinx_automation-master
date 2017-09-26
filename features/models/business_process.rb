# frozen_string_literal: true
class BusinessProcess
  attr_accessor :uid, :name, :identifier, :steps, :notes_separator, :optional_steps
end

class Identifiers
  attr_accessor :loan
end

class Identifierstatus
  attr_accessor :status
end
