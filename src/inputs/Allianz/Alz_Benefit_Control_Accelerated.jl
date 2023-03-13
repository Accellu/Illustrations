using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Allianz/Alz_Benefit_Control_Accelerated.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :alzmult)
yf = Dict(:Income_Function => :alzmult)
f = Dict(:Fee => 0.0)
s = zeros(length(prd[:Income]))
s[1:5] .+= 2.5
s[6:end] .+= 1.5
s = Dict(:Rollup => s)
w = Dict(:W => 0.04)
P = Dict(:P => 0.5)

Alz_Benefit_Control_Accelerated = Dict(:Alz_Benefit_Control_Accelerated => merge(prd, gf, yf, f, s, w, P))