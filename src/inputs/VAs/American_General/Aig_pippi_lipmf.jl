using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/American_General/aig_pippi_lipmf.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :simp)
yf = Dict(:Income_Function => :aigretn)
f = Dict(:Fee => 0.01)
s = zeros(length(prd[:Income]))
s[1:5] .+= 2.0
s[6:end] .+= 1.0
s = Dict(:Rollup => s)
w = Dict(:W => 0.06)

aig_pippi_lipmf = Dict(:aig_pippi_lipmf => merge(prd, gf, yf, f, s, w))
