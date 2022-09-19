include("./three-points.jl")

# === Edit this area ===
p1 = Point(6, 18)
p2 = Point(18, 0)
p3 = Point(11, 17)
# === End of editable area ===


res = calculate(p1, p2, p3)

println("\n\n====| Results |====")
println("(x, y):\t", res)

center = Point(res[1], res[2])
r = get_radius(center, p1)
println("Radius:\t", r)
