using ArgParse
using TOML, OrderedCollections
using DataFrames, CSV
using StatsBase

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table! s begin
        "input"
            help = "input filename"
            required = true
    end

    return parse_args(s)
end
args = parse_commandline()
input_fn = args["input"]
@assert filesize(input_fn)>0


df = CSV.read(input_fn, DataFrame)

dict = OrderedDict( :mean=> mean(df.x),
             :stddev=> std(df.x) )

TOML.print(dict)

