include("./three-points.jl")

p1 = Point(-6, 18)
p2 = Point(18, 0)
p3 = Point(11, 17)

res = calculate(p1, p2, p3)
println(res)

center = Point(res[1], res[2])
r = get_radius(center, p1)
println(r)
