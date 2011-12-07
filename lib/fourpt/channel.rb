#!/usr/bin/env ruby

module FourPoint

# = Channel
#
# == Description
# A class representing a channel
class Channel
  ##
  # Create a new channel.
  #
  def initialize()
      @resistance = 0          # flow resistance coefficient.
      @cross_sections = []     # array of cross-sections
      @length = 0              # length of channel
      @number = 0              # identifying number
      @dx     = 0              # desired computational cross-section length
      @icndap = 1              # approximation method (default = 1)
      @boundary_condition = 1  # boundary condition code
      @nkeep  = 1              # NKEEP (TODO)
  end

  def upstream 
    return @cross_sections[0]
  end
  
  def downstream
    return @cross_sections[-1]
  end

  attr_accessor :cross_sections, :length, :resistance, :number, :dx, :icndap, :nkeep, :water_elevation, :discharge,
                :boundary_condition


end

end


=begin
ICNDAP: 0 to 7, only options 0, 1, 5, and 7 are currently implemented.
Integer indicates the type of approximation to be used for determining initial values of un- knowns in the absence of observed values or values obtained from previous model runs. Initial conditions will be approximated from
[0] user input in schematic-data file,
[1] normal depth computations, 
[2] (this option not assigned), 
[3] same as 1, but channel filled to remove adverse slopes, 
[4] maximum water-surface elevation for each channel, 
[5] initial values file,
[6] not approximated, or 
[7] steady flow computation within a channel.
For normal depth computations, option 1, water-surface elevation is approximated using initial flow values entered in the schematic-data file. For steady flow approximation, option 7, computations begin with the flow and water-surface elevation specified (in the schematic data file) at the downstream end of the channel and proceed upstream.

NKEEP: 0 or 1, normally 1 This integer index specifies that computational cross sections
[0] will not, or [1] will
be placed at all locations occupied by user-supplied cross sections. During model runs, un- knowns (such as water-surface elevation and flow) are located only at computational cross sections. This means that if NKEEP = 0, the only two user cross sections at which it can be ensured that unknowns will be determined will be those cross sections located at the extremities of the channel. All user-supplied cross sections would still be used for determin- ing geometric and hydraulic properties at computational cross sections and in intervening reaches. When using NKEEP = 0, particular attention should be addressed to checking spatial convergence of solutions.

BOUNDARY CONDITION CODES
[ 1] known water-surface elevation.
[ 2] known flow.
[ 4] known water-surface slope (downstream only).
[11] water-surface elevation equal to that of a connecting channel.
[12] sum of flows equal zero.
[. . . 31] 3-parameter rating applied to water-surface elevation (see Constraint Properties).
[. . . 32] 3-parameter rating applied to flow (see Constraint Properties).
[...51] user-defined constraint applied to water-surface elevation (see User-programmable con- straints).
[. . . 52] user-defined constraint applied to discharge (see User-programmable constraints).
=end