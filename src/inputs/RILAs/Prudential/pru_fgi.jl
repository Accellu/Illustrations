using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/RILAs/Prudential/FlexGuard_Income_Steprate.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :prudential_account)
yf = Dict(:Income_Function => :prudential_level)
rf = Dict(:Return_Function => :step_buff)
f = Dict(:Fees => Dict(:rider => 0.015))
s = Dict(:Rollup => zeros(length(prd[:Account])))
w = Dict(:W => 0.065)
step = Dict(:step => 0.115)
par = Dict(:par => 0.8)

pru_fgi = Dict(:pru_fgi => merge(prd, gf, yf, f, s, w, rf, step, par))