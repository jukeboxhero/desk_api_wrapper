require 'representable/json'

module CaseRepresenter
  include Representable::JSON

  property :blurb
  property :subject
end