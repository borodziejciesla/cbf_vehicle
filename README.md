# CBF Differential Drive robot

## What is in repository
MATLAB/Simulink implementation of Control Barrier Function based of safety filter for mobile robot  with differential drive, described by equation:

![Dynamic](https://latex.codecogs.com/svg.image?%5Cdot%7Bx%7D=%5Cbegin%7Bbmatrix%7D%5Ccos%7Bx_%7B3%7D%7D&0%5C%5C%5Csin%7Bx_%7B3%7D%7D&0%5C%5C0&1%5Cend%7Bbmatrix%7D%5Cbegin%7Bbmatrix%7Du_%7Bv%7D%5C%5Cu_%7B%5Comega%7D%5Cend%7Bbmatrix%7D,)

to avoid circle obstacles.

For this purpouse following CBF was defined for each obstacle:

![cbf_obstacle](https://latex.codecogs.com/svg.image?h_%7Bi%7D(x)=(x_%7B1%7D-x_%7B1%7D%5E%7Bo%7D)%5E2&plus;(x_%7B2%7D-x_%7B2%7D%5E%7Bo%7D)%5E2&plus;x_%7B3%7D%5E%7B2%7D-(R&plus;r)%5E2%20)

## Implementation
![model](figures/model.png)


## Results

### Trajectory Tracking
![trajectory](figures/two_obstacles.png)
![u](figures/u.png)

### Pure Pursuit
![trajectory_pp](figures/two_obstacles_pp.png)
![u_pp](figures/u_pp.png)