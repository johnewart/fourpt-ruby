#!/usr/bin/env ruby
require "erb"

module FourPoint

  # = Channel
  #
  # == Description
  # A class representing the model
  class Model

    attr_reader :name
    attr_accessor :channels, :terms, :density, :sinuosity, :read_boundary, :perturbation,
                  :gravity, :maxtimesteps, :start_time, :time_step, :time_weight, 
                  :max_iterations, :lu_inc, :tolerance_q, :tolerance_y, :printlevel, :icndap

    APPROXIMATIONS = {
      :user_input => 0, 
      :normal_depth => 1, 
      :unused => 2, 
      :channel_filled => 3, 
      :max_elevation => 4, 
      :initial_values => 5, 
      :not_approximated => 6, 
      :steady_flow => 7
    }
    
    ##
    # Create a new model.
    #
    def initialize(name="FourPoint")
     @name = name
     @channels = []
   
     @terms = 1                 # Terms, 1=dynamic, 2=diffusion, 3=kinematic
     @density = 0               # 0 = constant density, 1 = variable density.
     @sinuosity = 0             # 0 = constant sinuosity, 1 = variable sinuosity.
     @read_boundary = 0         # 0 = do not read boundary values, 1 = read values.
     @perturbation = 0          # 0 = perturbation inactive, 1 = perturbation active.
     @gravity = 32.2            # acceleration due to gravity (ft/s^2)
     @maxtimesteps = 0          # MaxTimeSteps, maximum number of time steps.
     @start_time = 0            # NetStartTime, starting elapse time, in seconds.
     @time_step = 60            # DT, time step, in seconds.
     @time_weight = 1           # Theta, time-weighting factor.
     @max_iterations = 10       # MaxIterations, maximum number of iterations per time step.
     @lu_inc = 1                # LuInc, interval for complete forward eliminations.
     @tolerance_q = 0.005       # ToleranceQ, tolerance for closure on discharge.
     @tolerance_y = 0.005       # ToleranceY, tolerance for closure on water-surface elevation.
     @printlevel  = 1           # PrintLevel, amount of printing, 0 to 9, increasing with number
     @icndap      = 0           # Type of approximation used
    end
    
    def outfile
      return @name.gsub("_", "")[0..7]
    end
    
    def process_template(filename, bindings)
      template_dir = File.expand_path(File.dirname(__FILE__)) << "/../templates"
      template = File.open(template_dir << "/" << filename, 'r') { |f| f.read }      
      erb = ERB.new(template, 0, ">")
      return erb.result(bindings)
    end
    
    def export
      @model = self
      @channels = @model.channels

      control_data  = process_template("fourpt.ctr.erb", binding)
      geometry_data = process_template("fourpt.geo.erb", binding)
      network_data  = process_template("fourpt.sch.erb", binding)
      master_data   = process_template("fourpt.fil.erb", binding)
      
      begin
        dir = Dir.mkdir(@name)
      rescue 
        ;
      end
      
      Dir.chdir(@name)
      
      f = File.new("#{self.outfile}.sch", "w") 
      f.puts network_data
      f.close
      
      f = File.new("#{self.outfile}.ctr", "w")
      f.puts control_data
      f.close
      
      f = File.new("#{self.outfile}.geo", "w")
      f.puts geometry_data
      f.close
      
      f = File.new("master.fil", "w")
      f.puts master_data
      f.close
      
    end
  
  end

end
