#!/usr/bin/env ruby
#
# = Name
# FourPt
#
# == Description
# This file provides a Ruby interface for the FourPt river flow model
#
# == Version
# See VERSION.yml
#
# == Author
# John Ewart <john@johnewart.net>
#
# == License
# This program is free software; you can redistribute it and/or modify it
# under the terms of either:
#
# a) the GNU General Public License as published by the Free Software
#    Foundation; either version 1, or (at your option) any later version,
#    or
#
# b) the "Artistic License" which comes with Perl.

# == Usage
#  require 'fourpt'
#
#  ...
#
module FourPoint

  require File.dirname(__FILE__) + '/fourpt/cross_section'
  require File.dirname(__FILE__) + '/fourpt/channel'
  require File.dirname(__FILE__) + '/fourpt/model'

  class InvalidArgsError < Exception
  end

  class ProtocolError < Exception
  end

  class NetworkError < Exception
  end

end
