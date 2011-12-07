#!/usr/bin/env ruby

module FourPoint

# = CrossSection
#
# == Description
# A class representing a cross section of a channel
class CrossSection
  ##
  # Create a new cross-section.
  #
  def initialize()
      @width = 0            # width
    	@elevation = 0        # elevation
    	@water_elevation = 0  # elevation of water at cross-section
      @discharge = 0        # cross-section discharge
  end

  attr_accessor :width, :elevation, :water_elevation, :discharge


end

end
