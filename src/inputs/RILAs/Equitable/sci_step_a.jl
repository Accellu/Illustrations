using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/RILAs/Equitable/Structured_Capital_Income_Accelerated_Stepup_Segments.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :equitable_simple)
yf = Dict(:Income_Function => :equitable_drop)
rf = Dict(:Return_Function => :trig_buff)
f = Dict(:Fees => Dict([:account, :rider] .=> [0.0069, 0.015]))
s = Dict(:Rollup => prd[:Rollup])
w = Dict(:W => 0.05)
inc = Dict(:inc => 0.001)

sci_step_a = Dict(:sci_step_a => merge(prd, gf, yf, f, s, w, rf, inc))