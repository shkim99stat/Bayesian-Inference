#=============
using Pkg
Pkg.add("Distributions")
Pkg.add("Statistics")
Pkg.add("LinearAlgebra")
Pkg.add("Plots")
=============#

using Statistics
using Distributions
using LinearAlgebra
using Plots

#=================================================================================#

n_iter = 5000

x = repeat([0.0],n_iter)
x[1] = rand(Uniform(0,1),1)[1]
target(x::Real) = 0.3*pdf(Normal(0,2),x) + 0.7*pdf(Normal(10,2),x)
my_std = 10

for i in 1:n_iter-1
    u = rand(Uniform(0,1),1)[1]

    global x_old = x[i]
    global x_new = rand(Normal(x_old,my_std),1)[1]

    A = min(1,(target(x_new)*pdf(Normal(x_new,my_std),x_old))/(target(x_old)*pdf(Normal(x_old,my_std),x_new)))

    if u < A
        x[i+1] = x_new
    else
        x[i+1] = x_old
    end

end

x_range = -10.0:0.001:20.0
histogram(x,normalize=true,label="histogram")
plot!(x_range,target.(x_range),
        linecolor=:red,lw=2,label="0.3*Normal(0,2)+0.7*Normal(10,2)",
        legend=:topleft)
