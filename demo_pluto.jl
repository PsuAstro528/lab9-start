### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ e599dca0-da5b-48bd-947c-ad17f41f3ad1
begin
	# If path isn't set, then use current directory
	if !(@isdefined path) path = "." end
	import Pkg
	# Tell Julia to use the Project.toml and Manifest.toml specified in the directory
	Pkg.activate(path)
	using PlutoLinks
end

# ╔═╡ 71a996eb-f57e-4d57-a24b-b249edf27d0d
@revise using ExamplePkg

# ╔═╡ 5046b25e-2622-4356-b8ec-bf28f94e1b94
# Uncomment and update the line below if you need to set the path to your package 
#path = joinpath(homedir(),"Teach/Astro528/Fall2023/labs/lab9-start")

# ╔═╡ 383e97ab-203d-4663-ad1e-26dda1db26e6
@test Pkg.project().name == "ExamplePkg"

# ╔═╡ 012d24b5-1797-45ea-81f8-22b214afd007
hello()

# ╔═╡ 94fb75b9-3793-4b27-aa84-d0eae1a569f2
ExamplePkg.goodbye()

# ╔═╡ Cell order:
# ╠═5046b25e-2622-4356-b8ec-bf28f94e1b94
# ╠═e599dca0-da5b-48bd-947c-ad17f41f3ad1
# ╠═383e97ab-203d-4663-ad1e-26dda1db26e6
# ╠═71a996eb-f57e-4d57-a24b-b249edf27d0d
# ╠═012d24b5-1797-45ea-81f8-22b214afd007
# ╠═94fb75b9-3793-4b27-aa84-d0eae1a569f2
