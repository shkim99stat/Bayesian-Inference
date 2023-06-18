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

# generate example value
x = range(0, 10, length=500)
y = 4 .+ 2x .+ rand(Normal(),length(x))

plt = plot(x, y, label = "Data", 
        markershape = :circle,
        markerstrokewidth = 0,
        markeralpha = 0.5,
        markersize = 5,
        linealpha = 0, legend = false, dpi = 200, 
        size = (700,432))

# OLS method
β1 = sum((x .- mean(x)) .* (y .- mean(y)))/sum((x .- mean(x)) .^ 2)
β0 = mean(y) - β1*mean(x)

plot!(x, β0 .+ β1 .* x, linewidth = 5, label = "OLS line",
        linecolor = :purple)


#=================================================================================#

# Bayesian method
function simulate(n::Integer, w0::Real, w1::Real, α::Real)
    x = rand(Uniform(0,10),n)

    w = [w0; w1]
    A = [ones(length(x)) x]

    y = A * w + rand(Normal(0,α),length(x))
    return (x,y,A,α)
end

function posterior(y::Vector,A::Matrix,α::Real,β::Real)
    σ_inv = α * transpose(A) * A + β * I
    σ = σ_inv^(-1)
    μ = α * σ * transpose(A) * y
    return (μ,σ)
end

x, y, A, a = simulate(100,4,2,1)
μ, σ = posterior(y, A, a, 0.25)

anim = @animate for i = 1:100
    w = rand(MvNormal(μ, σ))

    if i < 90 
        plot!(plt, x, A * w, 
                linewidth = 1.0, 
                linealpha = 0.7,
                linecolor = :green)
    else
        plot!(plt, x, A * μ, 
                linewidth = 3,
                linealpha = 0.1,
                linecolor = :red)
    end
end

gif(anim,fps=10)