A = [floor(10*rand(3,2))]

mean(A, 1)

Z = A .- mean(A, 1)

std(A, 1)

Z ./ std(A, 1)