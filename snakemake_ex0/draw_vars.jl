using ArgParse

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table! s begin
        "output"
            help = "output filename"
            required = true
        "--n"
            arg_type = Int64           # only Int64 arguments allowed
            default = 100              # this is used when the option is not passed
            help = "number of draws"
        "--mean"
            arg_type = Float64         # only Float64 arguments allowed
            default = 0.0              # this is used when the option is not passed
            help = "mean of normal distribution"
        "--sigma"
            arg_type = Float64         # only Float64 arguments allowed
            default = 1.0              # this is used when the option is not passed
            help = "standard deviation of normal distribution"
    end
    return parse_args(s)
end

args = parse_commandline()

num_draws = args["n"]
@assert 1 <= num_draws <= 1_000_000

mu = args["mean"]

sigma = args["sigma"]
@assert sigma > 0

output_fn = args["output"]
@assert !isnothing(match(r".csv$", output_fn))

using Distributions
x = rand(Normal(mu,sigma),num_draws)

using CSV, DataFrames
df = DataFrame(:x=>x)

CSV.write(output_fn, df)

