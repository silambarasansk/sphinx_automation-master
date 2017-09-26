# frozen_string_literal: true
Dir[File.join(__FILE__, '../models/**/*.rb')].each {|model| puts model; require model }

World(FactoryGirl::Syntax::Methods)
