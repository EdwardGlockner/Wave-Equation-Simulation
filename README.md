# Wave-Equation-using-Runge-Kutta-4-and-Central-Difference-2-in-MATLAB

This is the final project in the course Scientific Computing II at Uppsala University, Sweden. In this project we solve the wave equation in both the 1 dimensional case (a string) and the 2d dimensional case (a plane) using the numerical methods Runge Kutta of fourth order and Central Difference of second order. We analyze both Neumann and Dirichlet boundary conditions. 

By obtaining discrete spatial finite difference approximations of the wave equation, the equation transforms into an initial-value problem (IVP). This IVP can be solved fairly easiliy with the use of numerical approximation methods. The files Assignment1-Assignment7 treats the wave equation in 1 dimension, and Assignment8 solves the wave equation in 2 dimensions. 

In the file Assignment1.m we analyze the IVP:s eigenvalues for the case with Dirichlet boundary condition. We plot both the analytical and the numerical solutions. 

In the file Assignment2.m we find the biggest eigenvalues for Neumann and Dirichlet boundary condition. This will tell us what the biggest time-steps we can use for numerical stability when solving using Runge Kutta 4. 

In the file Assignment3.m we solve the wave equation using Runge Kutta 4 using both Neumann and Dirichlet boundary condition, using the function RK4.m. To do this we use the function RK4.m, which contains the algorithm. The functions animation.m and plot_snapshot.m are used to visualize the results. 

In the file Assignment4.m we analyze the convergence rate of Runge Kutta 4, to verify that the accuracy is fourth order. 

In the file Assignment6.m we solve the wave equation with Central Difference 2, by using the function CD2.m which contains the algorithm. Again the functions animation.m and plot_snapshot.m are used to visualize the simulations. 

In the file Assignment7.m we analyze the converegence rate of central difference 2, to verify that its' accuracy is of order 2. 

In the file Assignment8.m we solve the wave equation on a plane, for both Neumann and Dirichlet boundary conditions using Central Difference of order 2. This is done using the function CD2_2D.m, and the functions animation_3D.m and plot_snapshot_3D are used to visualize the results. 
