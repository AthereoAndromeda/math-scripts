using Polynomials

struct Point{T<:Real}
    x::T
    y::T
end

function calculate(p1::Point, p2::Point, p3::Point)
    # Calculate Midpoints (M_AB)
    # (x1 + x2) / 2
    local M_ab = Point((p1.x + p2.x)/2, (p1.y + p2.y)/2)
    local M_bc = Point((p2.x + p3.x)/2, (p2.y + p3.y)/2)
    
    # Calculate Slopes (m_AB)
    # m_AB = (y_1 - y_2)/(x_1 - x_2)
    # m_1 = -1/m_AB
    local m_ab = (p1.y - p2.y)/(p1.x - p2.x)
    local m_bc = (p2.y - p3.y)/(p2.x - p3.x)
   
    # Get reciprocal 
    local m_1 = -1/m_ab
    local m_2 = -1/m_bc
    
    # Midpoint of perpendicular bisector
    # (y - y_1) = m(x - x_1)
    # y = m(x - x_1) + y_1
    local x = variable()
    local y_1 = m_1*(x-M_ab.x) + M_ab.y
    local y_2 = m_2*(x-M_bc.x) + M_bc.y
    
    # Elimination method
    local diff = y_1 - y_2
    local x = roots(diff)
    local y = y_1(x[1])
    
    println("==| Midpoints |==")
    println("M_ab:\t", M_ab)
    println("M_bc:\t", M_bc)
    
    println("\n==| Slopes |==")
    println("m_ab:\t", m_ab)
    println("m_bc:\t", m_bc)
    println("m_1:\t", m_1)
    println("m_2:\t", m_2)
    
    println("\n==| Midpoint of perpendicular bisector |==")
    println("y_1:\t", y_1)
    println("y_2:\t", y_2)
    println("diff:\t", diff)
    
    # println(y_1, y_2, diff, x, y)
    return (x[1], y)
end

function get_radius(c::Point, p::Point)
    local (x, y) = (p.x, p.y)
    local (h, k) = (c.x, c.y)
    
    local r_sq = (x-h)^2 + (y-k)^2
    return sqrt(r_sq)
end
