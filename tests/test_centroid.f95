module test_centroid
use fdeclarations
use fruit

implicit none

contains
subroutine centroid_test_based_on_known_values

real, dimension(15,1) :: ref
l=1
allocate(suitability(15,1))
ref(1:15,1)=(/0.660, 0.500, 0.500, 0.700, 0.300, -1.000, -1.000, 0.233, 0.500, 0.500, 0.900, 0.700, 0.500, 0.300, 0.100/)
n=15
high(1:n)=(/0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000/)
good(1:n)=(/0.800, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000/)
moderate(1:n)=(/0.200, 0.600, 1.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.800, 1.000, 0.000, 0.000, 1.000, 0.000, 0.000/)
poor(1:n)=(/0.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.667, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 0.000/)
bad(1:n)=(/0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.333, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000/)

call centroid
do i=1,n
call assert_equals(ref(i,1), suitability(i,1), 0.02)
end do


end subroutine centroid_test_based_on_known_values
end module test_centroid
 


