using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/American_General/aig_pippi_lim.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :simp)
yf = Dict(:Income_Function => :levl)
f = Dict(:Fee => 0.01)
s = zeros(length(prd[:Income]))
s[1:5] .+= 0.1
s[6:end] .+= 0.0
s = Dict(:Rollup => s)
w = Dict(:W => 0.064)

aig_pippi_lim = Dict(:aig_pippi_lim => merge(prd, gf, yf, f, s, w))
