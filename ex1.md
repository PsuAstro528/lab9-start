# Astro 528 Lab 9
## Exercise 1:  Creating a Module & Package

In this exercise, you will learn to create a simple Julia package, so as to make it easy for other people to install and use your code.  You're welcome to either:
- use the sample code provided or
- follow the steps below, but packaging the code for your class project (if it is written in Julia) instead of the sample code.
If you opt to package your project, then you'll need to place your code into a module (if you haven't already) for step 5.  
Organizing code into modules is another good software development habit that you can develop.   

Instructions for [creating a Julia Package](https://julialang.github.io/Pkg.jl/v1/creating-packages/):

0.  Changed out of the directory with this lab's starter repo (e.g., `cd /storage/work/USERID/`).  This is so that in subsequent steps you will create a new directory that is not inside another git repository (like the lab's starter repository).  
1.  Use `Pkg.generate("ExamplePkg")` to create a new directory with the bare-bone minimal files for your package (ExamplePkg/Project.toml and ExamplePkg/src/ExamplePkg.jl).  Feel free to pick your own package name.
If you might want to officially register your package, then review the [recommended conventions for package naming](https://julialang.github.io/Pkg.jl/v1/creating-packages/#Package-naming-guidelines-1) before picking your name.
```julia
julia -e 'using Pkg; Pkg.generate("ExamplePkg")'
```
2. Change into directory `cd ExamplePkg`, copy any other files you'd like to be in your package into the directory from the beginning and use git to add and commit them to your repository.  Those might include:
   - a [LICENSE](https://github.com/PsuAstro528/lab9-start/blob/master/LICENSE) so others know how you'd like your code to be used
   - [.gitignore](https://github.com/PsuAstro528/lab9-start/blob/master/.gitignore) if there are some files that you don't want added to your git repository
```sh
cp PATH/LICENSE .
cp PATH/.gitignore .
```

3.  Make your directory into a git repository.  Add and commit the current files.  Rename your working branch to `main`.
```sh
git init
git add .
git commit -m "init commit"
git branch -M main
```

4. Go to [GitHub](https://github.com) and click the green "New" button to create a new repository.  
   - Enter a repository name that matches your repository name, but ends in ".jl",  e.g., "ExamplePkg.jl".  
   - Add a brief description (optional)
   - Choose whether you'd like your repository to be public or private.  Do _not_ check "Initialize this repository with a README".  Select None for "Add .gitignore" and "Add a license".  
   - Click "Create Repository"
   - Copy the code under "or push an existing repository from the command line"
   - Run that code in the directory you create in step 2, e.g.,
```sh
git remote add origin git@github.com:GITHUBID/ExamplePkg.jl.git
git push -u origin master
```
   - Reload the webpage to make sure your files were successfully pushed to GitHub.

5.  Add some code to your package.  Ideally, you'd be adding code from your class project.  If you'd prefer to keep this exercise as simple as possible, you can use code from my [`src/ExamplePkg.jl`](https://github.com/eford/ExamplePkg.jl/blob/master/src/ExamplePkg.jl) that is copied below.
```julia
"Package demonstrating how to make your code into a Julia package"
module ExamplePkg

using Distributions

export pdf_normal

"""
   pdf_normal(x, mu, sigma)

Return pdf of a normal distribution with mean mu and standard deviation sigma at point x.
"""
function pdf_normal(x::Number, mu::Number, sigma::Number)
  dist = Normal(mu,sigma)
  pdf(dist,x)
end

end # module
```
Note that the package must provide a module of the same name as the package (but without the trailing '.jl').  You can specify which function and variables you'd like users to be able to access directly after `using` your package, by listing them in `export` commands.  (A function or variables not explicitly exported would need to be accessed like `ExamplePkg.UnexportedFunction()` even after doing `using ExamplePkg.)

Add, commit and push your changes
```sh
git add src/ExamplePkg.jl
git commit -m "init code"
git push
```

6.  Add any project dependencies to your project's Project.toml and Manifest.toml files.  Note that you don't edit those files manually.  They are updated for you by using `Pkg.add("PackageName")`.  In the example above, I used the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) package, so I'd do
```julia
using Pkg
Pkg.activate(".")
Pkg.add("Distributions")
```

7.  Add some tests to your package.
   - Create a test/runtests.jl file
```sh
mkdir -p test && touch test/runtests.jl
```
   - Edit test/runtests.jl to include tests like we've been practicing.  For a reminder, you can see my example [test/runtests.jl](https://github.com/eford/ExamplePkg.jl/blob/master/test/runtests.jl).  

```julia
using Test
using ExamplePkg
using Distributions

@testset "std_normal" begin
   dist = Normal()
   @test pdf_normal(0.0, 0.0, 1.0) ≈ pdf(dist,0.0)
   @test pdf_normal(2.0, 0.0, 1.0) ≈ pdf(dist,2.0)
   @test pdf_normal(-1.0, 0.0, 1.0) ≈ pdf(dist,-1.0)
end;

@testset "normal" begin
   dist = Normal(1.0,2.0)
   @test pdf_normal(0.0, 1.0, 2.0) ≈ pdf(dist,0.0)
   @test pdf_normal(2.0, 1.0, 2.0) ≈ pdf(dist,2.0)
   @test pdf_normal(-1.0, 1.0, 2.0) ≈ pdf(dist,-1.0)
end;
```
Since your tests will make use of the Test package, add that to the list of dependencies.  Then
```sh
julia --project -e 'using Pkg; Pkg.add("Test")'
```

   - Try running your tests using the package manager.  
```julia
julia --project -e 'using Pkg; Pkg.test("ExamplePkg")'
```
If you encounter any difficulties, then fix them.  Once your initial tests are ready, add/commit/push them.
```
git add Project.toml test
git commit -m "init tests"
git push
```

   - Optionally, add a [.github/workflows/test.yaml](https://github.com/PsuAstro528/lab3-start/blob/main/.github/workflows/test.yaml) file, if you've like GitHub to be able to perform tests and/or enable Continuous Integration testing.  

   - Optionally, add a [.github/workflows/ExportPluto.yaml](https://github.com/PsuAstro528/lab3-start/blob/main/.github/workflows/ExportPluto.yaml) file, if you've like GitHub to be able to build html versions of your Pluto notebooks and deploy them via GitHub Pages.  

   - Note that, I might have to disable GitHub Actions for most repositories in the PsuAstro528 GitHub organization (if some students' projects are using significant resources), so that we didn't run exceed our allocation on GitHub.  In that case, your automated testing and notebook building won't happen.  If you create a repository that's not part of the PsuAstro528 organization, then you'll have control of whether/which repositories can automatically trigger workflows via GitHub Actions.


   - Add & commit your changes and push to GitHub.

8.  (Optional) Add/commit/push any other files that will help potential users make use of your package more easily.  This isn't important for the lab exercise, but could be important if you wanted to share your project.  For example,

   - README.md if you'd like to provide users an overview of how to install, use and cite the code in your project.  Or to provide benchmarking results showing the relative performance of your code in serial and parallel.  
   - For more examples of features people like to add to packages, see the [PkgTemplates.jl](https://github.com/JuliaCI/PkgTemplates.jl) package that makes it easier to build packages with a consistent set of features (e.g., code coverage testing, badges, logos, etc.)

9.  Test that you and others can add your (unregistered package).
   - Exit Julia and change into a new directory.
   - Try installing your package from github (remembering to replace GITHUBID)
```sh
julia -e 'using Pkg; Pkg.add(url="https://github.com/GITHUBID/ExamplePkg.jl")'

```
   - Now try loading your package (e.g., `using ExamplePkg`).  The lab's starter repo includes demo scripts for how to access your package's functionality from a Pluto notebook, Jupyter notebook or a simple script.
   - Run your tests (e.g., `using Pkg; Pkg.test("ExamplePkg")` )
   - Check your docstings (e.g.,  `?ExamplePkg`)

10.  To continue developing your package, tell the package manager that you want to develop (as opposed to use your package).
```julia
using Pkg
Pkg.develop(url="git@github.com:GITHUBID/ExamplePkg.jl.git")
```
This will cause Julia to download the full git repository for this package into the dev directory (by default `~/.julia/dev/ExamplePkg`, but this is may be overwridden by your JULIA_DEPOT_PATH and/or JULIA_PKG_DEVDIR environment variables; On Roar Collab, we created a symlink to /storage/work/USERID/.julia).  Now, you can change into that directory to pull, push, commit and use all other features of git.  By comitting and pushing your code, you'll be updating the package on github.  


11. Add a link to the github Repo your new package below.

1a.  **TODO:**  INSERT URL TO YOU PACKAGE HERE

12. (Very optional) Consider adding other nice features to your project.  For example:
   - If you want code to be run whenever your package in installed (e.g., downloading large datafiles that aren't stored on github), you can put that code in [`deps/build.jl`](https://pkgdocs.julialang.org/v1/creating-packages/#Adding-a-build-step-to-the-package).
   - If you want to generate webpages of documentation from your docstrings, you could add a [`docs` directory](https://github.com/JuliaLang/Example.jl/tree/master/docs) with the files necessary for [Documenter.jl](https://juliadocs.github.io/Documenter.jl/latest/).
   - If you want to make it easy for people to install everything they need (particularly if your code combines multiple languages), then consider providing a docker-compose.yml file like
```
version: '3.7'
services:
  julia:
    image: julia:latest
    volumes:
      - .:/home/jovyan/work
    ports:
      - 8888:8888
```


13. (Very optional) Register your package.  If you publish your package in a public GitHub repository, then people can add your package, provided that they know the url.  I're interested in making it even easier for other people to use your package, then you could register your package in the General Julia Registry.  Then others can easily install it by name, rather than by url.  Instructions to request your package be registered are at [Registrator.jl](https://github.com/JuliaRegistries/Registrator.jl).  We can discuss this in a future class if people express interest.

