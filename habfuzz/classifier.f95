subroutine classifier
use fdeclarations

implicit none

!V classification
ucl1=(uvla+uvlb)/2
ucl2=(ulc+uld)/2
ucl3=(umc+umd)/2
ucl4=(uhc+uhd)/2

do i=1,ii
if (dmatrix(i,1)<=ucl1) then
cmatrix(i,1)=1
else if (dmatrix(i,1)>ucl1 .and. dmatrix(i,1)<=ucl2) then
cmatrix(i,1)=2
else if (dmatrix(i,1)>ucl2 .and. dmatrix(i,1)<=ucl3) then
cmatrix(i,1)=3
else if (dmatrix(i,1)>ucl3 .and. dmatrix(i,1)<=ucl4) then
cmatrix(i,1)=4
else if (dmatrix(i,1)>ucl4) then
cmatrix(i,1)=5
end if
end do

!D classification
dcl1=(dvla+dvlb)/2
dcl2=(dlc+dld)/2
dcl3=(dmc+dmd)/2
dcl4=(ddc+ddd)/2
do i=1,ii
if (dmatrix(i,2)<=dcl1) then
cmatrix(i,2)=1
else if (dmatrix(i,2)>dcl1 .and. dmatrix(i,2)<=dcl2) then
cmatrix(i,2)=2
else if (dmatrix(i,2)>dcl2 .and. dmatrix(i,2)<=dcl3) then
cmatrix(i,2)=3
else if (dmatrix(i,2)>dcl3 .and. dmatrix(i,2)<=dcl4) then
cmatrix(i,2)=4
else if (dmatrix(i,2)>dcl4) then
cmatrix(i,2)=5
end if
end do

if (vers==1) then
!Classification of S in 8 categories
do i=1,ii
if (dmatrix(i,3) .eq. 0.020) then
cmatrix(i,3)=1
else if (dmatrix(i,3) .eq. 0.022) then
cmatrix(i,3)=2
else if (dmatrix(i,3) .eq. 0.024) then
cmatrix(i,3)=3
else if (dmatrix(i,3) .eq. 0.026) then
cmatrix(i,3)=4
else if (dmatrix(i,3) .eq. 0.030) then
cmatrix(i,3)=5
else if (dmatrix(i,3) .eq. 0.040) then
cmatrix(i,3)=6
else if (dmatrix(i,3) .eq. 0.050) then
cmatrix(i,3)=7
else if (dmatrix(i,3) .eq. 0.070) then
cmatrix(i,3)=8
end if
end do
else
scl1=(svla+svlb)/2
scl2=(slc+sld)/2
scl3=(smc+smd)/2
scl4=(sdc+sdd)/2
do i=1,ii
if (dmatrix(i,3)<=scl1) then
cmatrix(i,3)=1
else if (dmatrix(i,3)>scl1 .and. dmatrix(i,3)<=scl2) then
cmatrix(i,3)=2
else if (dmatrix(i,3)>scl2 .and. dmatrix(i,3)<=scl3) then
cmatrix(i,3)=3
else if (dmatrix(i,3)>scl3 .and. dmatrix(i,3)<=scl4) then
cmatrix(i,3)=4
else if (dmatrix(i,3)>scl4) then
cmatrix(i,3)=5
end if
end do
end if

!T classification in 5 classes
tcl1=(tvla+tvlb)/2
tcl2=(tlc+tld)/2
tcl3=(tmc+tmd)/2
tcl4=(thc+thd)/2
do i=1,ii
if (dmatrix(i,4)<=tcl1) then
cmatrix(i,4)=1
else if (dmatrix(i,4)>tcl1 .and. dmatrix(i,4)<=tcl2) then
cmatrix(i,4)=2
else if (dmatrix(i,4)>tcl2 .and. dmatrix(i,4)<=tcl3) then
cmatrix(i,4)=3
else if (dmatrix(i,4)>tcl3 .and. dmatrix(i,4)<=tcl4) then
cmatrix(i,4)=4
else if (dmatrix(i,4)>tcl4) then
cmatrix(i,4)=5
end if
end do

!Classification of IHS in 5 classes
do i=1,ii
if (dmatrix(i,5)<=ka) then
cmatrix(i,5)=1
else if (dmatrix(i,5)>ka .and. dmatrix(i,5)<=kb) then
cmatrix(i,5)=2
else if (dmatrix(i,5)>kb .and. dmatrix(i,5)<=kc) then
cmatrix(i,5)=3
else if (dmatrix(i,5)>kc .and. dmatrix(i,5)<=kd) then
cmatrix(i,5)=4
else if (dmatrix(i,5)>kd) then
cmatrix(i,5)=5
end if
end do

end subroutine classifier
