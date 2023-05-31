using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/American_General/aig_pspi_lipf.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :simp)
yf = Dict(:Income_Function => :levl)
f = Dict(:Fee => 0.011)
s = zeros(length(prd[:Income]))
s[1:5] .+= 0.09
s[6:end] .+= 0.0
s = Dict(:Rollup => s)
w = Dict(:W => 0.068)

aig_pspi_lipf = Dict(:aig_pspi_lipf => merge(prd, gf, yf, f, s, w))
